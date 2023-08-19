#https://www.kumarweb28.com/opa-july03-unix-code
cat june26.txt | awk '{if($5>=80) print $0}' FS=',' OFS=',' | sort -k5 -t,