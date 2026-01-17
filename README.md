# Introduction
<pre>
Foundry is a smart contract development toolchain.
Foundry manages your dependencies, compiles your project, runs tests, deploys, and lets you interact with the chain from the command-line and via Solidity scripts.
Use this image to execute foundry commands and build solidity files with solc or projects with Foundry forge command.
</pre>

See at [Foundry official website](https://getfoundry.sh/introduction/overview).

# Build image
docker build . -t foundry

alias foundry='docker run --rm -it -v $(pwd)/work:/work -v $(pwd)/keystore:/root/.foundry/keystores foundry'

# Use it
## Create the sample Wallet
foundry cast wallet net

## Save the private key into a Keystore
foundry cast wallet import sample-wallet --private-key 0xcc5de0454f23ed6c48471eba2a3a3b956eb17d9224b6a9faa05ca5933a9c0c49

## Retrieve wallet address
foundry cast wallet address --account sample-wallet

