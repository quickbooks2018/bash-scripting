# Bash Scripting

- Shell Tests Integers

- Example 1

```bash
test 1 -eq 1
echo $?
```

- Note: If above output is 0, then the test is true, else false.

- Example 2

```bash
test 1 -eq 2
echo $?
```

- Note: If above output is 1, then the test is false, else true.

- Example 3

```bash
test 100 -lt 200;echo $?
```

- Note: If above output is 0, then the test is true, else false.

- Example 4

```bash
test 100 -gt 200;echo $?
```

- Note: If above output is 1, then the test is false, else true.

- Shell Tests Strings

- Example 1

```bash
test "abc" = "abc";echo $?
```

- Note: If above output is 0, then the test is true, else false.

- Example 2

```bash
test "abc" = "xyz";echo $?
```

- Note: If above output is 1, then the test is false, else true.

- Example 3

```bash
test "abc" != "xyz";echo $?
```

- Note: If above output is 0, then the test is true, else false.

- Example 4

```bash
test "abc" != "abc";echo $?
```

- Note: If above output is 1, then the test is false, else true.

- Shell Tests Files

- Example 1

- We will create two files and test newer than.

```bash
touch file1;touch file2
test file1 -nt file2;echo $?
```

- Note: If above output is 1, then the test is false, else true.

- Example 2
- We will create two files and test older than.

```bash
touch file1
touch file2
test file1 -ot file2;echo $?
```

- Note: If above output is 0, then the test is true, else false.

- Shell test the character special files

- What are character special files?
- These are the files that are used to access the hardware devices.

- How can I find the character special files?
- You can find the character special files in /dev directory.

- Command to find the character special files

```bash
ls -l /dev
```

- Example 1

```bash
test -c /dev/tty;echo $?
```

- Note: If above output is 0, then the test is true, else false.

- Example 2

```bash
test -c /dev/sda;echo $?
```

- Note: If above output is 0, then the test is true, else false.

- Example 3

```bash
test -c /dev/cdrom;echo $?
```

- Note: If above output is 0, then the test is true, else false.

- Test the block special files

- What are block special files?
- These are the files that are used to access the hardware devices.

- How can I find the block special files?
- You can find the block special files in /dev directory.

- Example 1

```bash
test -b /dev/sda;echo $?
```

- Note: If block special file exists, then the test is true, else false.

- Shell test the file exists

- Example 1

```bash
test -e /etc/passwd;echo $?
```

- Note: If file exists, then the test is true, else false.

- Example 2

```bash
test -e /dev/sda;echo $?
```

- Note: If file exists, then the test is true, else false.


- test file exists and it is a regular file

- Example 1

```bash
test -f /etc/passwd;echo $?
```

- Note: If file exists and it is a regular file, then the test is true, else false.

- Example 2

```bash
test -c /dev/tty;echo $?
```

- Note: If file exists and it is a regular file, then the test is true, else false.

- Example 3

```bash
test -f /dev/tty;echo $?
```

- Note: If file exists and it is a regular file, then the test is true, else false.

- Shell test file is a socket

- First find the socket file

```bash
find / -type s
```

- Example 1

```bash
test -S /var/lib/docker.sock;echo $?
```

- Note: If file exists and it is a socket file, then the test is true, else false.

- Example 2

```bash
test -S /home/kasm-user/.k8slens/cli.sock;echo $?
```

- Note: If file exists and it is a socket file, then the test is true, else false.

- Shell test with small s means file exists and it is a socket file and it is not zero size
- Shell test with capital S means file exists and it is a socket file and it is not zero size

- Example 1

```bash
test -s /var/lib/docker.sock;echo $?
```

- Note: If file exists and it is a socket file and it is greater than zero size, then the test is true, else false.

- Example 2

```bash
test -s /home/kasm-user/.k8slens/cli.sock;echo $?
```

- Note: If file exists and it is a socket file and it is greater than zero, then the test is true, else false.

- check
```bash
ls -l /home/kasm-user/.k8slens/cli.sock
srwxr-xr-x 1 kasm-user kasm-user 0 Jan 15 02:00 /home/kasm-user/.k8slens/cli.sock 
```

