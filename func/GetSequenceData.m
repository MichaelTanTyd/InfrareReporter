 function [newTimeDouble1,newImageData] = GetSequenceData(TimeDouble1,ImageData,OneMiniut,SeriseNum)
% [newTimeDouble2,newHeightOfTopSurface] = GetSequenceData(TimeDouble2,HeightOfTopSurface,OneMiniut,Error,AllNut);

newImageData = ImageData(1,:);
newTimeDouble1 = TimeDouble1(1,:);
index = 2;
SeriseNum = 1;
while index < size(TimeDouble1,1)
    num = (TimeDouble1(index,1)- newTimeDouble1(end));
    num = num/OneMiniut;
    if num < (SeriseNum+1)
       newImageData(end+1,:) =  ImageData(index,:);
       newTimeDouble1(end+1,:) = TimeDouble1(index,:);
       index = index + 1;
    else
      newImageData(end+1,:) =  newImageData(end,:);  
      newTimeDouble1(end+1,:) = newTimeDouble1(end,:)+OneMiniut;
%       imagen = imagen + 1
    end  
   
    if  index > size(TimeDouble1,1)
        break
    end
end