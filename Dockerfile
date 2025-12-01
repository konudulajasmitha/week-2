
FROM python:3.9-slim 
# Set working directory 
WORKDIR /app 
# Copy requirements and install dependencies 
COPY requirements.txt requirements.txt 
RUN pip install -r requirements.txt 
# Copy all project files 
COPY . . 
# Expose Flask default port 
EXPOSE 5000 
# Run the Flask app 
CMD ["python", "app.py"] 
