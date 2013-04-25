#!/bin/sh

   if [ "$GITREPO" = "" -a -d "/var/www" ] ; then
      GITREPO="/var/www"
   fi

   if [ "$GITREPO" != "" ] ; then
      DIRS="`/bin/ls -1 $GITREPO`"

      for dir in $DIRS ; do

         if [ -d $GITREPO/$dir/.git ] ; then
            #echo "$dir "
            cd $GITREPO/$dir

            message1=$(git rev-parse --abbrev-ref HEAD)
            message2=$(git log -1 --pretty=format:'%cr %ci')
            dir=`echo $dir| cut -c1-21`
            echo -n $dir "\033[34m" "\t" $message1 "\033[33m" "\t" $message2 "\033[30m \n"
        fi

      done
   else

      echo "Git repositories not found."

   fi
