FROM python:3.8

LABEL maintainer="zhnshngxie@gmail.com"

COPY . /src

WORKDIR /src

EXPOSE 5000:8080

RUN pip install -r requirements.txt

ENTRYPOINT ["python"]
CMD ["app.py"]