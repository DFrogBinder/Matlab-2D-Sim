% Solve the equation
n = 500; 
radius = 1;
u = laplace_solver(radius, numPoints, @(u, X, Y) set_boundary_conditions(u, X, Y, radius));

% Visualize the solution
surf(u);