% Data from Igor. Only Tensiometer and fruit sensor - 18 days

close all
clear all

B = xlsread('Corn1.xls');
B(:,1) = B(:,1)-B(1,1)

%%
Soil20 = eliminate_duplicates(B(:,[1,3]));
Soil40 = eliminate_duplicates(B(:,[1,4]));
plot2(Soil20,1); figure(1); hold on;  plot2(Soil40,1,'g');

FruitA = B(:,[1,2]); 
FruitA = clean_stem_data2(FruitA, 100, 0);

plot2(FruitA,2);  
GrowthA = get_growth_rate(FruitA,0); 

figure(3); hold on;
plot(GrowthA(:,1),.01*GrowthA(:,2));

% plot(Soil20(:,1),.1*(Soil20(:,2)-10),'c:'); plot(Soil40(:,1),.1*(Soil40(:,2)-10),'k:');
% title('Corn - tbd enough')

Soil_DailyA = daytime_avg(Soil20);
Soil_DailyB = daytime_avg(Soil40);

[p,v]= find_daily_min_max_stem(FruitA, 0);


%%
C = merge_sort2(GrowthA,Soil20)
figure(4); hold on
plot(C(:,2),C(:,3),'rx')

f = find(B(:,1)>=8)
C2 = merge_sort2(GrowthA(f,:),Soil20(f,:))

figure(4)
plot(C2(:,2),C2(:,3),'bx')

C2(:,4) = C2(:,2).*C2(:,3)
f2 = find(C2(:,4)>2.8)
f3 = find(C2(f2,2)<.9)

%
plot(C2(f2,2),C2(f2,3),'gx')
figure(5)
plot(C2(f2(f3),2),C2(f2(f3),3),'cx')
%%
% BBB = merge_sort1(Soil_DailyA(10:end,:), [DSC(:,1),ratio])
% figure(7); plot(BBB(:,2),BBB(:,3),'o',BBB(:,2),BBB(:,3),'x')
% xlabel('Average Soil Moisture'); ylabel('Max Daily Contraction ratio')
% CORRELATION = corr2(BBB(:,2),BBB(:,3));
% 
% BBB = merge_sort1(Soil_DailyA(10:end,:), DSC)
% figure(8); plot(BBB(:,2),BBB(:,3),'o',BBB(:,2),BBB(:,3),'x')
% xlabel('Average Soil Moisture'); ylabel('Max Daily Contraction')
% CORRELATION2 = corr2(BBB(:,2),BBB(:,3));