FROM debian:buster
WORKDIR /app
COPY ./src/ /app
RUN bash build.sh
CMD [ "bash" ]