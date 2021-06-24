# lnbits-cypherapp

Ensure you have cyphernode running with lightning.

Use the path to your lightning data in the `docker-compose.yml` to allow lnbits to access `lightning-rpc`. Also make sure to specify testnet or mainet in the path.

Within your cyphernode project

```bash
cd cyphernode/dist/apps
git clone https://github.com/vmenond/lnbits-cypherapp
cd lnbits-cypherapp
mkdir data
# data will be used by lnbits as the working directory
docker-compose up -d --build
```

