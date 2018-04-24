%fix missing led data using interpl function

b = LEDXdata(Duration(1):Duration(end),1);
[zeros, ~] = find(b == 0);
bz = b;
bz(zeros,:) = [];

cz = Duration';
cz(zeros,:) = [];
y = Duration(zeros)';
x = interp1(cz,bz,y,'spline');
b(zeros) = x; 
plot(b)
