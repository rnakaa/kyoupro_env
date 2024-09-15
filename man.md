docker build -t competitive-programming-oj .

#初回
docker run -it --name cp-env-oj competitive-programming-oj

#2回目以降
docker start -ai cp-env-oj


#ダウンロード
oj d https://atcoder.jp/contests/agc001/tasks/agc001_a

#テスト
oj t

#提出
oj s main.cpp
