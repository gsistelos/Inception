# Inception

A system administration project with Docker containers.

It utilizes Docker image virtualization to run a web server with Nginx, a MariaDB database, and a WordPress webpage.

# Dependencies

Ensure that the required dependencies (`make`, `docker`, and `docker-compose`) are installed, and then run `make`.

Additionally, create the file `srcs/.env` containing the credentials that will initiate the services. See: [.env.example](srcs/.env.example).

To generate SSL_CERT and SSL_KEY for your `srcs/.env`, you will need `openssl` installed. Run `make ssl` to generate the `certificate.crt` and `private.key`, containing SSL_CERT and SSL_KEY respectively.

Also, it's crucial to include the domain `gguedes.42.rio` in your hosts file since it may not be registered with a known DNS.

It can be done by adding the line `127.0.0.1 gguedes.42.rio` to your hosts file.

On Windows, the hosts file is located at `C:\Windows\System32\drivers\etc\hosts`.

On Unix, the hosts file is located at `/etc/hosts`.

# Usage

Run `make` and the containers should initialize.

If any errors related to ports occur, please ensure that there are no services on your machine currently using these ports.
