FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm i

COPY . .

RUN npm run build

# /app/build most important folder

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

