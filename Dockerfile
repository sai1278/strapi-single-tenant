# Strapi v5 requires Node >=20
FROM node:20-alpine

WORKDIR /app

# Copy dependency files first
COPY backend/package.json ./

# Install dependencies (no lock file)
RUN npm install --no-audit --no-fund

# Copy Strapi source
COPY backend .

# Build Strapi admin
RUN npm run build

EXPOSE 1337

CMD ["npm", "start"]
