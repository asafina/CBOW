#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys, os, math
# import numpy as np
# import scipy as sp
# import ROOT
# import pyfits as pf

#デフォルトエンコードを変更するために sys をリロード
reload(sys)
#デフォルトエンコードを ascii から utf-8 に変更
sys.setdefaultencoding("utf-8")

hikisuu = sys.argv

#第一引数に読み込みファイルのパスを指定
#（第零引数には実行ファイル名、"cbowPBL.py" が入る）
path = hikisuu[1]

#########################################################################################
#################################### python の勉強 #######################################
## http://www.phontron.com/slides/nlp-programming-ja-00-intro.pdf

#print 二通りの記述方法
print ("path: %s" % (path))
print "path: " + path #format が共通している場合のみ使用可

my_var = 5

if my_var == 4:
    print "4."
else :
    print "not 4."

for i in range (1, my_var):
    # print "i: " + i #これはフォーマットが合っていないので使えない
    print ("i: %d" % (i))

my_list = [1, 2, 3, 4, 5]
print my_list
print ("1+1 = %d" % my_list[1])
my_list.append(6)
print my_list
print (len(my_list))

# 改行
print("")
print ;

for a in my_list:
    print(a)

for i in range (3, 6):
    print ("%d: %d" % (i, my_list[i]))

my_dict = {"朝比奈": 22}

print u"あいうえお"
print my_dict

print "defaultencoding:", sys.getdefaultencoding()

my_dict2 = {"alice": 23, "alan": 24}
print (len(my_dict2))

my_var2 = "abcde"
print my_var2
print (len(my_var2))

my_var3 = "日本語"
print my_var3
print (len(my_var3))

my_var4 = u"日本語"
print my_var4
print (len(my_var4))

#dict のキーを utf-8 で標準出力したい場合、dict -> list -> var のようにたらいまわしにする
my_dict3 = {my_var4: 25}
my_var6 = my_dict3.keys()
my_var7 = my_var6[0]
print my_var7.encode("utf-8")


#########################################################################################

