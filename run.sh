#!/bin/bash
# 
# 运行：
# cp ./run.sh.example ./run.sh
# sudo ./run.sh
# 

#-----------------------------------
# ----- 配置目录  BEGIN ------------
#-----------------------------------

name=node

# 代码目录
code_path=/var/www

# 日志目录
logs_path=/var/log/$name

#-----------------------------------
# ----- 配置目录  END --------------
#-----------------------------------


if [ ! -f ./Dockerfile ]
then
    echo "ERROR: $PWD is error."
    exit 1
fi

#docker stop ibbd-$name 
#docker rm ibbd-$name 

docker run -it --rm --name ibbd-$name \
    -v $code_path:/var/www \
    -v $logs_path:/var/log/$name \
    ibbd/$name \
    /bin/bash
