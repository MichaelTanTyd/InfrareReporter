## Interface function of func ##

**func** is a sub-folder include some functions to process all sensor data , some function have been implemented ,some are not.

### Data Process Related###
for the detai input and out param, pls see source code definition.

- `function [ infrareData ] = getInfrareCameraData( filepath )`

not implemented

- `function [ extSenData ] = getExternalSensorData( filepath )`


not implemented

- `function [ allData ] = combineAllSensorData( infrareData,extSenData )`


not implemented

- `function [ Temp_H_t ] = getTemperatureVsTime( allData ,height )`

not implemented

- `function [ Pre_H_t ] = getPressureVsTime( allData ,height )`

not implemented

- `function [ LRA_H_t ] = getHeightOfLRAVsTime( allData)`

not implemented , **LRA** means **Latosolic Red Area**(赤红带)

- `function [ TG ] = getTemperatureGradient(allData , timeVector)`

not implemented 

- `function [ TS_H_t ] = getHeightOfTopSurfaceVsTime( allData  )`

not implemented 

- `function [ PX ] = heightToPixel(imgAdapter , height)`

not implemented 

- `function [ HG ] = pixelToHeight(imgAdapter , pixel)`

not implemented 

### GUI Operate Related ###
for the detai input and out param, pls see source code definition.

- `function [ ] =initConfigAppData( handles, configPath)`

already implemented

- `function [config] = resetConfigAppData( handles, configPath)`

already implemented

### Drawing figure Related ###
for the detai input and out param, pls see source code definition.

- `function [ ] = drawTemperatureVsTime(handle,TG ,opt )`

not implemented

- `function [ ] = drawPressureVsTime(handle,Pre_H_t ,opt )`

not implemented

- `function [ ] = drawtTemperatureGradient(handle,TG ,opt )`

not implemented

- `function [ ] = drawtHeightOfLRAVsTime(handle,LRA_H_t ,opt )`

not implemented

- `function [ ] = drawtHeightOfTopSurfaceVsTime(handle,TS_H_t ,opt )`

not implemented


