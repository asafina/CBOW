#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
from keras.models import Sequential
from keras.layers import Dense, Activation, Embedding, Lambda
from keras.optimizers import SGD
from keras.utils.np_utils import to_categorical
import keras.backend as K
from keras.preprocessing.text import Tokenizer

# 前処理と学習データ生成
path = "./LdaXXX_ed.utf8"
docs = []
with open(path) as f:
    docs = f.readlines()
docs = [doc for doc in docs if doc.count(" ") >= 3]

tokenizer = Tokenizer()
tokenizer.fit_on_texts(docs)
docs = tokenizer.texts_to_sequences(docs)
V = len(tokenizer.word_index)+1
dim = 100
c = 2

data = []
target = []
for doc in docs:
    for index, word in enumerate(doc):
        if index <= c-1 or index >= len(doc)-c:
            continue
        start_i = index-c
        end_i  = index+c+1
        insert_data = doc[start_i:end_i]
        insert_data.pop(c)
        data.append(insert_data)
        target.append(word)  

X_train = np.array(data)
Y_train = to_categorical(np.array(target), V)

def means(x):
    return K.mean(x, axis=1)

# モデル定義
embeddings = Sequential()
embeddings.add(Embedding(input_dim=V, output_dim=dim, init='glorot_uniform',input_length=c*2))
embeddings.add(Lambda(means, output_shape=(dim,)))
embeddings.add(Dense(V, init='glorot_uniform', activation='softmax'))

sgd = SGD(lr=0.1, decay=1e-6)
embeddings.compile(loss='categorical_crossentropy', optimizer=sgd, metrics=["accuracy"])

# 学習
embeddings.fit(X_train, Y_train, nb_epoch=100, batch_size=512, verbose=1)

# 出力
vec = embeddings.get_weights()[0]
f = open('vectors.txt' ,'w')
f.write(" ".join([str(V-1),str(dim)]))
f.write("\n")

for word, i in tokenizer.word_index.items():
    f.write(word)
    f.write(" ")
    f.write(" ".join(map(str, list(vec[i,:]))))
    f.write("\n")
f.close()
