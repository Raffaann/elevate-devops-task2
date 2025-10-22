from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World! This is a simple Python app deployed via Jenkins CI/CD.'

if __name__ == '__main__':
    # By adding host='0.0.0.0', we make the app accessible
    # from outside the Docker container.
    app.run(debug=True, host='0.0.0.0')
