# cpp-dev-env
c++ develepment Docker Version!

# HOW TO TRY?

## First. 
you should has a workspace , in this example we have project in $HOME/src
```shell
docker run -it --rm -v $HOME/src:/root/src fightinggg/cpp-dev-env bash
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

# USING IT AS DEAMON
```shell
docker run -d \
--net host \
--privileged  \
-v  $HOME/src:/root/src \
--name cpp-dev-env \
fightinggg/cpp-dev-env \
bash -c "while true; do sleep 100; done;"
```
