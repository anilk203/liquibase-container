from flask import Flask
from collections import OrderedDict 
from flask import jsonify 
from flask import request

app = Flask(__name__)
  
       
@app.route("/")
def root():
  return "liquibase container is up and running!"
  
if __name__ == "__main__":
    gunicorn_logger = logging.getLogger('gunicorn.error')
    app.logger.handlers = gunicorn_logger.handlers
    app.logger.setLevel(gunicorn_logger.level)    
    app.run(debug=True)  
  