- Shell test with small s means file exists and it is a socket file and it is not zero size or grater than zero size

- To get all the option for test command

```bash
man test
```

- Note: In All Linux System user id of root is 0.
- Note: variable PS1 is used to change the prompt of the shell.
- /etc/profile is the file that is executed when the user logs in. (system wide)
- /etc/bashrc is the file that is executed when the user opens the terminal. (system wide)
- /etc/skel is the directory that contains the default configuration files for the user. (system wide)
- /etc/passwd is the file that contains the user information.
- /etc/shadow is the file that contains the password information.

- Note: Use ssh cloud_user@localhost to login to the server. because sudo su username is not working as a full shell powers.

- Note: .profile or .bash_profile is the file that is executed when the user logs in. (user specific)
- Note: .bashrc is the file that is executed when the user opens the terminal. (user specific)

```explain
It's common practice to source .bashrc from .bash_profile to ensure that the shell environment is consistent across login and non-login shells. This is done by adding a line in .bash_profile like source ~/.bashrc or . ~/.bashrc, so the configurations in .bashrc are also applied at login.
```

### Cat perform concatenation (merging) of files and display on the standard output.

- Example 1

```bash
cat file1 file2 > file3
```

- Number of lines in file1

```bash
cat -n file1
```

- reverse the file

```bash
tac file1
```

- cat show blank lines

```bash
cat -A file1
```

- cat remove blank lines

```bash
cat -s file1
```

- Note: tac is a separate command and it is not available in all the Linux distributions, separate package is required to install tac command.

### Expression in Bash

- Example 1

```bash
expr 1 + 1
```

- Example 2

```bash
expr 1 - 1
```

- Example 3 (Note: \ is used to escape the special character *)

```bash
expr 10 \* 100
```

- Example 4

```bash
expr 100 / 10
```

- Note: expr unlike bash uses boolean operators like <, >, <=, >=, =, !=, match, substr, index, length, +, -, *, /, %, and \.
- Note: expr 1 means true and expr 0 means false.
- Note: bash 0 means true and bash 1 means false.

- expr length of the string
- Example 1

```bash Note: space is also counted
expr length "Hello World"
```

- expr substr of the string
- Example 1

```bash Note: 1 is the starting position and 5 is the length of the string
expr substr "Hello World" 1 5
```

- Testing Integer in Bash
```bash
-eq (equal), -ne (not equal), -lt (less than), -le (less than or equal), -gt (greater than), -ge (greater than or equal), -ne (not equal) 
```

- Testing Sting in Bash
```bash
test asim = asim; echo $?

test asim = asimg; echo $?

test asim != asimg; echo $?
```

- Testing Files in Bash
```bash
test -e /etc/passwd; echo $?
test file1 -nt file2; echo $?
```

- Run Bash scripts with making them executable
```bash
sudo scriptname.sh
```

- && and || (Meaning)
- Note: ls -l && echo "Hello World" # here second commands depends on the succesful status of first command
- Note: ls -z || echo "Hello World" # here second commands depends on the unsuccesful status of first command

- Preserve formatting with quotes, with out quotes formatting will not work
```bash
echo "$HELLO"
```

- User Input with read command
```bash
#!/bin/bash

echo -n "What is your name? "
read name
echo "your name is $name right."
#END
```
- Postional Parameters Note: $0 is reserve for script name
```bash
#!/bin/bash
echo "script name is $(basename $0)"
#END
```
- what is current shell?
```bash
➜  /mnt echo $0
zsh
➜  /mnt echo $SHELL
/bin/bash
```
- how to change current shell
```bash
chsh

Changing the login shell for root
Enter the new value, or press ENTER for the default
        Login Shell [/usr/bin/zsh]: /bin/bash

type bash
type sudo -i
type echo $0
```

- how to write multi line comment in bash
```bash
<<comment
line1
line2
comment

<<abc
line1
line2
line3
abc
```

- how to make variable readonly in bash script
```bash
readonly NAME='Hello'
```

