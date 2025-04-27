# ベースイメージをUbuntuにする
FROM ubuntu:22.04

# 必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y subversion && \
    apt-get install -y vim && \
    apt-get install -y iputils-ping && \
    apt-get install -y net-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*