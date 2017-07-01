function [t1,t2] = CutDataWithTime(TimeDouble1,StartTime,EndTime,Error)


for index = 1:size(TimeDouble1,1)
    if TimeDouble1(index) > StartTime || abs(TimeDouble1(index)-StartTime) < Error 
        t1 = index;
        break
    end
end
for index = size(TimeDouble1,1):-1:1
    if TimeDouble1(index) < EndTime || abs(TimeDouble1(index)-EndTime) < Error 
        t2 = index;
        break
    end
end