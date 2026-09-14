# Flask Docker Practice — Part 3: Docker Compose & AWS ECR

This part continues from the Docker networking exercise. It replaces the manual multi-container setup with Docker Compose, then introduces Docker registries by pushing and pulling the Flask image with Amazon Elastic Container Registry (ECR).

## Goal

```text
Source Code
    ↓
Docker Image
    ↓
Docker Compose
 ┌──────────────┐
 │ web (Flask)  │
 │ db  (MySQL)  │
 └──────────────┘
    ↓
AWS ECR
    ↓
Push / Pull Image
    ↓
Run Pulled Image
```

---

# 1. Docker Compose

The manual networking setup required separate commands to create and configure the Flask and MySQL containers.

Docker Compose allows the multi-container application to be described declaratively in a YAML file and managed as one project.

The Dockerfile still defines how the Flask image is built. Compose defines how the application services run together.

```text
Dockerfile
→ how one image is built

Docker Compose
→ how multiple services are configured and run together
```

---

# 2. Create the Compose File

Create `docker-compose.yml` in the Flask project directory:

```yaml
services:
  web:
    build: .
    ports:
      - "5002:5002"
    depends_on:
      - db

  db:
    image: mysql:8
    environment:
      MYSQL_ROOT_PASSWORD: my-secret-pw
```

### Web Service

```yaml
web:
  build: .
```

Compose builds the Flask image using the Dockerfile in the current directory.

```yaml
ports:
  - "5002:5002"
```

Maps host port `5002` to Flask's container port `5002`.

```yaml
depends_on:
  - db
```

Starts the database service before the web service.

`depends_on` controls startup order, but does not guarantee that MySQL has completed initialization and is ready to accept connections.

### Database Service

```yaml
db:
  image: mysql:8
```

Creates the database service from the MySQL 8 image.

```yaml
environment:
  MYSQL_ROOT_PASSWORD: my-secret-pw
```

Passes the required MySQL root password as an environment variable.

---

# 3. Compose Service Discovery

In the manual networking exercise, Flask connected to:

```python
host="mydb"
```

because the MySQL container had explicitly been named `mydb`.

With Compose, the database service is named:

```yaml
db:
```

Therefore the Flask connection was changed to:

```python
host="db"
```

Compose automatically creates a network for the project and provides DNS-based service discovery.

```text
web
 │
 │ host="db"
 ↓
Compose Network
 │
 ↓
db :3306
```

There is no need to hard-code a container IP address.

---

# 4. Start the Compose Application

Start the services in detached mode:

```bash
docker compose up -d
```

Check the services:

```bash
docker compose ps
```

Compose creates the project network and starts both services.

Typical architecture:

```text
Browser
   ↓
localhost:5002
   ↓
web service
Flask :5002
   ↓
Compose network
   ↓
db service
MySQL :3306
```

---

# 5. Debugging the 500 Error

The application initially returned:

```text
500 Internal Server Error
```

The containers themselves were running, so the next step was to inspect their logs.

Database logs:

```bash
docker compose logs db
```

The MySQL logs eventually confirmed:

```text
ready for connections
```

Web logs:

```bash
docker compose logs web
```

The important error was:

```text
MySQLdb.OperationalError: (2005, "Unknown server host 'mydb' (-2)")
```

The source code had been changed from:

```python
host="mydb"
```

to:

```python
host="db"
```

but the running Flask image still contained the older application code.

This happened because the Dockerfile uses:

```dockerfile
COPY . .
```

The source code is copied into the image at build time. Editing the local file does not modify an image that has already been built.

The solution was to rebuild:

```bash
docker compose down
docker compose build --no-cache
docker compose up -d
```

After rebuilding, the Flask container contained the updated `host="db"` configuration and successfully connected to MySQL.

### Important Lesson

```text
Edit source code
      ↓
Existing image remains unchanged
      ↓
Rebuild image
      ↓
New container contains new code
```

---

# 6. Docker Registries

A Docker registry stores and distributes Docker images.

```text
Source Code
    ↓
Dockerfile
    ↓
docker build
    ↓
Docker Image
    ↓
docker push
    ↓
Registry
    ↓
docker pull
    ↓
Another machine / deployment environment
```

GitHub primarily stores the source repository, while a Docker registry stores built container images.

Common registries include Docker Hub and cloud-provider registries such as Amazon ECR.

---

# 7. Create an Amazon ECR Repository

An ECR repository named `flask-mysql` was created in AWS region `eu-west-2`:

```bash
aws ecr create-repository \
  --repository-name flask-mysql \
  --region eu-west-2
```

ECR returns a repository URI in this format:

```text
AWS_ACCOUNT_ID.dkr.ecr.REGION.amazonaws.com/flask-mysql
```

The repository URI identifies where the Docker image will be pushed.

---

# 8. Authenticate Docker to ECR

Docker must authenticate before it can push to a private ECR registry.

```bash
aws ecr get-login-password --region eu-west-2 | \
  docker login --username AWS --password-stdin AWS_ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com
```

