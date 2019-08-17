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

function plotData(new_data_year,new_data_deaths1)
  plot(new_data_year,new_data_deaths1,'rx','MarkerSize',10)
  title("People less than 1 years old")
  xlabel("Years")
  ylabel("Deaths of people")
end
plotData(new_data_year,new_data_deaths1)
  
m = length(new_data_year);
X = [ones(m,1) new_data_year];
theta = (pinv(X'*X))*X'*new_data_deaths1

plotData(new_data_year,new_data_deaths1)
hold on;
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off