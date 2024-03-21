FROM node:16-alpine
EXPOSE 5000
WORKDIR /usr/src/app

COPY . .

ENV REACT_APP_BACKEND_URL='http://localhost:8080'

RUN npm install && npm run build && npm install -g serve && adduser --disabled-password appuser && rm -rf /usr/src/app/node_modules

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]