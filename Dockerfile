
# Use the official R image
FROM r-base:4.3.0

# Install required system dependencies
RUN apt-get update &&     apt-get install -y     libcurl4-openssl-dev     libssl-dev     libxml2-dev     && rm -rf /var/lib/apt/lists/*

# Install R packages
RUN R -e "install.packages(c('plumber', 'httr', 'jsonlite'), repos='https://cloud.r-project.org/')"

# Copy your Plumber API files
COPY . /app
WORKDIR /app

# Expose port
EXPOSE 8000

# Start Plumber API
CMD ["Rscript", "entrypoint.R"]
