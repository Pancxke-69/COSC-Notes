192.168.65.10, 10.50.38.121 (Windows)
192.168.65.20, 10.50.30.231 (Linux)

                                            Day 1
--------------------------------------------------------------------------------------------------------
$type() function
  this will print out the data type declared in parenthesis

$typcasting [ str() int() float() bool() list() tuple()]

'a' * 15 
  PRINTS: 'aaaaaaaaaaaaaaa'

$REPL [ >>> ] #when you type 'python3' in the terminal, it is the prompt thingy

$square brackets signify lists

$list() is 'mutable'
  [0] is the first element
  [-1] is the last element
  [-2] is the second to last element

$tuple() is 'imutable' #meaning it cannot be changed, like vector in c++ can be changed but the default array cannot

$appending to list
  cosc.append('3') #appends to the end of the list

$example format()
  a = 'Hello'
  b = 'World!'
  '{} {}'.format(a,b)

$example split()
  'hello:world'.split(':') #this splits things by the ':' character
  PRINTS: hello', 'world'

$example join()
  password = 'my', 'pwd', 'sucks'
  join(password)

#example code
  email = 'last@domain.com'
  blank = []
  a = email.split('@')[0]
  b = (email.split('@')[1]).split('.')
  blank.append(a)
  blank.append(b[0])
  blank.append(b[1])
  
  print(blank)
  PRINTS: ['last', 'domain', 'com']

#example code different way
  print(('.'.join(email.split('@'))).split('.'))
  PRINTS: The same thing as the above code


                                              Day 2
--------------------------------------------------------------------------------------------------


                                              Day 3
---------------------------------------------------------------------------------------------------

#example function
def makedeck():
    deck = []
    suits = ['\u2660','\u2666','\u2666','\u2663']
    ranks = 'A',2,3,4,5,6,7,8,9,10,'J','Q','K'
    for suit in suits:
        for rank in ranks:
            deck.append(f'{rank}{suit}'
    print(deck)
makedeck()

$range()

>>> range(10)
PRINTS: range(0,10)
>>> list(range(10))
PRINTS: [0,1,2,3,4,5,6,7,8,9]

$slicing
[Start:Stop:Step]

#example slicing
ten = [1,2,3,4,5,6,7,8,9,10]
>>>ten[0:1:]
PRINTS: [1]
>>>ten[0:-1:]
PRINTS: [1,2,3,4,5,6,7,8,9]
>>>ten[:-1:]
PRINTS: [1,2,3,4,5,6,7,8,9]
>>>ten[::-1]
PRINTS: [10,9,8,7,6,5,4,3,2,1]

$dictionary
#example dictionary
party = {'first':{'Gengar':'ghost'}}
party['second'] = {'Pidgey':'normal'}
>>> party
PRINTS: {'first': {'Gengar': 'ghost'}, 'second': {'Pidgey': 'normal'}}

$random
#example
def q1(*args):
    sum = 0
    for i in args:
        sum += i
    print(f'{args} added together is {sums})
q1(1, 2, 3, 4, 5)
PRINTS: (1, 2, 3, 4, 5) added together is 15

#opening files examples
fp = open("test.txt")
with open("test.txt", 'r') as fp
    fp.write('First line\n')
    lines = ['Second line\n', 'Third line\n', 'Fourth line\n', 'Last line\n']
    fp.writelines(lines)

#this example gets the first word of each line of the given '.txt'
emotions = []
with open('emotion_words.txt') as fp:
    for line in fp:
        emotions.append(line.split()[0])
