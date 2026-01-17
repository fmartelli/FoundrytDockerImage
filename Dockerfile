FROM debian:stable-slim

# Dipendenze base
RUN apt-get update && apt-get install -y \
    curl \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Installa Foundry
RUN curl -L https://foundry.paradigm.xyz | bash

RUN curl -L https://github.com/ethereum/solidity/releases/download/v0.8.33/solc-static-linux \
    -o /usr/local/bin/solc && \
    chmod +x /usr/local/bin/solc

# Aggiunge foundry al PATH
ENV PATH="/root/.foundry/bin:/usr/local/bin:${PATH}"

# Installa gli strumenti (forge, cast, anvil)
RUN foundryup

# Directory di lavoro
WORKDIR /work

# Default entrypoint: cast
ENTRYPOINT []

