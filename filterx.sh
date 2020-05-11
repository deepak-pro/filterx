mkdir files
ls -p | grep -v / |  rev | cut -d "." -f1 | rev > files/list
sort files/list | uniq  > files/uniq
rm files/list