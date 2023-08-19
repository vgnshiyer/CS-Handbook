#https://www.kumarweb28.com/opa-may8-unix-code
cat june05.txt | awk 'BEGIN{e=0;o=0} {if(NR>1) if($1%2==0)e=e+$1*$1; else o=o+$1*$1} END{print e-o}'
#use this for every sum : if(NR>1)
#-eq and -ne: works for numerical comparison and == works for string comparison
read n;
e=0;
o=0;
for((i=0;i<$n;i++))
do
	read j;
	if [[ ($j%2 -eq 0) ]] # && || eg. if [[ ($j%2 -eq 0) && || ($j -ne 0)]]
	then
		e=$(( e+j*j ));
	else
		o=$(( o+j*j ));
	fi
done
echo $(( e-o ))
# space after if and before square brackets
# space after 2 square brackets and before variable and after condition
