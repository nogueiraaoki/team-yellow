# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

criação dos certificados

docker run --rm \
  -p 443:443 -p 80:80 --name letsencrypt \
  -v "webapp_certs:/etc/letsencrypt" \
  -v "webapp_certs-data:/var/lib/letsencrypt" \
  certbot/certbot certonly -n \
  -m "nogueiraaoki@gmail.com" \
  -d team-yellow.ddns.net \
  --standalone --agree-tos
  
