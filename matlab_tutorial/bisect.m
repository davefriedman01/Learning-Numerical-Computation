function c = bisect(fn, a, b, tol)

% c = bisect('fn', a, b, tol)
%
% This function locates a root of the function fn on the interval
% [a, b] to within a tolerahasnce of tol. It is assumed that the function
% has opposite signs at a and b.

% Evaluate the function at the endpoints and check to see if it
% changes sign.

fa = feval(fn, a);
fb = feval(fn, b);

if fa * fb >= 0
  error('The function must have opposite signs at a and b')
end

% The flag done is used to flag the unlikely event that we find
% the root exactly before the interval has been sufficiently reduced.

done = 0;

% Bisect the interval

c = (a + b) / 2;

% Main loop

while abs(a - b) > 2*tol & -done

  % Evaluate the function at the midpoint
  
  fc = feval(fn, c);
  
  if fa * fc < 0      % The root is to the left of c
    b  = c;
    fb = fc;
    c  = (a + b) / 2;
  elseif fc * fb < 0  % The root is to the right of c
    a  = c;
    fa = fc;
    c  = (a + b) / 2;
  else
    done = 1;
  end
end