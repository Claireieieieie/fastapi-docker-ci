# Dockerfile
FROM python:3.11-slim

# set working directory
WORKDIR /usr/src/app

# install build dependencies (if you need psycopg2 or similar you may need build-essentials)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
  && rm -rf /var/lib/apt/lists/*

# copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy app code
COPY ./app ./app

# expose port (same port uvicorn will use)
EXPOSE 8000

# run uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
