FROM strapi/strapi:latest
WORKDIR /srv/app
COPY . .
EXPOSE 1337
CMD ["npm", "run", "start"]
