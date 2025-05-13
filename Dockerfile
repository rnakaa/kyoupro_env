# ベースイメージ
FROM ubuntu:22.04

# 基本ツール類のインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      g++ \
      gcc \
      python3 \
      python3-pip \
      curl && \
    rm -rf /var/lib/apt/lists/*

# online-judge-tools のインストール
RUN pip3 install --no-cache-dir online-judge-tools

# 作業ディレクトリを /workspace に設定
WORKDIR /workspace

# デフォルトのシェル
ENTRYPOINT ["bash"]

