[![Python Flask API test with GitHub Actions](https://github.com/xzhnshng/flask-hello-app/actions/workflows/main.yml/badge.svg)](https://github.com/xzhnshng/flask-hello-app/actions/workflows/main.yml)

# README

## Project Overview

- This project is a Microservice Flask API

  - The API listens on port 5000

  - Once a GET request to port 5000 is received, this request will get a response on home page with response data "Hi there!"
  
  - Project Structure:
	```
	.
	├── Dockerfile
	├── Makefile
	├── README.md
	├── __pycache__
	│   ├── application.cpython-38.pyc
	│   └── test_application.cpython-38-pytest-7.0.1.pyc
	├── app
	│   ├── __init__.py
	│   └── __pycache__
	│       └── __init__.cpython-38.pyc
	├── application.py
	├── instance
	│   ├── flask.cfg
	│   └── flask_test.cfg
	├── requirements.txt
	└── test_application.py
	```


    

- CI/CD:

  - Set workflow in GitHub Action
    - do automatically code format, lint, and test
    - based on "Makefile" and workflows-"main.yml"
  - IaC (Intrastructure as Code) used *AWS CodePipeline*
  - Deployed on *AWS Elastic BeansTalk*
  - Any changes in GitHub repo main branch will trigure automatically CI/CD
    

- (Optional) Containerization

  Used Dockerfile to build image and public the image at DockerHub

  

## Test and Run Project Locally

### Setup

Clone the repo to local

```
# use ssh
$ git clone git@github.com:xzhnshng/ids721project1.git
```



Create project with virtual environment

```
$ cd ids721project1

# Create project with virtual environment
$ python -m venv .venv
$ source .venv/bin/activate
```



Install dependencies

```
$ make install
```



### Run it

Set environment variables in terminal

```
$ export FLASK_APP=application.py
$ export FLASK_ENV=development
```



Run the app on Local

```
$ flask run
```


Test request & response on Local
Visit localhost 5000 port on browser `127.0.0.1:5000`

or 

```
$ curl 127.0.0.1:5000
```





### Test

Makefile contains install, format, lint, test logic

```python
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv test_application.py

format:
	black *.py


lint:
	pylint --disable=R,C application.py app/__init__.py

all: install format lint test
```



To simply test:

``` 
$ make test
```



To do all (install, format, lint, test):

```
$ make all
```



## CICD

Go to AWS Elastic Beanstalk

Create App and Environment
<img width="1312" alt="image" src="https://user-images.githubusercontent.com/47130690/157984797-36a1e74d-68ee-47c4-b688-332f8088085e.png">



Go to AWS CodePipline

Create CodePipline which will be triggered by any changes on GitHub repo's main branch
<img width="1376" alt="image" src="https://user-images.githubusercontent.com/47130690/157984700-db08f461-2de9-46ae-aee2-fcaf6d9c0567.png">



<img width="1163" alt="image" src="https://user-images.githubusercontent.com/47130690/157984777-9442ad52-d5b9-4111-8d7f-9908224c0577.png">



## Containerization

Build the image using the following command

```
$ docker build -t flask-hello-app:latest .
```



Run the Docker container using the command shown below.

```
$ docker run -d -p 5000:5000 flask-hello-app:latest
```

I published my docker image on DukerHub: https://hub.docker.com/repository/docker/acdnxie/flask-hello-app
<img width="1306" alt="image" src="https://user-images.githubusercontent.com/47130690/157933336-3b1999af-e785-4fd6-a790-ad9f94cd4068.png">


## Reference: 
> Individual Project 1 Requirements
> - Cloud Continuous Delivery of Microservice (MLOps or Data Engineering Focused)
> - Create a Microservice in Flask or Fast API
Push source code to Github
> - Configure Build System to Deploy changes
> - Use IaC (Infrastructure as Code) to deploy code
> - Use either AWS, Azure, GCP (recommended services include Google App Engine, AWS App Runner or Azure App Services)
> - Containerization is optional, but recommended
