if [[ $# != 1 ]]
then
	echo "usage: $0 string"
	exit
fi
str=$1
str=`echo $str | sed "s/[A-Za-z]\{6,\}//g"`
str=`echo $str | sed "s/[^A-Za-z_]\{1,\}/ /g"`
echo $str
