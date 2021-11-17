% Model: ln(lux) = c1 + c2*ln(analog)
analogReading = readmatrix('C:\Users\aidan\Documents\PHYS 2910G\Arduino Project\AnalogData.xlsx');
illuminance = readmatrix('C:\Users\aidan\Documents\PHYS 2910G\Arduino Project\Illuminance');
    

% Take log of matrices
analogReadingLogged = zeros(34,1);
illuminanceLogged = zeros(34,1);
for i=1:34
    analogReadingLogged(i,1) = log(analogReading(i,1));
    illuminanceLogged(i,1) = log(illuminance(i,1));
end

% Coeffcient Matrix
A = zeros(34,2);
for i=1:34
    A(i,1) = 1;
    A(i,2) = analogReadingLogged(i,1);
end

% Solution Matrix
b = illuminanceLogged;

% Least-Squares Solution
c = A\b;

relation = @(x)exp(-1.6453)*x.^1.5974;
scatter(analogReading,illuminance);
hold on;
plot(analogReading,relation(analogReading));


