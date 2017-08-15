# Roulette

{*
Author                  : NIKHIL RAZDAN
Date                    : 27th July 2017

External Files          : No External file needed or created for this pascal based program.

Summary                 : This Program is written using the Free Pascal Compiler and Lazarus IDE.
                          The Program is an analysis of game of European Roulette.
                          In European Roulette, we have total of 37 numbered slots from 0 to 36
                          on a roulette wheel and gamers bet on any of these numbers with the hope
                          that the ball stops at that number after the roulette wheel spin stops.
                          Gamers usually bet on either even or odd number and on a single number
                          for every spin with a hope that the number will eventually come up.

What Program does       : The program will run simulations which is a number of spins and for each
                          spin a random number is selected by using pascal "random()" function which
                          returns a single value between 0 to 36 for every spin and "Randomize" is
                          used to initialize random number generator.

Programmer Intervention : As per Roulette HW3 requirement, I have created a program so that the
                          user will have to select number of spins per simulation.
                          Number of acceptable spins are as followings:-
                          - 10000
                          - 1000000
                          - 10000000
                          - 100000000

Results                 : The output of the program is as per the guideline for rouletteHW3 documents.
                          Following will be the outcome of running this program per simulation:-
                          A- On average, how often does a number come up two times in a row?
                             On average, how often does a number come up three times in a row?
                          B- If you pick a PARTICULAR number, how long does it take for that number
                             to come up twice in a row? Let’s make the number 13, just for fun.
                          C- What is the longest run of evens in a row in your simulation? What is the
                             longest run of odds in a row? (0 is considered neither odd nor even)
*}
