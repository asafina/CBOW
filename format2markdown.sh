#!/bin/bash

file=$1

# �񤭹��ߥե������Ѥ˳�ĥ�Ҥ�������ե�����̾�����
fwrite=`echo $file | sed -e "s/\.[^.]*$//"`

# ���Ԥ�������
cat $file | sed -e 's/$/  /' > $fwrite.tmp

# �����ȥ����ȡ�md ��ˡ�Ǥϥ����ȥ�ˤ�����ˤ��礭����դˤ���
cat $fwrite.tmp | sed -e 's/#/######/' | sed -e 's/##/#####/' | sed -e 's/####/###/' |sed -e 's/#####/##/' | sed -e 's/######/#/' > $fwrite.md
