function [ output_args ] = main( input_args )
% Lydia Noureldin
% main function that executes Part 1 (Least-Squares Crossing Lines) and 
% Part 2 (Least-Squares Planar Registration) code 

% Part 1
A4Q1; 
[ focus, RMSerror ] = leastSqCrossingLines(PlanarPoints, SpatialPoints);
%disp(focus)
%disp(RMSerror)

% Part 2
aP = load('aP.dat'); 
aQ = load('aQ.dat'); 
[aR, at, aRMSerror] = leastSqPlanar(aP, aQ);

% disp(aR); 
% disp(at); 
% disp(aRMSerror);

bP = load('bP.dat'); 
bQ = load('bQ.dat'); 
[bR, bt, bRMSerror] = leastSqPlanar(bP, bQ);

% disp(bR); 
% disp(bt); 
% disp(bRMSerror);

cP = load('cP.dat'); 
cQ = load('cQ.dat'); 
[cR, ct, cRMSerror] = leastSqPlanar(cP, cQ);

% disp(cR); 
% disp(ct); 
% disp(cRMSerror);

dP = load('dP.dat'); 
dQ = load('dQ.dat'); 
[dR, dt, dRMSerror] = leastSqPlanar(dP, dQ);

% disp(dR); 
% disp(dt); 
% disp(dRMSerror);
end

