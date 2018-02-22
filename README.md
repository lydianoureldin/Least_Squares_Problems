# Least_Squares_Problems
Lydia Noureldin 
April 11 2017

Least-Squares Problems implemented in MATLAB 7

Please refer to the technical document for an in-depth explanation of the problems, algorithm and code.

Least-Squares Crossing Lines (Part 1):
There is a set of data that are on the XY plane and a matching set of data in space that represent lines of an X-ray. The data given do not perfectly cross. The function will model the X-rays as coming from a point source. This function estimates the focus as the point that minimizes line error.

Least-Squares Planar Registration (Part 2):
Given corresponding sets of XY points. These points are rotated, translated, and may have “noise” added to simulate a real-world situation. This function will recover the least-squares rotation matrix and translation vector that brings each point from the original set to the translated set. 

Running instructions:
1. execute the Matlab command “A4Q1”. The data is in a file of Matlab code that creates the data for you. If you execute the Matlab command A4Q1 then you will find the variables PlanarPoints and SpatialPointsthat are the data. 
2. Execute the main function 
