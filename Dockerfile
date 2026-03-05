# syntax=docker/dockerfile:1
FROM ubuntu:22.04

# ---- runtime deps (certs + curl for downloading) ----
RUN apt-get update \
 && apt-get install -y wget libatomic1

WORKDIR /app

RUN wget "https://github.com/leafac/kill-the-newsletter/releases/download/v2.0.9/kill-the-newsletter--ubuntu--v2.0.9.tar.gz"
RUN tar -xzf kill-the-newsletter--ubuntu--v2.0.9.tar.gz
RUN rm kill-the-newsletter--ubuntu--v2.0.9.tar.gz

ENTRYPOINT ["/app/kill-the-newsletter/kill-the-newsletter", "/app/configuration.mjs"]
