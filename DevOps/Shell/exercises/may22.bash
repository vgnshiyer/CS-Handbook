#https://www.kumarweb28.com/opa-may22-unix-code
cat june05.txt | wc -wc | awk -F' ' '{print $2/$1}' | sed 's/\(\..*\)//'
#use * to remove more than one decimals from a floating number



 