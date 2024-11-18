FROM node:18-alpine

WORKDIR /app

RUN npm config set fetch-retry-maxtimeout 600000 \
    && npm config set fetch-retry-mintimeout 10000 \
    && npm config set fetch-retries 5

RUN npm config set registry https://registry.npmjs.org/

COPY package*.json ./

RUN npm install --network-timeout=1000000

COPY . .

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]