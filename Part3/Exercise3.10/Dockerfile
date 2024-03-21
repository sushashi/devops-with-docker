FROM node:16-alpine AS building
WORKDIR /usr/src/app
COPY ./unicafe .
RUN npm install
RUN npm run build


FROM alpine
WORKDIR /usr/src/app
RUN apk add --update nodejs npm && npm install -g serve && adduser --disabled-password appuser
COPY --from=building /usr/src/app/build /usr/src/app/build

USER appuser
EXPOSE 3000

CMD ["serve", "-s", "-l", "3000", "build"]