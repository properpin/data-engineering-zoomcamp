FROM python:3.9.1

# RUN apt-get install wget
# RUN pip install pandas sqlalchemy psycopg2
RUN pip install pandas

# the location in the image container where we put the copied file
WORKDIR /app

# copy the file from source to the docker image with the same name
# COPY ingest_data.py ingest_data.py  
COPY pipeline.py pipeline.py

ENTRYPOINT [ "python", "pipeline.py" ]