- function in bash
```bash
#!/bin/bash
# Functions in bash

function showdate () {
  echo "Today is $(date +%F\ %r)"
}

# call the function
showdate

#END
```

- Number of arguments passed to a bash script
```bash
#!/bin/bash

# pass arguments to the script

echo "Hello, $1 $2 $3"
echo "Number of arguments passed: $#"

# End of the script

# result I pass 4
➜  /mnt ./hello.sh asim qasim taha papa
Hello, asim qasim taha
Number of arguments passed: 4
```

- difference between $@ and $* in shell scripting
```bash
The difference between $@ and $* in shell scripting comes into play when handling positional parameters, especially when arguments contain spaces. Here’s a breakdown with examples:

$*:
Treats all the positional parameters as a single string.
If the parameters are quoted, it merges all arguments into a single string.
$@:
Treats each positional parameter as separate strings.
When quoted, it retains each parameter as a distinct argument.

In practice, "$@" is often preferred because it correctly handles arguments that include spaces.

# without quotes
#!/bin/bash
for arg in $*; do
    echo "$arg"
done

for arg in $@; do
    echo "$arg"
done

./hello.sh "arg 1" "arg 2" "arg 3"
arg
1
arg
2
arg
3
arg
1
arg
2
arg
3

# with quotes
#!/bin/bash
echo 'Using "$*"'
for arg in "$*"; do
    echo "$arg"
done

echo 'Using "$@"'
for arg in "$@"; do
    echo "$arg"
done

# result
 ./hello.sh "arg 1" "arg 2" "arg 3"
Using "$*"
arg 1 arg 2 arg 3
Using "$@"
arg 1
arg 2
arg 3
```
- how to append and stdout and stderr in a file.txt
```bash
>> file.txt 2>&1
```
- User Input with read
```bash
#!/bin/bash

read -p "Enter your name: " name
echo "Hello, $name!"
```

- What is hard link and soft link?
```bash
Note: For both Soft and Hard link ---> new file must not exist

➜  /mnt stat bash.sh

  File: bash.sh
  Size: 314             Blocks: 0          IO Block: 4096   regular file
Device: 53h/83d Inode: 16325548649240654  Links: 2
Access: (0777/-rwxrwxrwx)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2024-09-18 03:19:20.228497100 +0000
Modify: 2024-09-18 03:19:10.471517800 +0000
Change: 2024-09-18 03:19:10.474686200 +0000
 Birth: -

➜  /mnt ls -i bash.sh

16325548649240654 bash.sh


Soft Link (Symbolic Link):
A soft link (or symbolic link) is similar to a shortcut in Windows. It points to the original file but is not a copy of the file.
It has a different inode number than the original file.
If the original file is deleted or moved, the soft link becomes a broken link (dead link), meaning it will no longer point to a valid file.
Soft links can span across different filesystems (for example, you can create a soft link from one partition to a file on another partition).
They can link to directories as well as files.

Hard Link:
A hard link is essentially a copy of the original file's reference in the filesystem, but it still points to the same inode (file data).
Both the original file and the hard link share the same inode number, meaning they are essentially the same file in the eyes of the filesystem.
If you modify the contents of the file via one path (either the original or the hard link), the changes will be reflected in both locations since they point to the same inode.
If the original file is deleted, the hard link still maintains access to the file data because it shares the inode with the original file.
Hard links cannot be created for directories and generally have to be on the same filesystem.
```
- How many shells are available in your Linux box?
```bash
cat /etc/shells
# /etc/shells: valid login shells
/bin/sh
/bin/bash
/usr/bin/bash
/bin/rbash
/usr/bin/rbash
/usr/bin/sh
/bin/dash
/usr/bin/dash
/usr/bin/tmux
/bin/zsh
/usr/bin/zsh
```
- What is $$
```bash
#!/bin/bash
echo "The current process ID is $$"
```
- types of loop
```bash
for loop
while loop
until loop
```
- for loop example, either put list or command in place list `command` or $(command)
```bash
list=' 1 2 3'

for i in $list
do
 echo $i
done
```
- Nested for loop example
```bash
#!/bin/bash

list1='1 2 3 4 5 6 7 8 9 10'
list2='11 12 13 14 15 16 17 18 19 20'

for i in $list1
do
    for j in $list2
    do
        echo "i is $i and j is $j"
    done
done
```
- Combine or Concatenate  example1
```bash
#!/bin/bash

list1='1 2 3 4 5 6 7 8 9 10'
list2='11 12 13 14 15 16 17 18 19 20'

# Combine the lists
combined_list="$list1 $list2"

# Print the combined list
echo "Combined list: $combined_list"
```
- Combine the lists example2
```bash
#!/bin/bash

list1='1 2 3 4 5 6 7 8 9 10'
list2='11 12 13 14 15 16 17 18 19 20'

combined_list=''

# Loop over list1 and append its elements to combined_list
for i in $list1
do
    combined_list="$combined_list $i"
done

# Loop over list2 and append its elements to combined_list
for j in $list2
do
    combined_list="$combined_list $j"
done

# Print the combined list
echo "Combined list: $combined_list"
```

