function [ Total, Average, StandDev ] = contact( matrix )
%CONTACT function
%  
%   CITS2401        -       Computer Analysis and Visualization
%   Assignment 1    -       Semester 1/2014
%
%   21260915        -       Tiago Menegaz de Melo Garcia
%

%   Read matrix
matrix = readTable(matrix);

%   Calculate Total/Average/Standard Deviation
[Total, Average, StandDev] = countTotal(matrix);

% Plot circles
circlesPrinter(matrix);
end

function processedTable = readTable( rawTable )
%READTABlE
%   This function reads a table name (fileName) and returns a formated table
%   corresponding to that file.

%   Get table size
mySize = size(rawTable);

%   Test table dimensions
if mySize(2) > 3 
    %   If the current table is 3xN, transpose it
    processedTable = rawTable.';
elseif mySize(2) == 3 && mySize(1) == mySize(2)
    %   If the current table is Nx3, inform a warning 
    fprintf('WARNING: The current matrix is 3x3. It was assumed that the third column is the radius column.');
    processedTable = rawTable;
else
    %   If the current table is Nx3, don't do anything
    processedTable = rawTable;
end
end

function [ Total, Averange, StandDev ] = countTotal(processedTable)
%CONUNTTOTAL 
%   This function calculates total of contacting
%   circles, averange and standard deviation in table.

%   Calculate dimension
n = size(processedTable,1);

%   Set contact counter
contactCounter = zeros(n,1);

%   Check all circles
for ii = 1:n
    
    %   Look for contact between the current circle
    for jj = 1:n
        %   Don't test the same circle with itself
        if ii ~= jj
            %   If there was a contact
            if  isContact(processedTable(ii,1),processedTable(ii,2),processedTable(ii,3),processedTable(jj,1),processedTable(jj,2),processedTable(jj,3)) == 1
                %   Add a contact
                contactCounter(ii) = contactCounter(ii) + 1;
            end
        end
    end
end

%   Return Variables
Total       = (sum(contactCounter))/2;
Averange    = (mean(contactCounter))/2;
StandDev    = std(contactCounter);
end

function contact = isContact( x1, y1, r1, x2, y2, r2 )
%ISCONTACT 
%   This Function returns if there is a contact between two circles or not.
%   Using 1 for contact and 0 for non-contact

%   IF the distance between	the	centres	of two circles is less than or
%   equal to the sum of the radius
if sqrt(((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2))) <= r1 + r2
    contact = 1;
else
    contact = 0;
end
end

function circlesPrinter(processedMatrix)

%   Difine size of n
n = size(processedMatrix,1);

%   Check all n positions
for ii = 1:n
    %   Print the current circle
    plotCircles(processedMatrix(ii,1),processedMatrix(ii,2),processedMatrix(ii,3));
end
end

function plotCircles( x, y, r )
%PLOTCIRCLES
%   This function plots a circle according to its x, y and r

%   Circle formula
ang = 0:0.01:2*pi; 
xp  =r*cos(ang);
yp  =r*sin(ang);

%   Plot a circle
plot(x+xp,y+yp);

%   Keep previous circles
hold on
end