#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jun 11 00:26:56 2021

@author: Eron
"""
import numpy as np
import math
import sys, random, os
from matplotlib import pyplot as plt
from mido import MidiFile, MidiTrack, Message

def get_number_of_unique_notes(mid):
    all_notes = {}
    num_notes = 96
    for i, track in enumerate(mid.tracks):
        for msg in track:
            if msg.type == ‘note_on’:
                note = msg.note - (128 - num_notes) / 2
                assert (note >= 0 and note < num_notes)
                if note not in all_notes:
                    all_notes[str(note)] = []
                else:
                    all_notes[str(note)].append(1)
    return len(all_notes)

epochs = [1,5,10,20,30,40,50,60,70,80,90,100,120]
num_notes = []
time_sig = []
ticks_per_beat = []
for i in epochs:
  mid = MidiFile(“results/input/gt” + str(i) + “.mid”)
  num_notes.append(get_number_of_unique_notes(mid))
  ticks_per_beat.append(mid.ticks_per_beat)
  time_sig.append(has_time_signature(mid))
  
import matplotlib.pyplot as plt
plt.plot(epochs, num_notes)
plt.title(“Unique Notes present in Songs By Epochs”)
plt.xlabel(“Epochs”)
plt.ylabel(“Unique Notes”)