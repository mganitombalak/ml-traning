x=[1 0;1 1;1 2;1 3]
y=[2.5;3;3.7;4]
m = length(y)
theta=[0;0]
JTheta=[0 0 0]
lr=0.01
for iter =1:100
h=theta(1) + (theta(2)*x)
J= (1/2*m) * sum(h-y).^2
theta_zero=theta(1)-(lr/m)*sum(h-y)
theta_one=theta(2)-(lr/m)* x(:,2)'*h
theta =[theta_zero,theta_one]
JTheta(end+1,:)=[J(1) theta_zero(1) theta_one(1)]
endfor
mesh(J)