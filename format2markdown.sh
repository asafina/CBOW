#!/bin/bash

file=$1

# 書き込みファイル用に拡張子を除いたファイル名を取得
fwrite=`echo $file | sed -e "s/\.[^.]*$//"`

cat $file | sed -e 's/$/  /' > $fwrite.tmp

## コメントアウト（md 記法ではタイトルにあたる）の大きさを逆にする
# 書き込み用ファイルの存在を確認
if [ -f $fwrite.md ];then
    rm $fwrite.md
fi
touch $fwrite.md
if [ -f $fwrite.tmp1 ];then
    rm $fwrite.tmp1
fi
func1(){
    echo $line | sed -e 's/#/*/'
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
                                       func1 >> $fwrite.tmp1
                                   elif [ "##" =  "${word[0]}" ];then
                                       func2 >> $fwrite.tmp1
                                   elif [ "###" =  "${word[0]}" ];then
                                       func3 >> $fwrite.tmp1
                                   elif [ "####" =  "${word[0]}" ];then
                                       func4 >> $fwrite.tmp1
                                   elif [ "#####" =  "${word[0]}" ];then
                                       func5 >> $fwrite.tmp1
                                   elif [ "######" =  "${word[0]}" ];then
                                       func6 >> $fwrite.tmp1
                                   else                                       
                                       echo $line >> $fwrite.tmp1
                                   fi
                          done
                      done

}
func7

# 改行を整える
cat $fwrite.tmp1 | sed -e 's/$/  /' > $fwrite.md


rm $fwrite.tmp
rm $fwrite.tmp1

