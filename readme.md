# Word Chain Creator  


This is my code how i solved a famous Ruby Quiz thats one of my favorite problems.

This is how the challenge goes:
 Given two words of equal length as command-line arguments, build a chain of words connecting the first to the second. Each word in the chain must be in the dictionary and every step along the chain changes exactly one letter from the previous word.

The program asks the user for the start and target word, and spits out as a result a word chain starting with the start word and ending with the last printed to STDOUT, one word per line. Print an error message if a chain cannot be found.

Here's an example:

start = duck
target = ruby

Building chain...
duck
ruck
rusk
ruse
rube
ruby
