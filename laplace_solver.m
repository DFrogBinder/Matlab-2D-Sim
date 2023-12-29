function u = laplace_solver(radius, numPoints, boundary_conditions)
    
    % Create a meshgrid in Cartesian coordinates
    [x, y] = meshgrid(linspace(-radius, radius, numPoints), linspace(-radius, radius, numPoints));
    
    % Convert to polar coordinates
    [theta, r] = cart2pol(x, y);
    
    % Find points inside the circle
    insideCircle = r <= radius;
    
    % Filter out points outside the circle
    X = x(insideCircle);
    Y = y(insideCircle);

    % Initialize the solution matrix with zeros
    u = zeros(numPoints, numPoints);

    % Apply boundary conditions
    u = set_boundary_conditions(u, x, y, radius);

    % Iterative solver
    for iteration = 1:10000
        for i = 2:numPoints-1
            for j = 2:numPoints-1
                u(j, i) = 0.25 * (u(j+1, i) + u(j-1, i) + u(j, i+1) + u(j, i-1));
            end
        end
    end
end



