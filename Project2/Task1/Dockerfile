#Python image
FROM python:3.10-slim

# Set working directory inside the container
WORKDIR /app

# Copy dependency
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all
COPY . .

# Expose port 5000 to be accessible externally
EXPOSE 5000

# Command to run the Flask application
CMD ["python", "app.py"]

