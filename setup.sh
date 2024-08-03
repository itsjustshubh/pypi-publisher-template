#!/bin/bash

# Check if .env file exists, if not, create it from .env.example
if [ ! -f .env ]; then
    cp .env.example .env
    echo ".env file created from .env.example. Please update it with your PyPI and TestPyPI tokens."
else
    echo ".env file already exists."
fi

# Install dependencies
pip install -r requirements.txt

# Make shell scripts executable
chmod +x publish_test.sh
chmod +x publish_pypi.sh

echo "Setup is complete. Please update the .env file with your PyPI and TestPyPI tokens."