- Combine the lists elements rather than combine lists example3
Nested loops go through every combination of i from list1 and j from list2, printing each pair.
This approach is more useful when you want to work with combinations or pairs of elements rather than creating a single combined list.
```bash
#!/bin/bash

list1='1 2 3 4 5 6 7 8 9 10'
list2='11 12 13 14 15 16 17 18 19 20'

for i in $list1
do
  for j in $list2
  do
    echo "Combine $i $j"
  done
done
```

- COUNT number of users in system
```bash
#!/bin/bash

# cat /etc/passwd | awk -F ':' '{print $1}' | wc -l
# Above command will give you the total number of users in the system
USERS=$(cat /etc/passwd | awk -F ':' '{print $1}')
COUNT=0
for i in $USERS
do
  echo $i
  let "COUNT += 1"
done

echo "Total Users in System are $COUNT"

#END
```

- printf does not add a newline automatically. You must explicitly specify \n when you want a newline.
- echo does add a newline automatically at the end of the output, unless you use the -n option.
```bash
➜  /mnt printf "hello world"
hello world#
➜  /mnt echo "hello world"
hello world
```
- While loop example (In While loops, test for true condition)
```bash
#!/bin/bash

NUM=1
MAX=20

while [ "$NUM" -le "$MAX" ]
do
  sleep 1
  echo "Number: $NUM"
  let   "NUM += 1"
done

#END
```

- Until loop is opposite of while loop (In Until loop, test for false condition)
```bash
#!/bin/bash

NUM=100
MIN=20

until [ "$NUM" -lt "$MIN" ]
do
  sleep 1
  echo "Number: $NUM"
  let   "NUM -= 1"
done

#END


#!/bin/bash


# Until loop example system is UP or DOWN

STATUS=1
SERVER='192.168.1.8'
until [ "$STATUS" -eq "0" ] # this is false, so it will run the loop
do
  ping -c 3 $SERVER > /dev/null 2>&1
  STATUS=$?
  if [ "$STATUS" -eq "0" ]; then
    echo "Server is UP"
  else
    echo "Server is DOWN"
  fi

done

#END
```

- log parsing in linux box
```bash
grep -ir 'failed' /var/log/*.log ---> from here, I will picked the exact name example CASE SENSITIVE


/var/log/auth.log:Sep 16 09:05:15 d8d3ed90041c sshd[3480]: Failed password for ubuntu from 171.22.31.58 port 43708 ssh2
/var/log/auth.log:Sep 16 09:06:02 d8d3ed90041c sshd[3501]: Failed password for ubuntu from 171.22.31.58 port 53166 ssh2

awk '/Failed/ {print $0}' /var/log/*.log
```
- logs
- journalctl
```bash
journalctl -u ssh
# follow tail -f
journalctl -uf ssh
```
  
- dmesg gives you kernel related logs 
it displays the kernel ring buffer, which contains messages generated by the kernel, such as hardware initialization, driver issues, or system errors.


