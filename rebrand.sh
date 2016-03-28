#/bin/sh
CWD=$(pwd)
if [ "$UID" -eq "0" ]; then
	printf %b "No need to run me as root. Please try again.\n"
	exit 1
fi
if [ "$CWD" = "/tmp" ]; then
 printf%b "Dont run me from /tmp. Please try again.\n"
 exit
fi
for i in TARGET customization.msg elilo.SlackBuild eliloconfig help.msg \
   message.msg setup.ll.eliloconfig  slack-desc; do
   if [ ! -f elilo/$i ]; then
     printf %b "The file $CWD/elilo/$i is missing. Please try again\n"
     exit
   fi
done
if [ ! -d $CWD/elilo ]; then 
   printf %b "There should exist a source directory $CWD/elilo. Please try again.\n"
   exit
fi
printf "Name of the distribution for which eliloconfig will be used: "  
read TARGET
if [ "$(<elilo/TARGET)" = "$TARGET" ]; then
  printf %b "Already done.\n"
  exit
fi
if  echo $TARGET|LC_CTYPE=C grep "[^[:alpha:]]"; then
  printf %b "Only non accented letters are allowed in the name. Please try again.\n"
  exit
fi
if [ $(echo $TARGET|wc -c) -lt 4 ] || [ $(echo $TARGET|wc -c) -gt 12 ]; then
  printf %b "The name should have between 3 and 12 characters. Please try again.\n"
  exit
fi
if [ -d /tmp/elilo-$TARGET ]; then
  printf %b "Please (re)move the directory /tmp/elilo-$TARGET then try again.\n"
  exit
fi
mkdir /tmp/elilo-$TARGET

cp -a elilo/* /tmp/elilo-$TARGET
cd elilo
OLDTARGET=$(<TARGET)
sed "s/$OLDTARGET/$TARGET/g" eliloconfig > /tmp/elilo-$TARGET/eliloconfig
oldlength=${#OLDTARGET}
newlength=${#TARGET}
unset mystring
if [ $oldlength -lt $newlength ]; then
  mydiff=$(($newlength-$oldlength))
  while [ $mydiff -gt 0 ]; do
    mystring="$mystring "
    mydiff=$(($mydiff-1))
  done
  sed "/$OLDTARGET/s@$OLDTARGET/elilo.conf$mystring@$TARGET/elilo.conf@" \
  customization.msg > /tmp/elilo-$TARGET/customization.msg
else
  mydiff=$(($oldlength-$newlength))
  while [ $mydiff -gt 0 ]; do
    mystring="$mystring "
    mydiff=$(($mydiff-1))
  done
  sed "/$OLDTARGET/s@$OLDTARGET/elilo.conf@$TARGET/elilo.conf$mystring@" \
  customization.msg > /tmp/elilo-$TARGET/customization.msg
fi
printf $TARGET > /tmp/elilo-$TARGET/TARGET 
cd $CWD
printf %b "Done. the new source directory is /tmp/elilo-$TARGET.\n"
