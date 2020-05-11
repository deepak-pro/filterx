mkdir files
ls -p | grep -v / |  rev | cut -d "." -f1 | rev > files/list
sort files/list | uniq  > files/uniq
rm files/list
while read ext;
do
        mkdir $ext
        mv *.$ext $ext/
done < files/uniq
rm -rf files