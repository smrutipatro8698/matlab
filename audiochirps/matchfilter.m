

% A template is given
temp = randn(150,1);

% Create a matched filter based on the template
b = flipud(temp(:));

% For testing the matched filter, create a random signal which
% contains a match for the template at some time index
x = [randn(500,1); temp(:); randn(300,1)];
n = 1:length(x);

% Process the signal with the matched filter
y = abs(hilbert(filter(b,1,x)));
% plot(y)
% figure()
% y = xcorr(b, x);


% Set a detection threshold (exmaple used is 90% of template)
thresh = 0.9

% Compute normalizing factor
u = temp.'*temp;

% Find matches
matches = n(y>thresh*u);

% Plot the results
plot(n,y,'b', n(matches), y(matches), 'ro');
% plot(y)

% Print the results to the console
display(matches);