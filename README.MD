# Super Qi RSA Generator

it's a bash script that will generate rsa for your uat and prod environment that is required for your onboarding with SuperQi mini-app


### How to use 
```bash
./generate-rsa.sh razona
```

### Output
```
─ razona
    ├── prod
    │   ├── razona_prod_pkcs8_rsa_private_key.pem
    │   ├── razona_prod_rsa_private_key.pem
    │   └── razona_prod_rsa_public_key.pem
    └── uat
        ├── razona_uat_pkcs8_rsa_private_key.pem
        ├── razona_uat_rsa_private_key.pem
        └── razona_uat_rsa_public_key.pem
```

### Note
The private keys should be kept in a secret place and not uploaded