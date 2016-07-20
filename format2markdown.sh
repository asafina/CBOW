#!/bin/bash

file=$1

# 書き込みファイル用に拡張子を除いたファイル名を取得
fwrite=`echo $file | sed -e "s/\.[^.]*$//"`

# 改行を整える
cat $file | sed -e 's/$/  /' > $fwrite.tmp

# コメントアウト（md 記法ではタイトルにあたる）の大きさを逆にする
cat $fwrite.tmp | sed -e 's/#/######/' | sed -e 's/##/#####/' | sed -e 's/####/###/' |sed -e 's/#####/##/' | sed -e 's/######/#/' > $fwrite.md
