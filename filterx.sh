echo "Running filterex on `pwd`"
temp=`mktemp`
utemp=`mktemp`
ls -p | grep -v / |  rev | cut -d "." -f1 | rev > $temp
sort $temp | uniq  > $utemp
rm $temp
echo "Found `cat $utemp | wc -l | awk '{$1=$1};1'` unique extensions"
while read ext;
do
	echo "Moving all $ext files"
    mkdir $ext
    mv *.$ext $ext/
done < $utemp
rm $utemp
echo "Finished execution"