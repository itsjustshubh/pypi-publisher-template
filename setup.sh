#!/bin/bash

# Ensure the script is executable
chmod +x setup.sh

# Create a .env file if it doesn't exist
if [ ! -f .env ]; then
  cat <<EOT >> .env
TEST_PYPI_API_TOKEN=your_test_pypi_token_here
PYPI_API_TOKEN=your_pypi_token_here
BASE_URL=your_base_url_here
EOT
  echo ".env file created. Please update it with your tokens and base URL."
else
  echo ".env file already exists. Please ensure it is updated with your tokens and base URL."
fi

# Setup complete message
echo "Setup complete. You can now use the publish_test.sh and publish_pypi.sh scripts to publish your package."
