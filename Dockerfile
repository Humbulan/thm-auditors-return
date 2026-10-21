FROM python:3.10-slim

# Install dependencies
RUN pip install lxml

# Set working directory
WORKDIR /app

# Copy all files into the container
COPY . /app

# Make sure we can execute the python scripts
RUN chmod +x dsvw.py dssw.py

# Run both servers in the background, and keep the container alive
CMD python3 dsvw.py & python3 dssw.py & tail -f /dev/null
