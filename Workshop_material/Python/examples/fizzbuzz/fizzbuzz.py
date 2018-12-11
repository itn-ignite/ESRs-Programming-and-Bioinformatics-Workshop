#!/usr/bin/env pyhton3

def fizzbuzz(iters):
    for i in range(iters):
        print(i, ": ", end='')
        if i % 3 == 0:
            print("fizz", end='')
        if i % 5 == 0:
            print("buzz", end='')
        print('')

fizzbuzz(20)

