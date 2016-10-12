function theta = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
num_parameters = length(theta);
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    hx_array = zeros(m, 1);

    for i=1:num_parameters,
        hx_array= hx_array + theta(i) .* X(:, i);
    end

    temp = zeros(num_parameters, 1);

    for i=1:num_parameters,
        temp(i) = alpha * (1/m) *sum((hx_array - y) .* X(:, i));
    end

    theta = theta - temp;

    % disp(computeCost(X, y, theta));

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
end



end
