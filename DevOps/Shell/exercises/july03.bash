#https://www.kumarweb28.com/opa-july03-unix-code
cat july03.txt | awk '{if($4-$5>=0) print $1,$2,$3,$4,$5,$4-$5}' FS=',' OFS='|' | sort -k6 -r -t\|