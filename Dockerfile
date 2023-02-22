FROM --platform=linux/amd64 node:16-alpine
LABEL maintainer = "https://github.com/hamzanaeemm"
WORKDIR /app
COPY . .

RUN npm cache clean
RUN npm cache verify
RUN npm i -g pm2
RUN npm run build

FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html/
COPY --from=build /app/nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
EXPOSE 3002
CMD ["nginx", "-g", "daemon off;"]
