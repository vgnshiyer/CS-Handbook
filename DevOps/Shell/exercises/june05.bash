#https://www.kumarweb28.com/opa-june05-unix-code
cat june05.txt | awk 'NR>1{if(($3+$4)>=100) print $1,$2,$3,$4,$3+$4}' FS=',' OFS=\b | sort -k5,5nr -t\b | awk -F\b '{print $1,$2}'
# OFS = \b is same as OFS = " " or ' ' 
# use $0 only when fs and ofs are same
 