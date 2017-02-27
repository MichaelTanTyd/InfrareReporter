function [ HG ] = pixelToHeight(imgAdapter , pixel)
%   将像素序列值转换为高度序列值
%   imgAdapter:采集图像与窗口尺寸适配参数，为结构体
%   imgAdapter.px_start:起始像素值,int
%   imgAdapter.px_end:终止像素值,int
%   imgAdapter.hg_start:起始高度值,double
%   imgAdapter.hg_end:终止高度值,double
%   pixel:像素序列，可以为向量，对应不同像素
%   HG:返回像素序列对应的高度序列，高度序列可为浮点型
%   可以根据需要添加输入，输出参数

disp('pixelToHeight')

end