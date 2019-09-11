# installer

Met 1 klik alles van Project Kastje installeren:

```sh
cd ~ && rm -rf ./installer && git clone https://github.com/Project-Kastje/installer && cd installer && sudo ./install.sh
```
(kopieer alles daarboven en voer het uit in de Raspberry Pi)

1. maakt database aan met correcte users etc
2. installeert [backend-service](https://github.com/Project-Kastje/backend-service) en database met correcte tables
3. start backend-service in aparte thread
4. installeert apache2 met php en python.
5. cleart doc root (`/var/www/html/pk`) en kloont [frontend-website](https://github.com/Project-Kastje/frontend-website)
