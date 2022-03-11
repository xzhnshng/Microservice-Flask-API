# README

## Project Overview

- This project is a Microservice Flask api

  - The api listen on port 5000

  - once a GET reqeust to port 5000, the request will get a responce from home page with responce data "Hi there!"

    

- CI/CD:

  - Set workflow in GitHub Action
    - do automatically code format, lint and test
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



Run the app

```
$ flask run
```



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



Go to AWS CodePipline

Create CodePipline which will be triggered by any changes on GitHub repo's main branch





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