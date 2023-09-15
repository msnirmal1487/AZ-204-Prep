# Compile and build angular app
FROM node:latest as build

WORKDIR /usr/local/app

COPY ./ /usr/local/app

RUN npm install

RUN npm run build

# serve the angular app with nginx server

FROM nginx:latest

COPY --from=build /usr/local/app/dist/angular-container-demo /usr/share/nginx/html

EXPOSE 80

#docker run -p 4200:80 angular-docker-demo:v1.0 ##portMapping localhostPort:containerPort