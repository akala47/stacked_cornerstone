% Morse Keyer Function V7
% A.Kalaskar
% Made to read the serial monitor of the arduino circuit with code
% uploaded to facilitate one way communication and translation of morse 
% code to the serial monitor using a button in the circuit. Additionally,
% this function enables data collection and writes the data to a csv file.
% Made for Team Chimera
% Thank you to Prof. Brian O'Connell for the help with the serial
% communication code and debugging.

function MorseKeyer7 (app, gradeInp, ageInp)



% Establishes the arduino object
X = serialportlist;
Port = X(end);
arduinoObj = serialport(Port,9600);


% Declares the variables 
sumtimes = 0; % For the timer 
correctCounter = 0; % For the number of correct letters inputted. Will be 
% used to calculate user accuracy
rightWrong = 0; % To add to the table, 0 for 
DT = table; % Table that will be modified during the code run and will be 
% written to the csv file.

% An array of the letters listed in an order of increasing morse code
% complexity
correctLetterList = ["E","T","I","M","A","N","S","R","O","U","F","D","W","G","K","H","B","J","Q","V","X","Y","Z","C","P","L"];


%% Code provided by Prof.O'Connell
% Essentially allowing MATLAB to listen to the Arduino serial monitor
pause(0.05); % allow time to establish the object


% Configure the terminator, so that the feed recognizes a carriage return
% as the end of a line. So everytime you use Serial.println() in the
% arduino, that will queue up a new line on the serial buffer

configureTerminator(arduinoObj,"CR/LF");

% Readline reads the next line and you could possibly have a few so you'll
% want to use flush to clear it so you're just waiting for the next

% character
flush(arduinoObj);

% So assuming you're looking for a 5 letter word
iter = 1; % This variable serves the purpose of an iterator counter which
% helps in cycling through each expected character.
% Cycle through each expected character



%% Goes through each iteration for each letter in the correctLetterList 
% array and checks whether the letter inputted is correct or no.

% While the iteration is less than 27 and the timer label text is not equal
% to 0(indicating that the time has elapsed)
while iter < 27 && strcmp(app.Label.Text,"0") ~= 1
%   Begin a secondary timer
    tic

%   Read that from the serial monitor and load into an array
    y1 = readline(arduinoObj);% Reads the translated letter
    y2 = readline(arduinoObj);% Reads the morse code

%   Used in initial testing to test output
    app.Debug1.Text = "";
    app.Debug2.Text = "";

%   Included to avoid glitches and long response times
    if(strcmp(y1, " ") == 1)
        break;
    end

    disp(y1); % For reference
    disp(y2); % For reference

    % letter input in morse code

    % Used for time elapsed
    sumtimes = sumtimes + toc; 

%   Based on the iterator variable, the image changes and the input is
%   displayed on the game tab. This is done using switch and case
%   statements on the iterator variable.
%   For each iteration of the loop, the image changes and the command line
%   is read again to display on the app. The 0.2s pause is included to give
%   a gap of 0.2s before the next letter pops up on the screen.
    switch(iter)
        case 1
            app.Image.ImageSource = 'Images /E.jpg';
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /T.jpg';

        case 2
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /I.jpg';


        case 3
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /M.jpg';
            

        case 4
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /A.jpg';

        case 5
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /N.jpg'; 
            
        case 6
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /S.jpg';


        case 7
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /R.jpg';


        case 8
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /O.jpg';

        case 9
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /U.jpg';

        case 10
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /F.jpg';
        case 11
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /D.jpg';

        case 12
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /W.jpg';

        case 13
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /G.jpg';

        case 14
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /K.jpg';

        case 15
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /H.jpg';

        case 16
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /B.jpg';

        case 17
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /J.jpg';

        case 18
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /Q.jpg';

        case 19
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /V.jpg';

        case 20
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /X.jpg';

        case 21
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /Y.jpg';

        case 22
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /Z.jpg';

        case 23
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /C.jpg';

        case 24
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /P.jpg';

        case 25
            app.LetterInputDynamic.Text = y1;
            app.MorseInputDynamic.Text = y2;
            pause(0.2);app.LetterInputDynamic.Text = "";app.MorseInputDynamic.Text = "";
            app.Image.ImageSource = 'Images /L.jpg';
    end
%       For each iteration of the loop, the rightwrong variable is set to 0
%       if the letter inputted was wrong and 1 if it was right.
        if strcmp(correctLetterList(iter),y1)
            correctCounter = correctCounter+1;
            rightwrong = 1;
        else
            rightwrong = 0;
        end
%   addTable is a single row table that contains the data of one
%   iteration. 
%   Horizontal concatenation of the the table:
    addTable = array2table([gradeInp, ageInp, correctLetterList(iter), y1, rightwrong, toc]);
%   DT is the table that will be appended to the existing spreadsheet.
%   Vertical concatenation of addTable to the existing table of data of the
%   user inputs:
    DT = [DT ; addTable];    
        
%   Increment the iterator by one 
    iter = iter+1;

end



%% This portion of the code deals with table appending and data management

% Displays DT in the command line for reference
disp(DT);

% Stores the existing spreadsheet to a variable as a table
x = readtable('rough5.csv');

% Existing table appended with the new user's data is is stored in the
% existing addTable variable.
addTable = [x;DT];

% Writes the table to the csv file to update the data
writetable(addTable, 'rough5.csv');

% Resets the image in the Game Tab.
app.Image.ImageSource = 'Images /E.jpg';


% Calculates and displays the user's accuracy and speed in characters per
% minute
accuracy = correctCounter/height(DT)*100;
app.accuracyOutput.Text = sprintf('%.2f', accuracy);
wpm = height(DT)*2;
app.averageSpeedOutput.Text = sprintf('%d', wpm);

    

end
