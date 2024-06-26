# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install spaCy and the en_core_web_sm model
RUN pip install --upgrade pip && \
    pip install flask spacy flask-cors jsonlines && \
    python -m spacy download en_core_web_sm

# Expose port 5000 for the Flask app
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app.py

# Run the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]