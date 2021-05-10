#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
from os import listdir
from os.path import isfile, join
import pypianoroll

data_path = './../Pianoroll/'
filelist = [f for f in listdir(data_path) if isfile(join(data_path, f))]
print(filelist)
print(len(filelist))
print(filelist[0])


dataset = []
ii=0
while ii < len(filelist):
    f_data_path =  os.path.join(data_path, filelist[ii])
    multitrack = pypianoroll.load(f_data_path)
    print(multitrack)
    dataset.append(multitrack)
    #multitrack.trim(8, 4 * multitrack.resolution)
    #multitrack.binarize()
    #multitrack.plot()
    ii = ii+1