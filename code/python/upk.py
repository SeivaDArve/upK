print('Hello World')

with open('readme.txt', 'r') as f:
    lines = f.read()
    print(lines, end="")

with open('../img/upk-ascii-text', 'r') as f:
    lines = f.read()
    print(lines, end="")