Successful authentication returns:

```text
Login Succeeded
```

The AWS CLI obtains an ECR authentication token and passes it to Docker through standard input.

---

# 9. Tag the Image for ECR

The local image was:

```text
flask-docker-app-mysql:latest
```

Before pushing it to ECR, it was given a tag containing the ECR repository URI:

```bash
docker tag flask-docker-app-mysql:latest \
  AWS_ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest
```

Tagging does not rebuild or duplicate the application logic. It gives the image another name that identifies its registry destination.

```text
Local image
flask-docker-app-mysql:latest
        │
        │ docker tag
        ↓
ECR-qualified tag
AWS_ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest
```

---

# 10. Push the Image to ECR

Push the tagged image:

```bash
docker push AWS_ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest
```

Verify the repository images with AWS CLI:

```bash
aws ecr list-images \
  --repository-name flask-mysql \
  --region eu-west-2
```

At this point the image exists in the private ECR registry and can be pulled by authenticated systems.

---

# 11. Pull the Image Back from ECR

To verify the registry workflow, the ECR-tagged local reference was removed and then pulled back from AWS.

```bash
docker rmi AWS_ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest
```

Pull from ECR:

```bash
docker pull AWS_ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest
```

Check local images:

```bash
docker images
```

The pulled ECR image and the original local image had the same image ID, demonstrating that the registry version represented the same built image content.

```text
Build locally
     ↓
Tag
     ↓
Push to ECR
     ↓
Remove local ECR tag
     ↓
Pull from ECR
     ↓
Same image content
```

---

# 12. Run the ECR Image with MySQL

The final test combined the registry and networking concepts.

First stop the Compose stack:

```bash
docker compose down
```

Start MySQL on the existing user-defined network:

```bash
docker run -d \
  --name mydb \
  --network my-app-network \
  -e MYSQL_ROOT_PASSWORD=my-secret-pw \
  mysql:8
```

Then run the image pulled from ECR on the same network:

```bash
docker run -d \
  --name flask-ecr-app \
  --network my-app-network \
  -p 5002:5002 \
  AWS_ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest
```

Check the running containers:

```bash
docker ps
```

This completes the full workflow:

```text
Application Code
      ↓
Dockerfile
      ↓
Local Docker Image
      ↓
AWS ECR
      ↓
Pulled Docker Image
      ↓
Flask Container
      │
      │ Docker Network
      ↓
MySQL Container
```

---

# 13. Useful Docker Compose Commands

```bash
# Start services
docker compose up -d

# View services
docker compose ps

# View web logs
docker compose logs web

# View database logs
docker compose logs db

# Stop and remove Compose resources
docker compose down

# Rebuild images
docker compose build

# Force a clean rebuild
docker compose build --no-cache

# Rebuild and start
docker compose up -d --build
```

---

# 14. Useful ECR Commands

```bash
# Create repository
aws ecr create-repository --repository-name flask-mysql --region eu-west-2

# Authenticate Docker
aws ecr get-login-password --region eu-west-2 | \
  docker login --username AWS --password-stdin AWS_ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com

# Tag image
docker tag flask-docker-app-mysql:latest \
  AWS_ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest

# Push image
docker push AWS_ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest

# List images in ECR
aws ecr list-images --repository-name flask-mysql --region eu-west-2

# Pull image
docker pull AWS_ACCOUNT_ID.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest
```

---

# Key Takeaways

## Docker Compose

```text
Multiple manual docker run commands
             ↓
      docker-compose.yml
             ↓
     docker compose up
             ↓
Complete multi-container application
```

Compose provides a reproducible definition for services, networking, ports and environment variables.

## Service Discovery

```text
web
 ↓
host="db"
 ↓
Docker DNS
 ↓
db container
```

Services can communicate using Compose service names rather than hard-coded IP addresses.

## Image Lifecycle

```text
Source Code
    ↓
Build
    ↓
Image
    ↓
Run
    ↓
Container
```

Changing source code does not modify an existing image. The image must be rebuilt when application files baked into it change.

## Registry Lifecycle

```text
Local Image
    ↓
Tag
    ↓
Push
    ↓
Amazon ECR
    ↓
Pull
    ↓
Deployment
```

The registry provides a central location from which the same image can be distributed to other machines and deployment platforms.

## Overall Progression

Part 1 introduced images and containers:

```text
Dockerfile → Image → Container
```

Part 2 introduced container networking:

```text
Flask Container → Docker Network → MySQL Container
```

Part 3 adds orchestration and image distribution:

```text
              Docker Compose
                   │
          ┌────────┴────────┐
          ↓                 ↓
       Flask              MySQL
          │
          ↓
      Docker Image
          │
          ↓
       AWS ECR
          │
          ↓
   Deployment Target
```

The main lesson from this section is that Docker is not only about running individual containers. Compose provides a repeatable way to define a multi-container application, while a registry such as ECR provides a way to store and distribute the resulting images for deployment.