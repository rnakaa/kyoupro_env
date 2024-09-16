# 競プロ専用Docker環境
- cli提出・採点が初めから入っています

# 設定・使い方
## 起動
### [初回]
1. `docker build -t competitive-programming-oj .`
2. `docker run -it --name cp-env-oj competitive-programming-oj`

### [2回目以降]
- docker start -ai cp-env-oj
## ojの基本操作
### 問題ダウンロード
`oj d https://atcoder.jp/contests/agc001/tasks/agc001_a`

### テスト 
`oj t`

### 提出
`oj s main.cpp`
