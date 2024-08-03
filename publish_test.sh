#!/bin/bash

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

# Function to update the version number
update_version() {
    version=$1
    sed -i '' "s/version='[0-9]*\.[0-9]*\.[0-9]*'/version='$version'/" setup.py
}

# Get the current version
current_version=$(grep version setup.py | awk -F"'" '{print $2}')

# Increment the patch version
IFS='.' read -r -a version_parts <<< "$current_version"
version_parts[2]=$((version_parts[2] + 1))
new_version="${version_parts[0]}.${version_parts[1]}.${version_parts[2]}"

# Update the version in setup.py
update_version $new_version

# Remove old builds and distribution files
rm -rf build/ dist/ airport_manager.egg-info/

# Build the package
python setup.py sdist bdist_wheel

# Commit the changes and push to GitHub
git add .
git commit -m "Update version to $new_version"
git push origin main

echo "Published version $new_version to TestPyPI and updated GitHub."
