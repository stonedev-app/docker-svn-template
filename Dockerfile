# ベースイメージをUbuntuにする
FROM ubuntu:22.04

# 必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y subversion && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# リポジトリの保存場所を作る
RUN mkdir -p /var/svn

# SVNの標準ポートを開ける
EXPOSE 3690

# コンテナ起動時にsvnserveを立ち上げる
CMD ["svnserve", "-d", "--foreground", "-r", "/var/svn"]
