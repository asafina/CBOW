#!/bin/bash

file=$1

# 書き込みファイル用に拡張子を除いたファイル名を取得
fwrite=`echo $file | sed -e "s/\.[^.]*$//"`

# 改行を整える
cat $file | sed -e 's/$/  /' > $fwrite.tmp

## コメントアウト（md 記法ではタイトルにあたる）の大きさを逆にする
# 書き込み用ファイルの存在を確認
if [ ! -f $fwrite.md ];then
    # touch $fwrite.md
    echo "aru";
fi
func1(){
    echo $line | sed -e 's/#/######/'
}
func2(){
    echo $line | sed -e 's/##/#####/'
}
func3(){
    echo $line | sed -e 's/###/####/'
}
func4(){
    echo $line | sed -e 's/####/###/'
}
func5(){
    echo $line | sed -e 's/#####/##/'
}
func6(){
    echo $line | sed -e 's/######/#/'
}
func7(){
    cat $fwrite.tmp | while read line;do 
                          for i in line;do
                                   word=(`echo $line`)
                                   echo ${word[0]};
                                   if [ "#" =  "${word[0]}" ];then
                                       func1 >> $fwrite.md
                                   elif [ "##" =  "${word[0]}" ];then
                                       func2 >> $fwrite.md
                                   elif [ "###" =  "${word[0]}" ];then
                                       func3 >> $fwrite.md
                                   elif [ "####" =  "${word[0]}" ];then
                                       func4 >> $fwrite.md
                                   elif [ "#####" =  "${word[0]}" ];then
                                       func5 >> $fwrite.md
                                   elif [ "######" =  "${word[0]}" ];then
                                       func6 >> $fwrite.md
                                   else                                       
                                       echo $line >> $fwrite.md
                                   fi
                          done
                      done

}
func7

rm $fwrite.tmp
