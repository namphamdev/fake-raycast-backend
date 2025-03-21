FROM node:alpine
WORKDIR /build
COPY package.json pnpm-lock.yaml ./
RUN corepack enable && pnpm install
COPY ./ ./

EXPOSE 3000
CMD ["npm", "run", "dev"]