FROM --platform=linux/amd64 node:16-alpine
LABEL maintainer = "https://github.com/hamzanaeemm"
WORKDIR /app
COPY . .

RUN npm i -g pm2
RUN yarn
RUN yarn build

CMD ["yarn", "start"]

EXPOSE 80
EXPOSE 3002
