FROM node:16
EXPOSE 3000
WORKDIR /usr/src/app

COPY ./unicafe .

RUN npm install
RUN npm run build
RUN npm install -g serve

CMD ["serve", "-s", "-l", "3000", "build"]