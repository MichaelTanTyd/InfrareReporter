classdef SourceData < handle
    %	Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        infrare_path % �����ǵ����ļ�·��������
        sensor_path  % �ⲿ�����������ļ�·��������
        
        infrarethemal_temp % �����¶�����
        thermocouple_temp  % �ȵ�ż�¶�����
        pressure % ΢��ѹ����
        hight % ��λ�߶�����
        
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

