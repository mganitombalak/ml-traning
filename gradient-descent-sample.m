clear all
clc
data=csvread("usamortality.csv")
year = data(:,1);
deaths1 = data(:,2)
deaths24= data(:,3);
deaths44= data(:,4);
deaths64= data(:,5);
deaths65= data(:,6);
totaldeaths = data(:,7)

data2010 = data(1:49,:)
new_data_year = data2010(:,1);
new_data_deaths1  = data2010(:,2);
new_data_deaths24 = data2010(:,3);
new_data_deaths44 = data2010(:,4);
new_data_deaths64 = data2010(:,5);
new_data_deaths65 = data2010(:,6);
new_data_totaldeaths = data2010(:,7);
scaled_new_data_deaths1 = (new_data_deaths1.-mean(new_data_deaths1))./std(new_data_deaths1)
scaled_new_data_year = (new_data_year.-mean(new_data_year))./std(new_data_year)
m = length(new_data_year)
learningRate=0.01
theta=[0;0]
for iter=1:1000
    h = theta(1) + (theta(2)*scaled_new_data_year);
    theta_zero = theta(1) - (learningRate/m) * sum(h - scaled_new_data_deaths1);
    theta_one  = theta(2) - (learningRate/m) * sum((h - scaled_new_data_deaths1) .* scaled_new_data_year);
    theta = [theta_zero; theta_one];
endfor

