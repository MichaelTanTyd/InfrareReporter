function Temp = GetTemp(M,Length)
Temp = [1,1]; % 最好做个处理
for index = 2:Length
    if M(index) <= 99
        if Temp(end,1) ~= 1
            Temp(end+1,1) = 1;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=100 &&  M(index) <199
        if Temp(end,1) ~= 2
            Temp(end+1,1) = 2;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=200 &&  M(index) <299
        if Temp(end,1) ~= 3
            Temp(end+1,1) = 3;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=300 &&  M(index) <399
        if Temp(end,1) ~= 4
            Temp(end+1,1) = 4;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=400 &&  M(index) <499
        if Temp(end,1) ~= 5
            Temp(end+1,1) = 5;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=500 &&  M(index) <599
        if Temp(end,1) ~= 6
            Temp(end+1,1) = 6;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=600 &&  M(index) <699
        if Temp(end,1) ~= 7
            Temp(end+1,1) = 7;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=700 &&  M(index) <799
        if Temp(end,1) ~= 8
            Temp(end+1,1) = 8;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=800 &&  M(index) <899
        if Temp(end,1) ~= 9
            Temp(end+1,1) = 9;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=900 &&  M(index) <999
        if Temp(end,1) ~= 10
            Temp(end+1,1) = 10;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=1000 &&  M(index) <1099
        if Temp(end,1) ~= 11
            Temp(end+1,1) = 11;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=1100 &&  M(index) <1199
        if Temp(end,1) ~= 12
            Temp(end+1,1) = 12;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=1200 &&  M(index) <1299
        if Temp(end,1) ~= 13
            Temp(end+1,1) = 13;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=1300 &&  M(index) <1399
        if Temp(end,1) ~= 14
            Temp(end+1,1) = 14;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=1400 &&  M(index) <1499
        if Temp(end,1) ~= 15
            Temp(end+1,1) = 15;
        end
        Temp(end,2) = Temp(end,2) + 1;
        
    elseif M(index) >=1500
        if Temp(end,1) ~= 15
            Temp(end+1,1) = 15;
        end
        Temp(end,2) = Temp(end,2) + 1;
    end
    
end