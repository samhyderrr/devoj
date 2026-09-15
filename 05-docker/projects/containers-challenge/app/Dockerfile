FROM python:3.8-slim

WORKDIR /app

COPY . .

RUN pip install flask redis

EXPOSE 5000

CMD ["python", "app.py"]

#FROM      → What do I start with?
#WORKDIR   → Where am I working?
#COPY      → What files do I put inside?
#RUN       → What needs installing?
#EXPOSE    → What port does my app use?
#CMD       → What starts the application?