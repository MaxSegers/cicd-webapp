# Alpine image is way smaller in size
# dockerignore for excluding unnecessary files
FROM node:18-alpine
WORKDIR /app

# Install dependencies in seperate layer (this can significantly speed up the build process).
COPY ./package.json ./yarn.lock ./
RUN yarn install --frozen-lockfile
COPY ./ .
EXPOSE 3000
CMD ["yarn", "start"]