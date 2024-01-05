# Inception

This is a system administration project with Docker containers. It utilizes Docker image virtualization to run a web server with Nginx, a MariaDB database, and a WordPress webpage.

# Dependencies

Ensure that the required dependencies (make, docker, and docker-compose) are installed, and then run make.

Additionally, create the file `srcs/.env` containing the credentials that will initiate the services. See: [.env.example](srcs/.env.example).

To generate SSL_CERT and SSL_KEY, use the following command, replacing DOMAIN with the same DOMAIN in your `srcs/.env`:

```sh
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt -subj "/CN=DOMAIN"
```

The files certificate.crt and private.key will be generated containing SSL_CERT and SSL_KEY, respectively.

# Usage

Run `make` and the containers should initialize.

If any errors related to ports occur, please ensure that there are no services on your machine currently using these ports.
