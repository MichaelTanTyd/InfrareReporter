## Configuration key-value pair definition of config ##

**config** is a sub-folder include config file that defined some default and global value, using key-value pair.These key-value pair are loaded in **gui_OpeningFcn** with `initConfigAppData( handles, configPath)` function, then set them as GUI's appdata.You can reset them by call func\function `[config] = resetConfigAppData( handles, configPath)`.

### Data Process Related###
below is a example ,pls append it future.

-  **defaultStep**=*2*

-  **savePath**=*'D:\Infrare\reporter\'*

-  **defaultOpenPath**=*'D:\Infrare\sourceData\'*

-  **others**=*'will be appended'*




