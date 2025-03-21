FROM node:alpine AS build
WORKDIR /build
COPY package.json pnpm-lock.yaml ./
RUN corepack enable && pnpm install
COPY ./ ./
RUN pnpm build

FROM node:alpine
WORKDIR /app
EXPOSE 3000
COPY --from=build /build/.output /app
CMD ["node", "./server/index.mjs"]