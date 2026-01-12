# Build Stage
FROM node:20-slim AS builder

RUN apt update -y && apt install -y openssl

WORKDIR /app

COPY package*.json ./
COPY prisma ./prisma/
COPY tsconfig.json ./
RUN npm install


COPY . .
RUN npx prisma generate
RUN npm run build

# Production Stage
FROM node:20-slim

RUN apt update -y && apt install -y openssl
WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma
COPY --from=builder /app/package*.json ./

EXPOSE 3001
ENV NODE_ENV=production
CMD ["npm", "run", "start"]


