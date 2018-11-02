function Time_Data = Time2Matri(TimeData)
TimeData(:,1) = TimeData(:,1)+datenum('30-Dec-1899');
A = datestr(TimeData(:,1));
data_year = A(:,8:11);
if strcmp(A(1,4:6), 'Jan')
    data_month = 1;
elseif strcmp(A(1,4:6), 'Feb')
    data_month = 2;
elseif strcmp(A(1,4:6), 'Mar')
    data_month = 3;
elseif strcmp(A(1,4:6), 'Apr')
    data_month = 4;
elseif strcmp(A(1,4:6), 'May')
    data_month = 5;
elseif strcmp(A(1,4:6), 'Jun')
    data_month = 6;
elseif strcmp(A(1,4:6), 'Jul')
    data_month = 7;
elseif strcmp(A(1,4:6), 'Aug')
    data_month = 8;
elseif strcmp(A(1,4:6), 'Sep')
    data_month = 9;
elseif strcmp(A(1,4:6),  'Oct')
    data_month = 10;
elseif strcmp(A(1,4:6),  'Nov')
    data_month = 11;
elseif strcmp(A(1,4:6),  'Dec')
    data_month = 12;
end
data_month(1:size(A,1),1) = data_month;
data_day =  A(:,1:2);
data_hour = A(:,13:14);
data_min = A(:,16:17);
data_seco = A(:,19:20);

data_year = str2num(data_year);
data_hour = str2num(data_hour);
data_day = str2num(data_day);
data_min = str2num(data_min);
data_seco = str2num(data_seco);

Time_Data = [data_year,data_month,data_day,data_hour,data_min,data_seco];