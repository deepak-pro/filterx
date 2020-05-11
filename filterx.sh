echo "Running filterex on `pwd`"
temp=`mktemp`
utemp=`mktemp`
ls -p | grep -v / |  rev | cut -d "." -f1 | rev > $temp
sort $temp | uniq  > $utemp
rm $temp
while read ext;
do
        mkdir $ext
        mv *.$ext $ext/
done < $utemp
rm $utemp