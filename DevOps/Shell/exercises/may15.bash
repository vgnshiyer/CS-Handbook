#https://www.kumarweb28.com/opa-may22-unix-code
min=$(cat june05.txt | awk -F',' 'BEGIN{min=0;} {NR>1; if(min==0) min=$3; if($3<min) min=$3;} END{print min}')
cat june05.txt | grep $min | wc -l

cat june05.txt | awk -F',' '{if(NR!=1) print $3}' | sort -n | uniq -c | awk -F' ' '{if (NR==1) print $1}'
# cat june05.txt | awk -F',' '{if (NR!=1) print $3}' | sort -n | awk -F' ' '{if (NR==1) print $1}' | grep june05.txt
#search term cannot be piped to grep: see line 6