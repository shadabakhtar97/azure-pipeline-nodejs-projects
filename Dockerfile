FROM nginx:alpine
LABEL author="Shadab Akhtar"
COPY index.html /usr/share/nginx/html
EXPOSE 80 443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]