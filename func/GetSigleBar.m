function []= GetSigleBar(time,R,linewidth)
load('map.txt')
index = 1;cor1 =  map(index,:);
index = index + 1;cor2 =  map(index,:);
index = index + 1;cor3 =  map(index,:);
index = index + 1;cor4 =  map(index,:);
index = index + 1;cor5 =  map(index,:);
index = index + 1;cor6 =  map(index,:);
index = index + 1;cor7 =  map(index,:);
index = index + 1;cor8 =  map(index,:);
index = index + 1;cor9 =  map(index,:);
index = index + 1;cor10 =  map(index,:);
index = index + 1;cor11 =  map(index,:);
index = index + 1;cor12 =  map(index,:);
index = index + 1;cor13 =  map(index,:);
index = index + 1;cor14 =  map(index,:);
index = index + 1;cor15 =  map(index,:);
index = index + 1;cor16 =  map(index,:);

% linewidth = 20;
for index = 1:size(R,2)
    if R(index) <= 99
        plot(time,[index index],'Color',cor1,'LineWidth',linewidth );hold on
    elseif R(index) > 100 && R(index) <= 199
        plot(time,[index index],'Color',cor2,'LineWidth',linewidth );hold on
    elseif R(index) > 200 && R(index) <= 299
        plot(time,[index index],'Color',cor3,'LineWidth',linewidth );hold on
    elseif R(index) > 300 && R(index) <= 399
        plot(time,[index index],'Color',cor4,'LineWidth',linewidth );hold on
    elseif R(index) > 400 && R(index) <= 499
        plot(time,[index index],'Color',cor5,'LineWidth',linewidth );hold on
    elseif R(index) > 500 && R(index) <= 599
        plot(time,[index index],'Color',cor6,'LineWidth',linewidth );hold on
    elseif R(index) > 600 && R(index) <= 699
        plot(time,[index index],'Color',cor7,'LineWidth',linewidth );hold on
    elseif R(index) > 700 && R(index) <= 799
        plot(time,[index index],'Color',cor8,'LineWidth',linewidth );hold on
    elseif R(index) > 800 && R(index) <= 899
        plot(time,[index index],'Color',cor9,'LineWidth',linewidth );hold on
    elseif R(index) > 900 && R(index) <= 999
        plot(time,[index index],'Color',cor10,'LineWidth',linewidth );hold on
    elseif R(index) > 1000 && R(index) <= 1099
        plot(time,[index index],'Color',cor11,'LineWidth',linewidth );hold on
    elseif R(index) > 1100 && R(index) <= 1199
        plot(time,[index index],'Color',cor12,'LineWidth',linewidth );hold on
    elseif R(index) > 1200 && R(index) <= 1299
        plot(time,[index index],'Color',cor13,'LineWidth',linewidth );hold on
    elseif R(index) > 1300 && R(index) <= 1399
        plot(time,[index index],'Color',cor14,'LineWidth',linewidth );hold on
    elseif R(index) > 1400 && R(index) <= 1499
        plot(time,[index index],'Color',cor15,'LineWidth',linewidth );hold on
    elseif R(index) >= 1500 
        plot(time,[index index],'Color',cor16,'LineWidth',linewidth );hold on
    end
end