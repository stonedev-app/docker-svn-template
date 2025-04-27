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

# リポジトリの保存場所を作る
RUN mkdir -p /var/svn/repos

# リポジトリを作成する
RUN svnadmin create /var/svn/repos

# svnserve.confをコピーする
COPY conf/svnserve.conf /var/svn/repos/conf/svnserve.conf

# passwdをコピーする
COPY conf/passwd /var/svn/repos/conf/passwd

# SVNの標準ポートを開ける
EXPOSE 3690

# コンテナ起動時にsvnserveを立ち上げる
CMD ["svnserve", "-d", "--foreground", "-r", "/var/svn"]
