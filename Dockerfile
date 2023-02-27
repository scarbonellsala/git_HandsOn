# Start from debian linux image (DockerHub)
FROM debian:stable

# Add custom label
LABEL maintainer "scarbonell <silvia.carbonell@crg.eu>" \
      version "0.1" \
      description "Build my docker image for seqClass.py"

# Install Python (after apt-get update)
RUN apt-get update && apt-get install -y python3

# Make the folder '/scripts' in the container
RUN mkdir /scripts

# Copy 'seqClass.py' to the folder '/scripts' in the container
ADD seqClass.py /scripts

# Give execution permissions to seqClass.py
RUN chmod +x /scripts/seqClass.py

# Add /scripts folder to the PATH environment variable
ENV PATH="$PATH:/scripts"
