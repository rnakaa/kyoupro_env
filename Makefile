# イメージ名
IMAGE := atcoder-env

# マウント先ディレクトリ（ホスト側）
WORKDIR := $(CURDIR)/atcoder

.PHONY: build init shell login test submit clean

# イメージのビルド
build:
	docker build -t $(IMAGE) .

# atcoder 用ワークディレクトリ作成
init:
	mkdir -p $(WORKDIR)

# インタラクティブシェル起動（.env から認証情報を読み込み）
shell:
	docker run --rm -it \
	  --env-file .env \
	  -v $(WORKDIR):/workspace \
	  $(IMAGE)

# AtCoder へログイン
login:
	docker run --rm -it \
	  --env-file .env \
	  $(IMAGE) \
	  oj login https://atcoder.jp/

# 自動テスト（例: main.cpp を C++17 でコンパイルしてサンプルテスト実行）
test:
	docker run --rm -it \
	  --env-file .env \
	  -v $(WORKDIR):/workspace \
	  $(IMAGE) \
	  bash -lc "oj test -c 'g++ -std=c++17 main.cpp -o main && ./main'"

# 提出（--yes で確認不要）
submit:
	docker run --rm -it \
	  --env-file .env \
	  -v $(WORKDIR):/workspace \
	  $(IMAGE) \
	  bash -lc "oj submit --yes -c 'g++ -std=c++17 main.cpp -o main && ./main'"

# クリーン（ワークディレクトリ削除）
clean:
	rm -rf $(WORKDIR)

