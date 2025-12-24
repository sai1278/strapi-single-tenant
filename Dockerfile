# Strapi v5 requires Node >=20
FROM node:20-alpine

WORKDIR /app

# Copy dependency files first
COPY backend/package*.json ./

# Install dependencies (clean, reproducible)
RUN npm ci

# Copy Strapi source
COPY backend .

# Build admin panel
RUN npm run build

EXPOSE 1337

CMD ["npm", "start"]
