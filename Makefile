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