#!/bin/bash

path=$1

start()
{
if [ -e /usr/local/bin/node ]; then
 node $path
 echo " "
fi
}
exit 0



stop()

{
    
}