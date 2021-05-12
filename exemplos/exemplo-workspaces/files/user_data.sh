apt update
apt install -y nginx
systemctl start nginx
systemct enable nginx
echo "<h1> Impacta Turma 04 - Infraestrutura as a Code</h1>" > /var/www/html/index.nginx-debian.html
