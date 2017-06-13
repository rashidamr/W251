
# This program reads a pre-processed txt fil and cuts it to several csv files of 1000 rows

import csv

# Calculate no. of lines in the txt file
def file_len(fname):
    with open(fname) as f:
        for i, l in enumerate(f):
            pass
    return i + 1

length = file_len('count.txt')


f = open('count.txt', 'rt')
f_array = f.readlines()
f.close()


index = []
list = []

# Cut the files into 1000 rows files
for i in range (int(length/1000)):
    list.append([i+1, 1000*i+1,1000*i+1000])
list.append([i+2, 1000*i+1001, int(length)])

def generate_files(file_name, line_start, line_finish):
    f = open('count.txt', 'rt')
    for i in range(line_start,line_finish):
        line = f_array[i].split()
        with open(str(file_name)+".csv", "a") as fp:
            wr = csv.writer(fp, dialect='excel')
            wr.writerow(line)
        if not line:
            break
    first_word = line[0]
    last_word = line[1]
    f.close()
    index = [file_name, first_word, last_word]
    with open("00_index.csv", "a") as fp:
        wr = csv.writer(fp, dialect='excel')
        wr.writerow(index)

# Generate csv's
for i in list:
    generate_files(i[0], i[1], i[2])
