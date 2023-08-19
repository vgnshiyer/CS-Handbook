[linux-commands-cheat-sheet-A4.pdf](https://github.com/vgnshiyer/CS-Handbook/files/12353267/linux-commands-cheat-sheet-A4.pdf)


source: https://linuxopsys.com/topics/linux-commands-cheat-sheet

# Shell Scripting

## Difference of quotes

1. double quoates: print variables with $ sign.
2. Single quoates: whatever you put in single quotes, will be printed as it is.
3. `` quoates: used to print the output of a command

## Variables in shell

- hyphen, special symbols not allowed
- variable cannot start with a number

## Special variables (start with a $)

1. $* --> stores complete set of positional parameters as a single string

2. $# --> number of arguments specified

3. $1 --> 1st arg

4. $2 --> 2nd arg

5. "$@" --> each quoted string as a separate arg

6. $? --> exit status of last command

7. $$ --> PID of current shell

8. $! --> PID of last background job

```
echo "'$*' output is $*" 
echo "'$#' output is $#"
echo "'$1 & $2' output $1 and $2"
echo "'$@' output of $@" 
echo "'$?' output is $?" 
echo "'$$' output is S$"
sleep 4 &
echo "'S!' output is S!"

Output:
'vignesh iyer' output is vignesh iyer
'2' output is 2
'vignesh & iyer' output vignesh and iyer
'vignesh iyer' output of vignesh iyer
'0' output is 0
'3890' output is 3890
'3891' output is 3891
```

## Arithmetic operations

```
echo -e "Enter a: "
read -r a
echo -e "Enter b: "
read -r b

echo "axb = $(($a*$b))"
echo "axb = `expr $a + $b`"

echo "a/b = $(($a/$b))"
echo "a/b = `expr $a / $b`"

Output: 
Enter a: 
1
Enter b: 
5
axb = 5
axb = 6
a/b = 0
a/b = 0
```

## Comparison operators

```
echo -e "Enter a: "
read -r a
echo -e "Enter b: "
read -r b

test $a -lt $b; echo "$?";
test $a -le $b; echo "$?";
test $a -gt $b; echo "$?";
test $a -ge $b; echo "$?";
test $a -eq $b; echo "$?";
test $a -ne $b; echo "$?";

Output:
Enter a: 
2
Enter b: 
3
0
0
1
1
1
0
```

## Logical operators

Used to validate multiple conditions

```
echo -e "Enter marks in math: "
read -r a
echo -e "Enter marks in physics: "
read -r b

if [ $a -ge 35 ] && [ $b -ge 35 ]; then
echo "Pass!"
else
echo "Fail :("
fi

Output:
Enter marks in math: 
34
Enter marks in physics: 
35
Fail :(
```

## If-else-else-if statements
```
if [ $a -ge 35 ] && [ $b -ge 35 ]; then
echo "Pass!"
elif [ $a -ge 35 ] || [ $b -ge 35 ]; then
echo "Passed in one subject :/"
else
echo "Fail :("
fi

Output:
Enter marks in math: 
35
Enter marks in physics: 
34
Passed in one subject :/
```

## While loop
```
echo "Enter a number: "
read n
i=0

while [ $i -lt $n ]
do
echo "$i"
i=`expr $i + 1`
done

Output:
Enter a number: 
10
0
1
2
3
4
5
6
7
8
9
```

## For loop
```
for((i=0;i<$n;i++))
do
    echo "$i"
done

echo "-----"

for i in {1..3}
do
    echo "$i"
done

Output:
Enter a number: 
3
0
1
2
-----
1
2
3
```

## Set command
```
set -e --> exits on error
set -x --> line is printed, but command isn't shown
```

## Functions
```
function backup() {
    if [ -f $1 ]; then
        BACKUP="./backup/$(basename ${1}).$(date +%F).$$"
        echo "Creating backup for $1 in dir: $BACKUP"
        cp $1 $BACKUP
        fi
}

echo "Enter file for backup: "
read file

backup $file
if [ $? -eq 0 ]; then
echo "Backup went successfully!"
else
echo "Some error occurred!"
fi

Output:
Enter file for backup: 
Readme.md
Creating backup for Readme.md in dir: ./backup/Readme.md.2023-08-19.10879
Backup went successfully!
```

## Arrays
```
Month=(0 1 2 3 4 5)
echo ${Month[2]}
echo ${Month[@]}
echo ${#Month[@]}

echo "------"

for num in ${Month[@]}
do
    echo $num
done

Output:
2
0 1 2 3 4 5
6
------
0
1
2
3
4
5
```

## Basic linux commands for DevOps/SRE/Network engineer

ls: List files and directories in the current directory. \
cd: Change the current directory. \
pwd: Print the current working directory. \
mkdir: Create a new directory.\
rm: Remove files or directories.\
cp: Copy files or directories.\
mv: Move or rename files or directories.\
touch: Create an empty file.\
cat: Concatenate and display the contents of files.\
grep: Search for patterns in files.\
find: Search for files and directories.\
chmod: Change file permissions.\
chown: Change file ownership.\
ps: Display information about running processes.\
top: Monitor system processes in real-time.\
kill: Terminate processes.\
df: Display disk space usage.\
du: Display file and directory space usage.\
free: Display memory usage.\
ifconfig or ip: Display or configure network interfaces.\
ping: Test network connectivity.\
ssh: Securely connect to remote servers.\
scp: Securely copy files between local and remote machines.\
rsync: Synchronize files and directories between systems.\
wget: Download files from the internet.\
curl: Transfer data to or from a server using various protocols.\
tar: Compress and extract files.\
gzip / gunzip: Compress or decompress files.\
systemctl: Control system services (systemd-based systems).\
journalctl: Query and display system logs (systemd-based systems).\
cron: Schedule tasks to run at specified times.\
crontab: Manage user-specific cron jobs.\
docker: Manage containers and containerized applications.\
docker-compose: Define and manage multi-container Docker applications.\
kubectl: Interact with Kubernetes clusters.\
helm: Package and deploy Kubernetes applications.\
git: Version control system for source code.\
ansible: Automate configuration management and deployments.\
terraform: Define and manage infrastructure as code.\
jenkins: Automate building, testing, and deploying software.\
nginx: Web server and reverse proxy.\
apache: Web server software.\
iptables / firewalld: Configure firewall rules.\
netstat: Display network connections and statistics.\
route: Display and manipulate IP routing table.\
lsof: List open files and processes.\
nc (netcat): Network utility for sending and receiving data.\
sed: Stream editor for text manipulation.\
awk: Text processing tool for pattern scanning and manipulation.\
psql / mysql / mongo: Command-line clients for PostgreSQL, MySQL, and MongoDB databases.\
ssh-keygen -t rsa -b 4096 -C "your_email@example.com": command to create a ssh key pair.\
nslookup: query DNS servers to retrieve DNS-related information such as IP addr, domain names. Stands for "Name Server Lookup"\
dig: retrieve info from DNS servers. detailed info on DNS records\
netstat: display network related information (route tables, connections, etc)\
netstat -an | grep LISTEN --> display all ports in use\

## Sed command (screen editor)

`sed 's/toreplace/replacewith' <filename>` --> replace 1st occurrence\
`sed 's/toreplace/replacewith/2' <filename>` --> replace 2nd occurrence\
`sed 's/toreplace/replacewith/g' <filename>` --> replace all occurrences\
`sed 's/^toreplace/replacewith/g' <filename>` --> replace all occurrences\
`sed '/^[0-9]/s/^/#/' <filename>` --> commend all lines which start with a number\

## AWK command

`cat <filename> | awk '{print $1 $2}'` --> print cols 1 and 2\
`cat <filename> | awk 'BEGIN {sum=0} {sum=sum+$3} END' '{print sum}'` --> print sum of vals in col 3\
`cat <filename> | awk ' if($3 > 200) print $0'` --> print rows with col 3 val > 200\

## Sort command 

`sort <file>` --> sort in ascending order\
`sort -r <file>` --> sort in reverse order\
`sort -k2 <file>` --> sort by 2nd column\
`sort -u <file>` --> sort by unique removing duplicates\

## Some more info
```
Variable:
variable_name=value; //No space on either sides of "=" sign.
	Eg.: a=Hello; a="Hello";a=1;
	a=`ls -l`         # Assigns result of 'ls -l' command to 'a'; `` stand for evaluation.
	
variable print:

echo "$variable_name" or echo "${variable_name}"
echo "Some text $variable_name"

printf "$a\n"; here new line is not printed after every print like in echo

variable length:

${#variable_name} //Gives variable length

	In AWK : length(variable_name)
	
Read input:

	read variable_name;

Store input in a file:
	read variable_name;
	echo "$variable_name" > file_name.txt;
			OR
	read variable_name;
	echo $variable_name > file_name.txt;
	
Comments:

	#This is a comment;
```
