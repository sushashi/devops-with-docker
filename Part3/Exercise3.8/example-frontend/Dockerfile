FROM node:16-alpine as building
WORKDIR /usr/src/app
COPY . .
ENV REACT_APP_BACKEND_URL='http://localhost:8080'
RUN npm install && npm run build

FROM alpine
WORKDIR /usr/src/app
RUN apk add --update nodejs npm && npm install -g serve && adduser --disabled-password appuser
COPY --from=building /usr/src/app/build /usr/src/app/build

USER appuser
EXPOSE 5000

CMD ["serve", "-s", "-l", "5000", "build"]