import csv
import random
import sys

word = sys.argv[1].lower()
number = int(sys.argv[2])


def csv_to_list(filename):
    list = []
    with open(filename, "r") as f:
        reader = csv.reader(f)
        for row in reader:
            list.append(row)
    list2 = []
    for i in list:
        list2.append([i[0].lower(),i[1].lower(), i[2].lower()])

    list2.sort(key=lambda x: x[1])
    return list2

index = csv_to_list("data/00_index.csv")

def which_file(word):
    files = []
    list1 = [m for m in index if m[1] >= word]
    list2 = [m for m in list1 if m[1] <= word]
    if list1[0] not in list2:
        list2.append(list1[0])
    files = [int(i[0]) for i in list2]
    files.append(files[len(files)-1]+1)
    return files

def bring_list(word):
    list = []
    files = which_file(word)
    for i in range(len(files)):
        list += csv_to_list(str("data/"+str(files[i]))+".csv")
    list2 = [ i for i in list if i[0] == word]
    return list2

def guess_from_list(list):
    list.sort(key=lambda x: x[2], reverse=True)
    if len(list) >= 8:
        n = 8
    else:
        n = len(list)
    list2 = []
    for i in range(n):
        list2.append(list[i])

    pos = {i[1]:int(i[2]) for i in list2}
    return (random.choice([x for x in pos for y in range(pos[x])]))

def next_word(word):
    files = which_file(word)
    list = []
    for i in range(len(files)):
        list += bring_list(word)
    next_word = guess_from_list(list)
    return next_word

def mumbler(word,number):
    list = [word]
    print word,
    for i in range (number-1):
        list.append (next_word(list[len(list)-1]))
        print list[len(list)-1],

mumbler(word, number)
