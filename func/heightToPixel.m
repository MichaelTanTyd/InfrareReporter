function [ PX ] = heightToPixel(imgAdapter , height)
%   将高度序列值转换为像素序列值
%   imgAdapter:采集图像与窗口尺寸适配参数，为结构体
%   imgAdapter.px_start:起始像素值,int
%   imgAdapter.px_end:终止像素值,int
%   imgAdapter.hg_start:起始高度值,double
%   imgAdapter.hg_end:终止高度值,double
%   height:高度序列，可以为向量，对应不同高度
%   PX:返回高度序列对应的像素序列，像素序列为整型
%   可以根据需要添加输入，输出参数

disp('heightToPixel')

end