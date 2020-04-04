if [[ $# != 2 ]]
then
	echo "usage: $0 inputfile outputfile"
	exit
fi
cnt=0
result=""
inputfile=$1
outputfile=$2
echo -e "\c" > $outputfile
for line in `cat $inputfile`; do
	let cnt++
	if [ $cnt -le 6 ]
	then
		out=`echo $line | sed "s/.*[A-Za-z].*//g"`
		if [[ ${#out} != 0 ]]
		then			
			echo "$out" >> $outputfile
		fi
	else
		out=`echo $line | sed "s/[A-Za-z]//g"`
		if [[ ${#out} != 0 ]]
		then			
			echo "$out" >> $outputfile
		fi
	fi
done
