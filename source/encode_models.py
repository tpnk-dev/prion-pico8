#!/usr/bin/env python
# coding=utf8
from PIL import Image
import io
import math
import numpy as np
import re
import argparse

def get_models():
    with open(args.models) as f:
        lines = f.read()
    
    lines = lines.split('\n\n')

    for i in range(0, len(lines)):
        lines[i] = [string.split(',') for string in lines[i].split('\n')]
    
    output = ''
    sizes = [8] * len(lines)
    positions = []

    for obj in range(0,len(lines)):
        for comp in range(0,len(lines[obj])):
            if comp != 2:
                output += '{:02x}'.format(len(lines[obj][comp]))
                sizes[obj] += len(lines[obj][comp])*2+2
            for num in range(len(lines[obj][comp])):
                
                output += '{:02x}'.format(int(lines[obj][comp][num]))
                
    for i in range(0,len(sizes)):
        print('model {}:{}'.format(i, math.floor((sum(sizes[0:i]) + len(s))/2)   ))
        positions.append(math.floor((sum(sizes[0:i]) + len(s))/2))

    print('OBJ_DATA START {}'.format(math.floor((sum(sizes[0:len(sizes)+1]) + len(s))/2)   ))
    
    return output, positions

def get_positions(positions):
    output = ''
    for pos in range(0,len(positions)):
        output += '{:04x}'.format(positions[pos])[2:] + '{:04x}'.format(positions[pos])[:2]
    
    return output

def get_funcs():
             #s,d,b,f,p,a,m
    levels = [[3,1,0,0,0,0,0], #1
              [4,1,1,0,0,0,0], #2
              [5,4,1,1,0,0,0], #3
              [1,4,2,4,5,1,0], #4
              [1,4,2,4,5,2,0], #5
              [1,2,3,4,6,2,1], #6
              [2,1,3,3,8,3,1], #7
              [1,1,4,5,9,3,2], #8
              [1,1,4,6,9,3,2], #9
              [1,1,4,5,9,3,2]] #10
    
    output = ''
    for level in levels:
        for i in range(0,len(level)):
            output += '{:02x}'.format(level[i])

    return output


# Freds72
def print_pico_memory():
    if len(s)>=16384:
        raise Exception('Data string too long ({})'.format(len(s)))

    tmp=s[:16384]
    print("__gfx__")
    # swap bytes
    gfx_data = ""
    for i in range(0,len(tmp),2):
        gfx_data = gfx_data + tmp[i+1:i+2] + tmp[i:i+1]
    print(re.sub("(.{128})", "\\1\n", gfx_data, 0, re.DOTALL))


parser = argparse.ArgumentParser()
parser.add_argument("models", help="a .txt of model data")

args = parser.parse_args()

s=""

output, positions = get_models()
s+=output

output = get_positions(positions)
s+=output

output = get_funcs()
s+=output

print_pico_memory()