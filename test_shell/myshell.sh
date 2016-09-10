# which cmd: какая из имеющихся в $PATH команд выполняется, версия 1
case $# in
0) echo "Usage: which command" 1>&2; exit 2 ;;
1) filename=$1 ;;
2) param=$1; filename=$2 ;;
esac
opath=$PATH
PATH=/bin:/usr/bin
for i in `echo $opath | sed 's/^:/.:/g
		  s/:$/:./g
		  s/::/:.:/g
		  s/:/ /g'`
do
	if test -f $i/$filename
	then
		echo $i/$filename
		if test "$param" != "-a"
		then
			exit 0
		fi
	fi
done
exit 1