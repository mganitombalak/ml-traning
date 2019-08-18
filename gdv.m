x = [1 2 3; 1 3 3; 1 4 6; 1 5 3]
y = [40;60;90;70]
plot(x,y,'rx');
m = length(y)
theta = zeros(3,1)
lr = 0.05
iteration = 500
jtheta = zeros(iteration,4)
for iter = 1:iteration
    h = theta(1) + theta(2).*x(:,2) + theta(3).*x(:,3) 
    diff = h - y;
    j = (1/2*m)*sum(diff).^2;
    theta_zero = theta(1) - (lr/m)*sum(diff);
    theta_one  = theta(2) - (lr/m)*sum(diff).*x(:,2);
    theta_two  = theta(3) - (lr/m)*sum(diff).*x(:,3);
    
    theta = [theta_zero;theta_one;theta_two];
    jtheta(iter,:)=[j theta_zero theta_one theta_two];
end
thetatemp= jtheta(iteration,2:4); %min(jteta,[],1) %
h2=thetatemp(1) + (thetatemp(2)*x(:,2)+ thetatemp(3)*x(:,3));
hold on
plot(h2)
hold off
figure(2)
mesh(jtheta(2:4))
xlabel("teta0")
ylabel("teta1")
zlabel("J")

    
    
    


