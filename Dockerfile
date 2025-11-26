#satge1 : build stage
FROM node:18 As build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

#Stage2 : Runtime stage
FROM node:18-slim
WORKDIR /app
COPY --from=build /app /app
EXPOSE 3000
CMD ["node", "index.js"]
