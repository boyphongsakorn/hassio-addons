FROM ubuntu:bionic
RUN mkdir /app
WORKDIR '/app'
RUN apt-get update
RUN apt-get install ca-certificates -y
RUN update-ca-certificates
COPY . /app
RUN chmod 0755 /app/playit-aarch64-0.4.6
CMD /app/playit-aarch64-0.4.6