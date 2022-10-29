FROM python:3.9
RUN apt-get update && apt-get install -y --no-install-recommends postgresql-client && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["gunicorn", "-k", "eventlet", "mysite.wsgi","-b", "0.0.0.0:8000"]