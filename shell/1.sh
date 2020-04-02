if [[ $# != 2 ]]
then
	echo "usage: $0 inputfile outputfile"
	exit
fi
cnt=0
result=""
inputfile=$1
outputfile=$2
for line in `cat $inputfile`; do
	let cnt++
	if [ $cnt -le 6 ]
	then
		out=`echo $line | sed "s/.*[A-Za-z].*//g"`
		if [[ ${#result} == 0 ]]
		then			
			result=$out
		else
			result=`echo -e "$result\n$out"`
		fi
	else
		out=`echo $line | sed "s/[A-Za-z]//g"`
		if [[ ${#result} == 0 ]]
		then			
			result=$out
		else
			result=`echo -e "$result\n$out"`
		fi
	fi
done
echo "$result" > $outputfile
