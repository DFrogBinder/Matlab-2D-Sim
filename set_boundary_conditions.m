function u = set_boundary_conditions(u, x, y, R)
    % R is the radius of the circle
    [ny, nx] = size(u);
    
    for i = 1:nx
        for j = 1:ny
            % Calculate the distance from the center
            distance = sqrt(x(j, i)^2 + y(j, i)^2);  % Use full x and y matrices
            
            % Check if the point is on or near the boundary of the circle
            if abs(distance - R) < R*0.01
                u(j, i) = 1000;
            end
        end
    end
end

