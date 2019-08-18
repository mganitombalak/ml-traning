x=[1;2;3;4];
y=[2;4;6;8];
figure(1)
plot(x,y,'rx');
teta=[0;0];
lr=0.04;
m=length(y);
iteration=500;
jteta=zeros(iteration,3)
for iter=1:iteration
h=teta(1) + (teta(2)*x);
diff=h-y
j= (1/2*m)*sum(diff).^2;
teta_zero = teta(1) - (lr/m)*sum(diff)
teta_one = teta(2) - (lr/m)*sum(diff.*x);
teta=[teta_zero;teta_one]
jteta(iter,:)=[j teta_zero teta_one]
end
tetatemp= jteta(iteration,2:3)%min(jteta,[],1) %
h2=tetatemp(1) + (tetatemp(2)*x);
hold on
plot(h2)
hold off
figure(2)
plot3(jteta)
xlabel("teta0")
ylabel("teta1")
zlabel("J")


