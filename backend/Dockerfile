FROM python:3.8-buster

# リアルタイムでログを見れるように環境変数を指定
ENV PYTHONUNBUFFERD 1

# pycファイルへの書き込みを防ぐ
ENV PYTHONDONTWRITEBYTECODE 1

# コンテナ上の作業するディレクトリを変更
WORKDIR /backend

# アプリケーションを実行するためのユーザを作成する
RUN adduser --disabled-password --gecos "" user

# ユーザをrootから変更
USER user
ENV PATH $PATH:/home/user/.local/bin

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# ローカルのbackendディレクトリをコンテナにコピー
COPY . /backend
