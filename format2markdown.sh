#!/bin/bash

file=$1

# �񤭹��ߥե������Ѥ˳�ĥ�Ҥ�������ե�����̾�����
fwrite=`echo $file | sed -e "s/\.[^.]*$//"`

# ���Ԥ�������
cat $file | sed -e 's/$/  /' > $fwrite.tmp

## �����ȥ����ȡ�md ��ˡ�Ǥϥ����ȥ�ˤ�����ˤ��礭����դˤ���
# �񤭹����ѥե������¸�ߤ��ǧ
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
