# README

Aplicação PWA feito em Ruby on Rails para leitura de codigo de barras para falicitar cadastro e gerenciamento de metas para arrecadação de alimentos

criação dos certificados

docker run --rm \
  -p 443:443 -p 80:80 --name letsencrypt \
  -v "webapp_certs:/etc/letsencrypt" \
  -v "webapp_certs-data:/var/lib/letsencrypt" \
  certbot/certbot certonly -n \
  -m "nogueiraaoki@gmail.com" \
  -d team-yellow.ddns.net \
  --standalone --agree-tos
  
