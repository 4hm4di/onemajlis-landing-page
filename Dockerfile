# OneMajlis landing page — static site served by nginx.
# Coolify: Build Pack "Dockerfile", Dockerfile Location "/Dockerfile", Ports Exposes 80.
FROM nginx:1.27-alpine

# Our server config replaces the default one
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Site files (everything else is excluded by .dockerignore)
COPY *.html robots.txt sitemap.xml site.webmanifest favicon.ico styles.css script.js /usr/share/nginx/html/
COPY img/ /usr/share/nginx/html/img/
COPY js/ /usr/share/nginx/html/js/
COPY fonts/ /usr/share/nginx/html/fonts/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1/healthz || exit 1
