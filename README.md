# cpp-dev-env
c++ develepment Docker Version!

# HOW TO TRY?

## First. 
you should has a workspace , in this example we have project in $HOME/src
```shell
docker run -it --rm -v $HOME/src:/root/src fightinggg/cpp-dev-env:master bash
```

## Second. 
here you can use g++, make, cmake and git
```shell
[root@2b36860c69bc /]# g++
g++: fatal error: no input files
compilation terminated.
[root@2b36860c69bc /]# make
make: *** No targets specified and no makefile found.  Stop.
[root@2b36860c69bc /]# cmake
Usage

  cmake [options] <path-to-source>
  cmake [options] <path-to-existing-build>

Specify a source directory to (re-)generate a build system for it in the
current working directory.  Specify an existing build directory to
re-generate its build system.

Run 'cmake --help' for more information.

[root@2b36860c69bc /]# git
usage: git [--version] [--help] [-C <path>] [-c <name>=<value>]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]
```

# HOW TO BUILD
```shell
docker build -t cpp-dev-env .
```

# USING With SSH BACKEND AND DEVELOPMEND WITH CLION
## First RUN BACKEND
```shell
docker run -d \
--privileged \
-p 2222:22 \
-v $HOME/src:/root/src \
--name cpp-dev-env \
fightinggg/cpp-dev-env:master
```
notices: it doesn't work on windows?  then using this
```shell
docker run -d --privileged -p 2222:22 -v $HOME/src:/root/src --name cpp-dev-env fightinggg/cpp-dev-env:master
```
## Second OPEN YOUR PROJECT USING CLION 
click File-settings-Build-Toolchains

add 'Remote Host'
```
Credentials:
  Host: localhost
  Port: 2222
  User name: root
  Authentication type: Password
  Pasword: 123456
```

![](https://github.com/fightinggg/cpp-dev-env/raw/master/20210709232106.png)
![](https://github.com/fightinggg/cpp-dev-env/raw/master/20210709232402.png)

## Thrid Enjoy Yourself
now you can use clion write program on centos platform
