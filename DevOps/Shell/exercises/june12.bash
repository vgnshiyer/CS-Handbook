#https://www.kumarweb28.com/opa-june12-unix-code
cat june12.txt | awk -F',' 'NR>1 {if ($3>50 && $4>50) if(($3+$4)/2>=75){print $1,$2,($3+$4)/2}}' | sort -k3,3nr -t" "
#to print integer values
# cat june05.txt | awk -F',' 'NR>1 {if ($3>50 && $4>50) if(($3+$4)/2>=75){print $1,$2,($3+$4)/2}}' | sed 's/\(\.[0-9]\)//' 
# cat june05.txt | awk -F',' 'NR>1 {if ($3>50 && $4>50) if(($3+$4)/2>=75){print $1,$2,($3+$4)/2}}' | sed 's/\(\..\)//'
#always use field separator i.e. -F','


 