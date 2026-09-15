from flask import Flask                                         # Import Flask so we can create the web application
import redis                                                    # Import the Redis Python client so Flask can communicate with Redis

app = Flask(__name__)                                           # Create our Flask application

r = redis.Redis(host='redis', port=6379)                        # Connect to the Redis service called "redis" on its default port 6379

@app.route('/')                                                 # Create the main homepage route: /
def hello():                                                    # Define the function that runs when someone visits /
    return 'Hello from my challenge container!'                 # Display our welcome message in the browser

@app.route('/count')                                            # Create another route: /count
def count():                                                    # Define the function that runs when someone visits /count
    display = r.incr('visits')                                  # Increase the Redis "visits" value by 1 and save the new number
    return f'This page has been visited {display} times!'       # Display the current visit count in the browser

if __name__ == '__main__':                                      # Only start Flask when this file is run directly
    app.run(host='0.0.0.0', port=5000)                          # Run Flask on all container interfaces using port 5000