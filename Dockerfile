# FROM mcr.microsoft.com/devcontainers/anaconda:0-3
FROM mcr.microsoft.com/devcontainers/miniconda:0-3

# Premake the virtual environment so it can be used for testing and deployment.
COPY environment.yml /tmp/conda/
RUN conda env create --file /tmp/conda/environment.yml

# Remove the security so the any user can use or remove the virtual environment.
RUN sudo chmod -R 777 /opt/conda/

LABEL org.opencontainers.image.description DESCRIPTION="Docker container for image processing training."
