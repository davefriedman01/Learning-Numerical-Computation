function fx = f(x)

fx.Value    = (x(1) - 1) ^ 2 + x(1) * x(2);
fx.Gradient = [2 * (x(1) - 1) + x(2) ; x(1)];
fx.Hessian  = [2 1 ; 1 0];