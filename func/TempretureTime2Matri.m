function Time_Data = TempretureTime2Matri(TimeData)
data_year = datestr(TimeData, 'yyyy');
data_month = datestr(TimeData, 'mm');
data_day =  datestr(TimeData, 'dd');
data_hour = datestr(TimeData, 'HH');
data_min = datestr(TimeData, 'MM');
data_seco = datestr(TimeData, 'SS');

data_year = str2num(data_year);
data_month = str2num(data_month);
data_hour = str2num(data_hour);
data_day = str2num(data_day);
data_min = str2num(data_min);
data_seco = str2num(data_seco);

Time_Data = [data_year,data_month,data_day,data_hour,data_min,data_seco];