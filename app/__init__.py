from flask import Flask


def create_app(config_filename=None):
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_pyfile(config_filename)

    # a simple api that says hello
    @app .route('/')
    def hello_world():
        return 'Hi there!'

    return app

