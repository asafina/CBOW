#!/bin/bash

file=$1

# �񤭹��ߥե������Ѥ˳�ĥ�Ҥ�������ե�����̾�����
fwrite=`echo $file | sed -e "s/\.[^.]*$//"`

cat $file | sed -e 's/$/  /' > $fwrite.tmp

## �����ȥ����ȡ�md ��ˡ�Ǥϥ����ȥ�ˤ�����ˤ��礭����դˤ���
# �񤭹����ѥե������¸�ߤ��ǧ
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

# ���Ԥ�������
cat $fwrite.tmp1 | sed -e 's/$/  /' > $fwrite.md


rm $fwrite.tmp
rm $fwrite.tmp1

