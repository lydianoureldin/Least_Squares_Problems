function [ focus, RMSerror ] = leastSqCrossingLines( PlanarPoints, SpatialPoints )
% Lydia Noureldin
% This function calculates the focus point given two datasets, PlanarPoints
% and SpatialPoints. It also calculates the RMS error of the focus point.
% It displays a plot containing the PlanarPoints, SpacialPoints, focus
% points, and the lines of best fit. 
% The algorithm used here is based on the paragraph "CENTER OF PROJECTED
% LINES" in "3D and Least-Squares Geometry – Lines" notes (class 28)
% provided by Dr. Randy E. Ellis
% PARAMETERS: PlanarPoints (data that are on the XY plane), 
%             SpacialPoints (data in space)
% RETURN: focus (the point that minimizes line error)
%         RMSerror (root mean squared error) 

% Estimate the focus as the point that minimizes line error
% PlanarPoints and SpacialPoints have the same dimentions 
[n, m] = size(PlanarPoints); 

% get direction vector for each each line by getting the difference
direction = SpatialPoints - PlanarPoints; 

% get unit direction vector by normalizing it 
normDirection = normc(direction); 

% set up the left hand side and right hand side of the
% equation to estimate the focus 
left = zeros(n); 
right = zeros(n, 1); 

% find the sums  
for i=1:m
    % calculate Dj for the jth column for I - [dj * dj']
    Dj = eye(n) - (normDirection(:, i) * normDirection(:,i)');
    % add it to the sum to give the left and right sides of the equation 
    left = left + Dj' * Dj; 
    right = right + Dj' * Dj * PlanarPoints(:, i); 
end 

% get focus by solving matrix equation  
focus = left \ right; 

% get the closest points 
closePoint = zeros(n, m);
for i=1:m
    x = dot(focus, normDirection(:, i)) - dot(PlanarPoints(:, i), normDirection(:, i));
    closePoint(:,i) = PlanarPoints(:,i) + x * (normDirection(:, i));
end 

% Calculate RMS error 
RMSerror = 0; 
for i=1:m
    % get the risidual vector for the mth column
    risidualVector = ((eye(n) - normDirection(:, i) * normDirection(:, i)')...
        * focus) - ((eye(n) - normDirection(:, i) * normDirection(:, i)') * PlanarPoints(:, i)); 
    RMSerror = RMSerror + dot(risidualVector, risidualVector); 
end
RMSerror = sqrt(RMSerror / m); 

% Display results 
% Plot with spatial (green) and planar (blue) points and 
% estimated focus (red)
scatter3(SpatialPoints(1,:),SpatialPoints(2,:),SpatialPoints(3,:),'green')
hold on
scatter3(PlanarPoints(1,:),PlanarPoints(2,:),PlanarPoints(3,:), 'blue')
hold on
scatter3(focus(1,1),focus(2,1),focus(3,1),'red')

% add in calculated line equations 
for i=1:m
    line([PlanarPoints(1, i), SpatialPoints(1, i), closePoint(1, i)], ...
        [PlanarPoints(2, i), SpatialPoints(2, i), closePoint(2, i)], ... 
        [PlanarPoints(3, i), SpatialPoints(3, i), closePoint(3, i)]); 
end 

% label plot 
title('Given Initial Points & Focus'); 
xlabel('x'); 
ylabel('y');
zlabel('z'); 