- failed login attempts (Note: this info stored in btmp file, which is the binary file, to read binary use below command
btmp (which logs failed login attempts), wtmp tracks successful logins and logouts (last -f /var/log/wtmp
), along with system reboots and shutdowns.
```bash
lastb
lastb -adF
lastb |  awk  '{print $1,$3}'
```

- Create 1GB file at /mnt
if=/dev/zero: This uses /dev/zero as the input file, which is a special file that provides a continuous stream of zero bytes.
of=/mnt/1GBfile: This specifies the output file (1GBfile) that will be created in the /mnt directory.
bs=1M: This sets the block size to 1 megabyte.
count=1024: This specifies the number of blocks to write. With 1 MB block size, writing 1024 blocks results in a file size of 1 GB (1024 MB).

sense, count in dd behaves somewhat similarly to an iteration in Terraform, like when using count in Terraform to create multiple instances of a resource.
```bash
resource "aws_instance" "example" {
  count = 3
  # This creates 3 instances
}
```

```bash
dd if=/dev/zero of=/mnt/1GBfile bs=1M count=1024 status=progress
```
- Create 1GB file at /mnt
The truncate command is used to change the size of a file. If you need to reduce the size of a log file (app.log), the command will remove data from the end of the file.
Note: Truncating removes data from the end of the file. Any removed data is permanently deleted and cannot be recovered.
```bash
truncate -s 1024M app.log
truncate -s 10M app.log
```

- Bash Logs Abstract
- From CLI we can send error to a file example:
- 0 std in 
- 1 is std out
- 2 is std error
  
```bash
./hello.sh 2> logs-erros.txt
```
```bash
#!/bin/bash
# Purpose: Log Abstract

# Variables
mydate=$(date +%b\ %d)
log1='/var/log/syslog'
log2='/var/log/auth.log'
myscript_name=`basename $0`
myscript_erros="${myscript_name}-erros.txt"

for i in $log{1,2}
do
  if [ -e $i ] && [ -s $i ]
  then
  echo $i BEGIN

  grep -E "$mydate" $i 2> $myscript_erros

  echo $i END

  else
  echo "Log file not found"
  exit 1
  fi

done

# Remove Error file if empty (STD ERR)
if [ -e $myscript_erros ] && [ ! -s $myscript_erros ]
then
  rm -f $myscript_erros
fi

#END
```

- Disk Usage and Depth (breakdown)
```bash
du -hs ~/Desktop/sand-box

 26G    /Users/asim/Desktop/sand-box

du -h -d 1 ~/Desktop/sand-box

 22G    /Users/asim/Desktop/sand-box/Muhammad-Asim
502M    /Users/asim/Desktop/sand-box/gcp-terraform-modules
1.7M    /Users/asim/Desktop/sand-box/traefik-kubernetes-ingress
 18M    /Users/asim/Desktop/sand-box/community-prometheus
4.0K    /Users/asim/Desktop/sand-box/gcp
4.0K    /Users/asim/Desktop/sand-box/kind
2.0G    /Users/asim/Desktop/sand-box/devops-springboot-github-actions-project
188K    /Users/asim/Desktop/sand-box/bitnami-kafka-kraft
 91M    /Users/asim/Desktop/sand-box/tmp
786M    /Users/asim/Desktop/sand-box/istio-ambient-mesh
 32K    /Users/asim/Desktop/sand-box/.idea
 26G    /Users/asim/Desktop/sand-box
```

- Replace values inside a file
```bash
sed 's/global/UNIQ/g' search.txt (only shows the output)

hello
hi
UNIQ

root@d8d3ed90041c:/tmp# cat search.txt 
hello
hi
global

sed -i 's/global/UNIQ/g' search.txt (make it persistent)
```
- list of insatlled packages
```bash
apt list --installed (debian)
rpm -qa (fedora)
```
- find & grep
```bash
/ (recursive)

find / -type d | grep "directory name" && find / -type f | grep "file name"

find / -type d | grep "abid"

find / -type f | grep "abid"

# Present Directory (recursive)

find . -type d | grep "abid"

find . -type f | grep "abid"



# Specific Word
grep -irow database
```
