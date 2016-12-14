classdef SourceData < handle
    %	Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        infrare_path % 热像仪导出文件路径及名称
        sensor_path  % 外部传感器导出文件路径及名称
        
        infrarethemal_temp % 红外温度数据
        thermocouple_temp  % 热电偶温度数据
        pressure % 微负压数据
        hight % 料位高度数据
        
    end
    
    methods
        function data=SourceData(infrare_path, sensor_path, varargin)
            data.infrare_path=infrare_path;
            data.sensor_path=sensor_path;
            data.infrarethemal_temp=[1 2 3 4];
            data.thermocouple_temp=[4 3 2 1];
            data.pressure=[6 7 8 9];
            data.hight =[6 7 5 6]
        end
    end
    
end

