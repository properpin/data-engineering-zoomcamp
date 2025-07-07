FROM python:3.9.1

# RUN apt-get install wget
# RUN pip install pandas sqlalchemy psycopg2
RUN apt-get install wget
RUN pip install pandas sqlalchemy psycopg2

# the location in the image container where we put the copied file
WORKDIR /app

# copy the file from source to the docker image with the same name
# COPY ingest_data.py as ingest_data.py  
COPY ingest_data.py ingest_data.py

ENTRYPOINT ["python", "ingest_data.py"]