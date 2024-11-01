# Cobol
Cobol

A collection of exercises and projects written in the Cobol programming language.

## Factorial
This GNU-COBOL script computes and prints the factorial of a hardcoded value (@ NUMB) 
Below is an example of what you would write to run the program and the resulting output for a NUMB value of 9 (Default value)

Usage:
cobc --debug -free -x -o factorial factorial.cob
./factorial  

## Guesser
Enter the number of arrays, guesses, and array sizes will be determined from this value. Afterwards begin guessing numbers within any of the arrays created. If the value guessed is in an array you will be shown the array. Once you have found all the arays you win. If you reach the maximum amount of alloted failed guesses, you loose. You may also win by guessing all of the numbers.

## Sublist
This GNU-COBOL script computes the sublist (S) of a list (L) begining from the first prime number and ending at the last perfect square and cubing all the numbers included in between the two. Should conditions be absent for creating this an empty sublist is returned. Below is an example usage of the program
Enter the number of elements (N) in the list (L): 
5
Enter N elements of L
4
3
6
8
9