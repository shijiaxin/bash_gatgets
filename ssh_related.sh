#!/bin/bash

ssh -n -f cube0 "ls"

#有时候需要额外的环境变量才能执行程序
#在目标机器创建~/.ssh/environment文件，并重启ssh服务。文件内容格式如下:
PATH=/balabala

#如果需要批量同步文件,-r表示递归,-t表示保留修改时间,-u表示跳过不需要的文件,-v表示打印更多东西
rsync -rtuv ~/dir1/ machine:~/dir1/
