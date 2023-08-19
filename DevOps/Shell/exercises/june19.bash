#https://www.kumarweb28.com/opa-june19-unix-code
cat june19.txt | awk -F',' '{if ($5>=80) {if($4<$5) print $0}}' | sort -k3,3n -k5,5n -t","
#cat june19.txt | awk -F',' '{if ($5>=80) {if($4<$5) print $0}}' | sort -k3,3n -k5,5nr -t"," : 1st column ascending 2nd column descending
# uniq doesnt work without sort
# -n is used in sort to specify numerical value cuz everthing is a string in unix
# -t"|" or -t\| is used to specify field seperator to the sort cmd
# -k is used to select column with which sorting is to be done
# -k3 considers column 3 to last column 
# -k3,3 considers only 3rd column
# awk '{print $1,$2,$3,$4,$5}' FS='|' OFS='\t'
