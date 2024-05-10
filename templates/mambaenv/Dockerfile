FROM ubuntu:latest

# Install system and development packages
RUN apt update && apt install -y \
  curl \
  bzip2 \
  ca-certificates \
  make \
  unzip \
  software-properties-common

# Install and setup micromamba
RUN curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
RUN ./bin/micromamba shell init -s bash -p ~/micromamba

# Create environment from file
COPY environment.yml .
RUN ./bin/micromamba create -y -f environment.yml
RUN rm environment.yml

# Start bash at container startup
CMD ["/bin/bash"]
