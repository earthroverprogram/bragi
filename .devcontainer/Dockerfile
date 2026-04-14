# Use the official Microsoft Dev Container base image for Debian Trixie.
# Trixie includes tex-fmt which is convenient for LaTeX development.
FROM mcr.microsoft.com/devcontainers/base:trixie

# Install uv for everyone not just the current user.
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && cp /root/.local/bin/uv /usr/local/bin/uv

# Install LaTeX.
RUN apt --quiet update \
    && apt install --assume-yes texlive-latex-extra texlive-extra-utils latexmk tex-fmt just pandoc r-base r-base-dev \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Add some labels so it looks nice in Github packages.
LABEL org.opencontainers.image.source=https://github.com/earthroverprogram/bragi
LABEL org.opencontainers.image.title="bragi image"
LABEL org.opencontainers.image.description="LaTeX writing repo with Python and R."
LABEL org.opencontainers.image.authors="Joe J Collins <joejcollins@gmail.com>"