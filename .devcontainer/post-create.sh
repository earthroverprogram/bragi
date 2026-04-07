#!/bin/sh

# This script is run after the container is created.
just clean
just venv

# Install pre-commit hooks
.venv/bin/pre-commit install
