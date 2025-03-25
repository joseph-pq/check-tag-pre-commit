#!/bin/bash
set -e

# Get the latest tag (assuming it's semver)
LATEST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")

# Get the version from pyproject.toml
PYPROJECT_VERSION=$(grep -Po '(?<=^version = ")[^"]+' pyproject.toml)

if [[ -z "$LATEST_TAG" ]]; then
    echo "No existing tag found. Proceeding..."
    exit 0
fi

if [[ "$LATEST_TAG" != "v$PYPROJECT_VERSION" ]]; then
    echo "ERROR: The latest git tag ($LATEST_TAG) does not match the version in pyproject.toml (v$PYPROJECT_VERSION)."
    exit 1
fi

echo "Version check passed: Git tag and pyproject.toml version match."
