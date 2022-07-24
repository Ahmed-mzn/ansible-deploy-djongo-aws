server {
    listen 80;
    server_name {{domain}};

    location /static/ {
        alias /var/www/static/;
    }

    location / {
        proxy_pass http://unix:{{run_sock_file}};
    }
}