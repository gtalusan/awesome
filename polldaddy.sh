#!/bin/sh
BALLOT=xyz
ANSWER=abc

AWESOME=`wget http://polldaddy.com/poll/$BALLOT --no-cookies -q -O - | grep javascript:vote | cut -d'(' -f2 | cut -d')' -f1`
IFS=','
set -- $AWESOME
shift
wget "http://polldaddy.com/vote.php?va=10&pt=1&r=1&p=$BALLOT&a=$ANSWER,&o=&t=$5&token=`echo $9 | sed -e s/\'//g`" --no-cookies -q -O /dev/null
