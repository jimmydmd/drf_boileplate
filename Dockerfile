FROM python:3.9


# Install ssh client 
RUN apt-get update && apt-get install -y openssh-client

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Copy the dependencies file to the working directory

COPY requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY . /app

# Start ssh tunnel
CMD ["uvicorn", "core.asgi:application", "--host", "0.0.0.0", "--port", "8090"]


# CMD python manage.py runserver 0.0.0.0:8090