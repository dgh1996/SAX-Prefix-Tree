%random walk
R=normrnd(0,1,100000,1);
for i = 2:100000
    R(i,1) = R(i-1,1)+ R(i,1);
end
plot(R)

%sin with noise,size 1*5000
%n = 10
%a = 6
%w = 50
%epsilon = 0.05

x_axis=0:0.1:500;
R=sin(x_axis);
noise =normrnd(0,0.1,5000,1)';
for i = 1:length(noise)
    R(1,i) = R(1,i) + noise(1,i);
end
%anomaly adding
anomaly1=1*rand(1,100);%2000-2100
for i = 1 :100
    R(1,i+2000) = R(1,i+2000)+anomaly1(1,i);
end

anomaly2=0.8*rand(1,50);%2500-2550
for i = 1 :50
    R(1,i+2500) = R(1,i+2500)+anomaly2(1,i);
end

anomaly3=0.6*rand(1,100);%3000-3100
for i = 1 :100
    R(1,i+3000) = R(1,i+3000)+anomaly3(1,i);
end

anomaly4=(-1)*rand(1,20);%3500-3520
for i = 1 :20
    R(1,i+3500) = R(1,i+3500)+anomaly4(1,i);
end

anomaly5=(-0.4)*rand(1,100);%4000-4100
for i = 1 :100
    R(1,i+4000) = R(1,i+4000)+anomaly5(1,i);
end

anomaly6=rand(1,10);%4500-4510
for i = 1 :10
    R(1,i+4500) = R(1,i+4500)+anomaly6(1,i);
end