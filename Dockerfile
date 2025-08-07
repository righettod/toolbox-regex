FROM node:13-alpine
# Use Node v13 because sass do not support v14 for the moment
# docker build -t righettod/regexr -f Dockerfile-regexr .
# docker run -p 3000:3000 righettod/regexr
RUN apk update
RUN apk add bash dos2unix git grep sed
RUN npm install --ignore-scripts --global gulp-cli
RUN git clone --depth 1 https://github.com/gskinner/regexr.git /regexr
COPY add-protections.sh /regexr/add-protections.sh
RUN dos2unix /regexr/add-protections.sh
RUN chmod +x /regexr/add-protections.sh
RUN cd /regexr && bash add-protections.sh
RUN addgroup -S appgroup
RUN adduser -S runner -G appgroup
RUN chown -R runner:appgroup /regexr
USER runner
RUN cd /regexr && npm install
EXPOSE 3000
EXPOSE 3001
WORKDIR /regexr
CMD ["gulp"]
