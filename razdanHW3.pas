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

Program razdanHW3;
uses sysutils; {* needed for DateTimeToStr function use under procedure stringtime *}
label rerun;   {* Label used to rerun the program on user's discretion after single Roulette simulation*}

Type randnumpersimarraytype =  array[0..199999999] of qword;

var {* Variables declared for the following program *}
   rousimcon :  string;
   simnumber, randnumpersim, eurroulnum, B  : integer;
   spinspersim, tworepeatcount, twodiff, twodifftemp : qword;
   threerepeatcount, threediff, threedifftemp  : qword;
   twoaverage, threeaverage : double;
   thirteendiff, even, odd, longeven, longodd : qword;
   A : longword;
   randnumpersimarray : randnumpersimarraytype;  {* Type variable used for array declaration at the start of the program *}

Procedure stringtime(strtime: string); {* Procedure used to print a string, date and time on screen *}
 begin {* Beginning of procedure stringtime *}
   writeln();
   writeln(strtime,DateTimeToStr(Now)); {* Pascal's Date time function used to print the date and time of program start and end *}
   write('Please press enter.');
   readln();
   writeln();
 end;  {* End of procedure stringtime *}

Procedure QuestionA(); {* Start of Function created with logic for Question A *}
begin
   {* Various variable initiated and were declared at the beginning of the program *}
   tworepeatcount := 0;
   twodiff := 0;
   twodifftemp := 0;
   threerepeatcount := 0;
   threediff := 0;
   threedifftemp := 0;

       for A:= 0 to spinspersim do {* For loop used to compare and go through random numbers stored in an array for each spin *}
         begin
              if (randnumpersimarray[A] = randnumpersimarray[A+1]) then {* Logic created to compare value stored in array for one pointer location to its next one *}
                  begin
                    tworepeatcount := tworepeatcount + 1;  {* From the results above incrementing the variable to keep count of occurrence of two consecutive numbers *}
                    twodiff := twodiff + twodifftemp + 1;  {* Variable used, adjusted and incremented to track down the numbers post occurrence of two consecutive number*}
                    twodifftemp := 0;
                  end
              else twodifftemp := twodifftemp + 1;

              if (randnumpersimarray[A] = randnumpersimarray[A+1]) and (randnumpersimarray[A] = randnumpersimarray[A+2]) then {* Logic created to compare value stored in array for one pointer location to its next and another next one *}
                  begin
                   threerepeatcount := threerepeatcount + 1;  {* From the results above incrementing the variable to keep count of occurrence of three consecutive numbers *}
                   threediff := threediff + threedifftemp + 1; {* Variable used, adjusted and incremented to track down the numbers post occurrence of three consecutive number*}
                   threedifftemp := 0;
                  end
              else threedifftemp := threedifftemp + 1;
         end;
end; {* End of Function created with logic for Question A *}

Procedure QuestionB(); {* Start of Function created with logic for Question B *}
begin
   B := 13;
   twodifftemp := 0;

      for A:= 0 to spinspersim do {* For loop used to compare and go through random numbers stored in an array for each spin *}
         begin
	    if ((randnumpersimarray[A] = B) and (randnumpersimarray[A+1] = B)) then thirteendiff := twodifftemp {* Logic created to compare value stored in array for one pointer location and its next one to number 13 *}
	    else twodifftemp := twodifftemp + 1;
         end;
end;  {* End of Function created with logic for Question B *}

Procedure QuestionC();  {* Start of Function created with logic for Question C *}
begin
   {* Various variable initiated and were declared at the beginning of the program *}
   longeven := 0;
   longodd := 0;
   even := 0;
   odd := 0;

      for A:= 0 to spinspersim do {* For loop used to compare and go through random numbers stored in an array for each spin *}
         begin
              if (randnumpersimarray[A]<>0) then {* Verifying if the value hold in the array for a pointer is non zero *}
                  begin
                    if ((randnumpersimarray[A] mod 2)=0)  then {* Verifying the same value is even *}
                        begin
                          even := even+1; {* If even, then increment the variable *}
                          if (even > longeven) then {* If loop used to check the value of variable even is greater than longeven, if yes, then longeven get the value of even and even is initialized to zero again *}
                              begin
                                longeven := even;  {* As mentioned above this is used to keep the variable longeven with maximum number of even number hits for all the spins*}
                                even := 0;
                              end;
                        end
                    else
                        begin
                         odd := odd + 1;  {* If the first if condition is through but not the second one then the number is obviously odd and the following logic keeps track of the count in variable longold *}
                         if (odd > longodd) then
                              begin
                                longodd := odd;
                                odd := 0;
                              end;
                        end;
                  end;
         end;
end;  {* End of Function created with logic for Question C *}

begin {********************** Start of razdanHW3 program **********************}
 rerun : repeat

  {******************************** Start of Simulation ******************************** }
  stringtime('The Roulette Simulation is starting, Date(D/M/Y) and time(H:M:S) is '); {* Procedure stringtime called as create above in the program *}

   writeln('Enter number of spins per simulation as follows:-'); {* Asking user to provide number of spins and ultimately saving the value in spinspersim variable *}
   writeln('Type 1 for 10,000 spins.');
   writeln('Type 2 for 1,000,000 spins.');
   writeln('Type 3 for 10,000,000 spins.');
   writeln('Type 4 for 100,000,000 spins.');
   writeln();
   write('Enter 1 or 2 or 3 or 4: ');
   readln(simnumber);
   if (simnumber = 1) then spinspersim := 10000;
   if (simnumber = 2) then spinspersim := 1000000;
   if (simnumber = 3) then spinspersim := 10000000;
   if (simnumber = 4) then spinspersim := 100000000;
   writeln();
   writeln('You have selected ', spinspersim , ' Spins for this Simulation.');

      {* Start of the Code to choose one number out of 0 to 36 per simulation per spin using pascal random function and storing it in an array *}
      randomize;  {* Using Pascal random number generator *}
      eurroulnum := 37; {* Initializing variable to provide total number in a european roullette *}
      for A:=0 to spinspersim do
        begin
         randnumpersim := random(eurroulnum); {* Calling random() function for 37, this will provide a single number that will be saved in an array *}
         randnumpersimarray[A] := randnumpersim;
        end;
      {* End of the Code to choose one number out of 0 to 36 per simulation per spin using pascal random function and storing it in an array *}


      {* Start of Code for Question A using function QuestionA() *}
       QuestionA(); {* Calling function for Question A as created at the start of the program *}
       if(tworepeatcount > 0) then
           begin
             twoaverage := (twodiff div tworepeatcount); {* created average for numbers coming two times in a row by using two variables from the QuestionA() function *}
             writeln();
             writeln('*****Result of Question A part one.*****');
             writeln('A number came up twice in a row on an average of ', twoaverage:5:3 , ' numbers per simulation.');
           end
       else writeln('wow! no number came up twice for this simulation.');

       if(threerepeatcount > 0) then
           begin
             threeaverage := (threediff div threerepeatcount); {* created average for numbers coming three times in a row by using two variables from the QuestionA() function *}
             writeln();
             writeln('*****Result of Question A part two.*****');
             writeln('A number came up thrice in a row on an average of ', threeaverage:5:3 , ' numbers per simulation.');
           end
       else writeln('wow! no number came up thrice for this simulation.');
      {* End of Code for Question A using function QuestionA() *}


      {* Start of Code for Question B using function QuestionB() *}
      QuestionB();  {* Calling function for Question B as created at the start of the program *}
      if (thirteendiff > 0) then
           begin
             writeln();
             writeln('*****Result of Question B with PARTICULAR number 13.*****');
             writeln('It took ', thirteendiff, ' numbers for ', B, ' to come up twice in this Simulation.');
           end
      else writeln('wow! number ', B, ' never came up twice in this simulation.');
      {* End of Code for Question B using function QuestionB() *}


      {* Start of Code for Question C using function QuestionC() *}
      QuestionC(); {* Calling function for Question C as created at the start of the program *}
      writeln();
      writeln('*****Result of Question C*****');
      writeln('The Longest run of the Even number is ', longeven, ' for this Simulation.');
      writeln('The Longest run of the Odd number is ', longodd, ' for this Simulation.');
      {* End of Code for Question C using function QuestionC() *}


   stringtime('The Roulette Simulation ended, Date(D/M/Y) and time(H:M:S) is '); {* Procedure stringtime called as create at the start of the program *}
  {******************************** End of Simulation ******************************** }

  {* Start of Code for Repetition of simulation *}
  write('Do you want to try another roulette_simulation? Type yes or no:');
  readln(rousimcon);
  if(rousimcon = 'yes') then goto rerun; {* calling rerun label at the start of the razdanHW3 program *}
  {* End of Code for Repetition of simulation *}
 until rousimcon = 'no';

end.  {********************** End of razdanHW3 program **********************}
