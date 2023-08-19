# https://www.kumarweb28.com/opa-july-24-unix-code
cat sample.txt | awk -F',' 'NR>1 {if ($4<=60) print $1}' | sort | uniq -u