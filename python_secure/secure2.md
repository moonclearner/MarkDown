# Python 正则表达式

## re.findall

key = re.findall('h.', http)
print key
['ht', 'hu', 'ho']

## \\.
match . must be \.

## [...]
a[abc]c
- match abc aac
a[\^abc]c
- not match abc

## A set of charcter
- \\d [0-9]
- \\D [\^\d]
- \\s [<space>\t\r\f\v]
- \\S [\^\s]
- \\w [A-Za-z0-9]
- \\W [\^\w]

## times
- \*  0 times or inf
- +   1 times or inf
- ?   0 or 1 times
- {m} m times
- {m, n}  m to n times

## logical or classify
- |   a or b abc|abd
- (...)  classify group
	- (abc){2} match abcabc
	- a(123|456)c match a456c

## compile
re.I   ingore case writing
re.L
re.M
re.S
re.U
re.X

## greed mode or not greed mode
default mode: greed mode

greed mode:
re: "ab*" match to "abbbc"
	will get "abbb"

not greed mode:
re: "ab*?"
	will get "a"

## Partice example
result = re.findall(r'title="(.*?)" onclick=', word)


# summary
- 寻找大师，跟随大师，与大师同行，洞察大师，成为大师
    知乎，ve2x.com, github.com
- gevent run in linux


