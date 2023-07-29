# inception

Este é um projeto de administração de sistemas com maquinas virtuais e Docker.
Usando virtualização de imagens Docker dentro de uma maquina virtual para
rodar um servidor web com nginx, um banco de dados com mariadb e a página web com wordpress

O projeto funciona fora da maquina virtual com Alpine,
porém é possivel que ocorra algum problema com outros serviços utilizando as mesmas portas que os containers

Basta ter os pacotes das dependências instalados (make, docker e docker-compose) e rodar `make`

Também é preciso adicionar o arquivo srcs/.env contendo as credenciais que iniciarão os serviços, veja: [env](#env)

# Setup VM

Setup da maquina virtual com Alpine para rodar os containers

O Alpine é uma distribuição Linux com foco em fornecer uma plataforma mínima para
execução de contêineres e servidores, sendo especialmente popular no ecossistema de contêineres Docker

O Alpine possui imagens otimizadas para virtualização de VMs que são as imagens virtuais

## Dependências

- https://www.virtualbox.org/wiki/Downloads
- https://dl-cdn.alpinelinux.org/alpine/

## Instalação

Instalação simples, com o mínimo de recursos necessários e com as portas do ssh e do nginx liberadas no Virtual Box

Quando a imagem iniciar, rode `setup-alpine` e siga o prompt de instalação do Alpine.
É possível deixar quase todas as opções como padrão, mas lembre-se de criar uma senha root e um usuário,
também lembre-se de selecionar a partição `sda` como partição `sys`

Após o prompt, desligue a VM e remova a iso em Virtual Box -> configurações -> armazenamento

## Configurações

Como root, instale o `vim` e edite o arquivo `/etc/apk/repositories`,
remova o comentário do repositório `community` para poder instalar os repositórios da comunidade:
```sh
apk update
apk add vim
vim /etc/apk/repositories
```

Exemplo do arquivo `/etc/apk/repositories` após alteração:
```/etc/apk/repositories
#/media/cdrom/apks
http://dl-cdn.alpinelinux.org/alpine/v3.17/main
http://dl-cdn.alpinelinux.org/alpine/v3.17/community
#http://dl-cdn.alpinelinux.org/alpine/edge/main
#http://dl-cdn.alpinelinux.org/alpine/edge/community
#http://dl-cdn.alpinelinux.org/alpine/edge/testing
```

Instale os pacotes que serão usados no host e inicie o docker daemon:
```sh
apk add git make docker docker-compose
rc-service docker start
```

Gere sua chave ssh e clone o repositório git, tudo deve funcionar sem problemas

# env

Arquivo srcs/.env de exemplo:

```srcs/.env
# Nginx SSL Cert
SSL_CERT="-----BEGIN CERTIFICATE-----
CERTIFICATE HERE
-----END CERTIFICATE-----"

# Nginx SSL Key
SSL_KEY="-----BEGIN PRIVATE KEY-----
KEY HERE
-----END PRIVATE KEY-----"

# MariaDB
DB_NAME=dbname
DB_USER=dbuser
DB_USER_PASSWD=passwd
DB_HOST=dbhost

# WP admin
DOMAIN=domain
WP_TITLE=title
WP_ADMIN=admin
WP_ADMIN_PASSWD=passwd
WP_ADMIN_EMAIL=email

# WP user
WP_USER=wpuser
WP_USER_EMAIL=email
WP_USER_PASSWD=passwd
```

Basta mudar as credencias para o que desejar

Para gerar o SSL_CERT e SSL_KEY use o seguinte comando substituindo $DOMAIN pelo mesmo DOMAIN do .env:
```sh
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt -subj "/CN=$DOMAIN"
```

Os arquivos certificate.crt e private.key serão gerados contendo o SSL_CERT e SSL_KEY
