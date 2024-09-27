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

# NCDU

# Ubuntu/Debian

apt install -y ncdu
ncdu /

# Fedorora/Centos

yum install -y ncdu


# Networking (net cat)
apt insatll -y nc
yum install -y nc 
netstat -plntu
netstat -antp


# AmazonLinux
sudo amazon-linux-extras install epel -y
sudo yum install ncdu -y
```

- Mount a addtional on /data
```bash
##################################
# Note: First create a file system EXT4 or XFS
##################################


# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.htm
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html

cp /etc/fstab /etc/fstab.orig


1. lsblk

2. mkdir /data

3. Use the file -s command to get information about a specific device, such as its file system type. If the output shows simply data, as in the following example output, there is no file system on the device

  file -s /dev/nvme1n1 always check ---> Check if there's an existing filesystem on the device and format it with EXT4 (otherwise disk will be formated with fresh file system)
  
  mkfs -t xfs /dev/nvme1n1
  
  test with this commmand  file -s /dev/nvme1n1
  
  mount /dev/nvme1n1 /data
  
  df -hT
  
 4. lsblk -f 

 5. blkid  for Ubuntu18 ---> lsblk -o +UUID
 
 6. Replace the blkid with the id of your disk
cat << EOF >> /etc/fstab
UUID=0d652b48-0ad5-4aef-87ca-2243dd98d92d  /data  xfs  defaults,nofail  0  2
EOF

7. To verify that your entry works, run the following commands to unmount the device and then mount all file systems in /etc/fstab.

umount /data

df -hT

mount -a

df -ihT

# Increase the disk with out machine reboot

#############
# Disk Usage
#############
cd /
du -d 1 -h

########
# EXT4
########
# Use growpart for ext4
                
lsblk
               #disk       #partition number
sudo growpart /dev/nvme0n1 1

######
# EXT4
######
df -hT   ---> pick the mount one

sudo resize2fs /dev/nvme0n1p1

#####
# XFS
#####
df -hT --> pick the mount one
sudo xfs_growfs /dev/nvme0n1p1


df -hT
fdisk -l
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

- how to upgrade kernel on linux (ubuntu)
```bash
To update your kernel to a newer version on Ubuntu 22.04 (Jammy Jellyfish), you can follow these steps:

Step 1: Update the system and package index
First, ensure your system is fully updated.


sudo apt update
sudo apt upgrade -y
Step 2: Install linux-generic-hwe-22.04 package
Ubuntu offers a Hardware Enablement (HWE) kernel, which provides newer kernel versions. You can install the latest HWE kernel by running:


sudo apt install linux-generic-hwe-22.04
This will install the latest available kernel for Ubuntu 22.04.

Step 3: Reboot your system
After installing the new kernel, reboot your system to load the newly installed kernel.


sudo reboot
Step 4: Verify the kernel version
Once the system reboots, check the new kernel version by running:


uname -r
This should display the updated kernel version.

Step 5: Optional - Remove old kernels
You can remove old kernels to free up space. Use the autoremove command to clean up unused packages, including older kernel versions.


sudo apt autoremove --purge
```

- Systemd install specfic of kernel (GRUB2 grand unified boot loader)
```bash
cat /etc/default/grub (configuration file)
```
# check the version of grub
```bash
grub-install --version
```
# update grub
```bash
update-grub
```
The command sudo update-grub regenerates the GRUB bootloader configuration by scanning available operating systems and kernels on the system. Here's a breakdown:

Sourcing Configuration Files: GRUB reads configuration settings from /etc/default/grub and additional files in /etc/default/grub.d/, which modify GRUB behavior.

GRUB_FORCE_PARTUUID: Indicates that the system is configured to use PARTUUID for booting without an initrd (initramfs) for the kernel.

Found Kernel Images: GRUB identifies various Linux kernel versions available (e.g., vmlinuz-6.8.0-1015-aws, vmlinuz-6.8.0-45-generic) along with their associated initrd files for initializing the system.

os-prober Warning: GRUB does not scan for other bootable operating systems because os-prober is disabled. To enable it, set GRUB_DISABLE_OS_PROBER=false in the configuration.

This process ensures that GRUB's boot menu is up-to-date with the current system configuration.

- Install specific version of kernel
```bash
# check availabe version of kernel on system
dpkg --list | grep linux-image

# Install specific version
sudo apt install linux-image-5.15.0-1023-aws

# Update /etc/default/grub
sudo sed -i 's/GRUB_DEFAULT=.*/GRUB_DEFAULT="Advanced options for Ubuntu>Ubuntu, with Linux 5.15.0-1023-aws"/' /etc/default/grub

# verify before update
cat /etc/default/grub | grep GRUB_DEFAULT

# Update grub
sudo update-grub

reboot
init 6 (run level 6)

# verify kernel
uname -r
```



- find the largest file on the system
```bash
find . -type f -exec du -hs --apparent-size {} + | sort -rh | head -n1
Explanation:

find /root -type f: Finds only files (not directories) in the /root directory.
-exec du -h {} +: Executes the du command in human-readable format for each file found.
sort -rh | head -n 1: Sorts by size in reverse order and shows the largest file.

The {} and + in the find command have specific meanings:

{}: This is a placeholder for the current file or directory that find processes. When find identifies a file that matches the search criteria (in this case, files -type f), it replaces the {} with the path of that file.

+: This means that multiple files will be passed to the du command at once in a batch, which is more efficient than calling du once per file. Without the +, if you used \; instead, the command would execute du for each file individually, which would be slower if there are many files.

In short, using + allows find to gather multiple files and pass them in a single du invocation, improving performance, especially when dealing with a large number of files.
```

- if else logic
Explanation:
${world_countries[@]}: This expands to all elements of the array, which allows the for loop to iterate over each country individually.
"$world_countries" without [@] treats the entire array as a single string, so only the first element (Pakistan) was being processed.

```bash
#!/bin/bash
# Purpose: if elase logic

world_countries=("Pakistan" "India" "Canada" "England")

for i in "${world_countries[@]}"
do
   if [ "$i" = "Pakistan" ]
   then
       echo "Welcome to Pakistan"
   else
       echo "$i"
   fi
done

#END
```

- test with if elase
- help test to get all the options
```bash
#!/bin/bash
# Purpose: if else logic

FILE='/root/install-docker.sh'
if [ -e $FILE ]
then
        echo "file exists" 
else
        echo "Not found"
fi
#END

bash -ux hello.sh

+ '[' -e /root/install-docker.sh ']'
+ echo 'file exists'
file exists
```

- test service is listining on port 443
```bash
netstat -aplntu | grep :443 | awk -F ':' '{print $4}' | tr -d '[:space:]' && echo
```
- Note: Whenuse strings comparison use =
```bash
#!/bin/bash

nginx_port_443=$(netstat -aplntu | grep :443 | awk -F ':' '{print $4}' | tr -d [:space:] && echo)


if [ "$nginx_port_443" = "443" ]
then
        echo "Nginx Service is Running"
else
        echo "Nginx Service is Down"
fi
```

- Check the status of previous command and decisions on the basis of exit status (netstat -ant)
```bash
!/bin/bash

# command
netstat -ant | grep :443 | grep -i listen > /dev/null

# check the status of previous command
nginx_status="$?"

# logic
if [ "$nginx_status" = "0" ]
then
        echo "Nginx Service is Running"
else
        echo "Nginx Service is Down"
fi
```

- Nested if use case is dependency base checking if parent IF is down then no need to additional checks
Example:
Here’s an example to illustrate the advantage of nesting:

Without nesting: If Nginx is down, you might still check SonarQube, which could result in confusion because it makes no sense to check for SonarQube when the primary service is down.

With nesting: You avoid unnecessary checks and provide logical output that makes sense for service dependencies.
```bash
#!/bin/bash

netstat -ant | grep 443 | grep -i listen > /dev/null

# check the status of previous command
nginx_status="$?"


if [ "$nginx_status" = "0" ]
then
        echo "Nginx Service is Running"


        netstat -ant | grep :9000 | grep -i listen > /dev/null
        # check the status of sonarqube
        sonarqube_status="$?"


        if [ "$sonarqube_status" = "0" ]
        then
                echo "Sonarqube is running"
        else
                echo "Sonarqube is not running"
        fi
else
        echo "Nginx Service is Down"
fi
```

- if elif
```bash
#!/bin/bash

world_countries=("Pakistan" "India" "China" "England")

for i in "${world_countries[@]}"
do
        if [ "$i" = "Pakistan" ]
        then
                echo Welcome to Pakistan
        elif [ "$i" = "India" ]
        then
                echo "Welcome to India"
        else
                echo $i
        fi
done
#END

root@d8d3ed90041c:~# ./app.sh 
Welcome to Pakistan
Welcome to India
China
England
```
- We can use shorter script instead of elif elif use CASE
```bash
#!/bin/bash

world_countries=("Pakistan" "India" "China" "England" "America")

for i in "${world_countries[@]}"
do
        case $i in
            "Pakistan")
                echo "Welcome to Pakistan" ;;
            "India")
                echo "Welcome to India" ;;
            "China")
                echo "Welcome to China" ;;
            "England")
                echo "Welcome to England" ;;
            *)
                echo "Unknown country" ;;
        esac
done
#END

./app.sh 
Welcome to Pakistan
Welcome to India
Welcome to China
Welcome to England
Unknown country
```

- Networking
```bash
#########
# tcpdump
#########
sudo apt-get install tcpdump
sudo tcpdump -i any -n -c 100

#######
# iftop
#######
sudo apt-get install iftop
iftop

####
# ss
####
# ss is a simpler tool for checking current network connections and statistics.
To view all established connections from your Linux system to the ECS host
ss -tuna 

#####
# MTR
#####
mtr google.com
tracepath google.com

MTR (My TraceRoute) is a network diagnostic tool used in Linux and other operating systems. The command "mtr" combines the functionality of traceroute and ping. 

mtr --tcp <target_host_or_ip>

mtr --tcp -P <port_number> <target_host_or_ip>

mtr --tcp -P 80 google.com
mtr -P 80 google.com
This command would use TCP on port 80 instead of ICMP.

######
# NMAP
######
# (tcp & udp) ports
(network scan of machine)

apt install -y nmap
nmap -p 1-65535 localhost
sudo nmap -p 1-65535 -sS -sU localhost

-p 1-65535: Specifies the range of ports to scan (all ports from 1 to 65535).
-sS: TCP SYN scan (commonly used for fast and reliable detection of open TCP ports).
-sU: UDP scan to detect open UDP ports.
localhost: Refers to the machine you are scanning (in this case, your local system).

#########
# Netstat
#########
netstat -aplntu
netstat -ant
netstat -r
```

- Ubuntu UFW (Uncomplecated fire Wall)
- Centos Firewalld

```bash
ufw status
ufw disable
ufw enable

# ufw log verbosity
sudo ufw logging medium

# allow
sudo ufw allow <port_number>
sudo ufw allow from 65.49.20.105 to any port 3306

# deny
sudo ufw deny 3306
sudo ufw deny from 192.168.10.20 to any port 3306

# rules number
sudo ufw status numbered

# delete rule
sudo ufw delete 5
```
You can adjust the verbosity of UFW logging. The default is low, which logs blocked connections, but you can change it to medium or high for more detailed logs.

Low (default): Logs denied connections.
Medium: Logs denied connections, and basic information about allowed connections.
High: Logs detailed information about both allowed and denied connections, including headers.

- Additional layer of security
AppArmor (in Ubuntu) and SELinux (in CentOS) are mandatory access control (MAC) systems used to enhance the security of Linux systems by restricting applications' access to system resources based on defined security policies. AppArmor uses path-based access control, while SELinux uses a more granular, label-based approach to enforce policies.

- Linux Trouble Shooting
```bash
# ssh login failure debug
tail -f /var/log/auth.log

# disk full issues
df -ihT (must check inodes as well)

# solution
find the larget file on the /var/log

# list highest from low
find . -type f -exec du -h --apparent-size {} + | sort -rh | head -n1

# list highest only
find . -type f -exec du -h --apparent-size {} + | sort -rh | head -n1
```

- Match exact word in a file
```bash
cat -n app.sh | grep -iw 'asim\|taha\|hadi'
```

- Positional Parameters
```bash
#!/bin/bash

BAD_PARAM='165'

echo "number of postion parameters passed: $#"

if [ "$#" = "2" ]
then
        # Postional parameters
        seq $1 $2
else
        echo "This script requires two arguments integers"
        exit $BAD_PARAM
fi
#End
```

- dns lookup
```bash
nslookup -type=SRV _mongodb._tcp.ENDPOINT
dig SRV _mongodb._tcp.cluster-devops-0.rzkdltt.mongodb.net
openssl s_client -connect shard-dns-00-00-pri-shard.mongodb.net:27017
```

- Dockerfile Override both CMD and Entrypoint
Overriding Both CMD and ENTRYPOINT
You can override both ENTRYPOINT and CMD by using --entrypoint for the entrypoint and providing a new command at the end for the CMD:
```bash
docker run --name nginx -id --entrypoint sleep nginx:alpine 1000
docker run --name busybox -id --entrypoint sleep busybox 1000
```
- same concept applies in kubernetes for debugging
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-sleep
spec:
  containers:
  - name: nginx
    image: nginx:alpine
    command: ["sleep"]  # This overrides the ENTRYPOINT
    args: ["1000"]      # This overrides the CMD
---
apiVersion: v1
kind: Pod
metadata:
  name: busybox-sleep
spec:
  containers:
  - name: busybox
    image: busybox
    command: ["sleep"]  # This overrides the ENTRYPOINT
    args: ["1000"]      # This overrides the CMD
```

- Package Management
The difference between apt update and apt upgrade lies in what they do during package management on Debian-based systems (like Ubuntu):

- Note: if you want to upgrade specific package only use package name

```bash
apt update -y
apt upgrade nginx -y
```

1. apt update:
Purpose: Updates the package list.
Function: Downloads and refreshes the list of available packages and their versions from the repositories defined in your /etc/apt/sources.list file and /etc/apt/sources.list.d/ directory.
Outcome: This command does not install or upgrade any packages. It only makes sure your system knows about the latest versions of all packages available in the repositories.
Use Case: Run this command before checking for or installing updates so your package manager knows about the latest available versions.
Command:

```bash
sudo apt update
````
2. apt upgrade:
Purpose: Installs the latest available versions of installed packages.
Function: After the package lists have been updated using apt update, this command upgrades all the installed packages to their latest versions, as long as there are no major conflicts or dependency issues. It upgrades the packages without removing or installing any new ones (i.e., it only upgrades the packages you already have installed).
Outcome: Upgrades your system's installed packages to the latest versions based on the updated package list.
Use Case: Run this command after apt update to apply the latest updates to your installed packages.
Command:

```bash
sudo apt upgrade
```
Example of Workflow:
First, update the package list to get information about the latest available versions:

```bash
sudo apt update
```
Then, upgrade the installed packages to the latest versions:

```bash
sudo apt upgrade
```

Differences in Practice:
apt update does not install or upgrade anything. It only updates the list of packages.
apt upgrade installs the newest versions of the currently installed packages based on the updated list.
If you want a more comprehensive system upgrade, including the installation or removal of packages to meet new dependencies, you can use apt full-upgrade.

Prevent Automatic Upgrades: If you downgrade a package and want to prevent it from being upgraded automatically in the future, you can "hold" the package:

```bash
sudo apt-mark hold <package_name>
```
- For example, to install an older version of Nginx:
```bash
sudo apt install nginx=1.17.10-0ubuntu1
```

- Remove package
```bash
apt remove nginx
apt autoremove ( to remove the depencies, by default not removed automatically)
```

Note: IN Fedora/redhat/Centos you can simply undo new version or rollback to previous versions example below regarding update,upgrade, 
rollback

```bash
# Update package list and upgrade all packages:
sudo yum update
sudo dnf update

# Upgrade a specific package:
sudo yum update <package>
sudo dnf update <package>

# View available versions of a package:
yum list <package> --showduplicates
dnf list <package> --showduplicates

# Undo a transaction using history:
sudo yum history undo <transaction_id>
sudo dnf history undo <transaction_id>

# Downgrade to a previous version of a package:
sudo yum downgrade <package>
sudo dnf downgrade <package>
```
Note: The yum and dnf package managers in Fedora, CentOS, and RHEL make rolling back and downgrading packages easier compared to APT-based systems like Ubuntu, as these tools have better built-in support for managing package versions and maintaining rollback histories.


- Run bash script as a systemd service example (mysql monitoring) check after 3 seconds
  
systemd timer that is enabled and associated with timers.target will automatically start when the system boots up

- Create 3 scripts
- 1. create-systemd-service.sh
```bash
#!/bin/bash

# Define variables
SERVICE_NAME="mysql_service"
SCRIPT_PATH="/root/mysql_systemd_service.sh"

# Check if the script exists
if [[ ! -f $SCRIPT_PATH ]]; then
    echo "Script $SCRIPT_PATH not found!"
    exit 1
fi

# Create the systemd service file
sudo cat <<EOF > /etc/systemd/system/$SERVICE_NAME.service
[Unit]
Description=Run MySQL service script

[Service]
ExecStart=$SCRIPT_PATH
EOF

# Create the systemd timer file
sudo cat <<EOF > /etc/systemd/system/$SERVICE_NAME.timer
[Unit]
Description=Run MySQL service script every 10 seconds

[Timer]
OnBootSec=10sec
OnUnitActiveSec=10sec
Unit=$SERVICE_NAME.service

[Install]
WantedBy=timers.target
EOF

# Reload systemd, enable, and start the timer
sudo systemctl daemon-reload
sudo systemctl enable $SERVICE_NAME.timer
sudo systemctl start $SERVICE_NAME.timer

echo "Systemd service and timer for $SCRIPT_PATH created and started."

# End
```
- 2 mysql_systemd_service.sh
```bash
#!/bin/bash
while true; do
    /root/mysql_monitor.sh
    sleep 3
done
```
- 3 mysql_monitor.sh
```bash
#!/bin/bash
# Purpose: Monitoring
# quick installation
# docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:latest
# docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -v mysql_data:/var/lib/mysql -d mysql:latest


# check service mysql service is running or not
netstat -ant | grep :3306 | grep -i listen 1> /dev/null

mysql_status="$?"

if [ "$mysql_status" != "0" ]
then
  echo "Service is Down"
  echo "Starting mysql service"
  docker start mysql
else
  echo "Service is running fine"
fi
# End
```
- postional parameters
```bash
#!/bin/bash
# Purpose: Monitoring Service in Systemd
# quick installation
# docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:latest
# check service mysql service is running or not

service_name="$1"
service_port="$2"
script_name=`basename $0`



if [ "$#" = "2" ]
then

   netstat -ant | grep :"${service_port}" | grep -i listen 1> /dev/null
    if [ "$?" = "0" ]
    then
      echo "Service is running fine"
      exit 0

    netstat -ant | grep :"${service_port}" | grep -i listen 1> /dev/null
    elif [ "$?" != "0" ]
      then
        echo "${service_name} Service is Down or Does not exist"
        echo "Trying to start if exist ${service_name} service"
        docker start "$service_name"

    elif [ "$?" != "0" ]
    then
        echo "Incorrect Service Name or Port"
        exit 165
    fi

else
echo "This $script_name requires two arguments service name and service port"
  exit 165

fi
# End
```
### To make scripts more portable use postional parameters
- Move or Rename many files
```bash
#!/bin/bash
# Pourpose: rename test files to asim.txt
count=1

for i in `ls -A test*`
do
        echo renaming $i
        sleep 1
        mv $i asim$count.txt
        let "count += 1"

done
#End
```

- Linux push process in bg (back ground) and fg (fore ground) or simply use tmux
```bash
ping google.com stop the job ---> ctrl+z

now type jobs
[1]+  Stopped                 ping google.com

run the job in background. %1 is job id
bg %1

fg %1
```

- Parse log from a logfile with timestamp STARTTIME ENDTIME ERROR TYPE
Example
log.txt
```txt
[2024-08-07 10:15:32] ERROR - An error occurred
[2024-08-07 10:16:45] INFO - System is running
[2024-08-07 10:17:55] WARNING - Low memory
[2024-08-07 10:18:05] ERROR - Failed to connect to database
[2024-08-07 10:19:32] INFO - User logged in
```

- Solution 
```bash
#!/bin/bash

# Display usage information
usage() {
    echo "Usage: $0 <start_time> <end_time> <log_type> <log_file>"
    echo "Time format: YYYY-MM-DD HH:MM:SS"
    echo "Log type: ERROR, INFO, WARNING, or CRITICAL"
    echo "Log file: Path to the log file"
    exit 1
}

# Convert date to Unix timestamp
date_to_timestamp() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        date -j -f "%Y-%m-%d %H:%M:%S" "$1" "+%s"
    else
        date -d "$1" +%s
    fi
}

# Validate command-line arguments
validate_args() {
    [ $# -ne 4 ] && usage
    valid_types=("ERROR" "INFO" "WARNING" "CRITICAL")
    local log_type=$(echo "$3" | tr '[:lower:]' '[:upper:]')
    [[ ! " ${valid_types[*]} " =~ $log_type ]] && echo "Invalid log type." && usage
}

# Check if log file exists
check_log_file() {
    local log_file="$1"
    [ ! -f "$log_file" ] && echo "Error: Log file '$log_file' not found." && exit 1
}

# Parse logs based on given criteria
parse_logs() {
    local start_time="$1"
    local end_time="$2"
    local log_type="$3"
    local log_file="$4"

    awk -v start="$start_time" -v end="$end_time" -v type="$log_type" '
        function to_timestamp(dt) {
            cmd = "date -j -f \"%Y-%m-%d %H:%M:%S\" \"" dt "\" \"+%s\""
            cmd | getline ts
            close(cmd)
            return ts
        }
        {
            # Extract timestamp from log entry and convert to Unix timestamp
            ts = to_timestamp(substr($1, 2) " " substr($2, 1, length($2)-1))

            # Print log entry if it matches criteria
            if (ts >= start && ts <= end && $3 == type) print
        }
    ' "$log_file"
}

# Main function to orchestrate log parsing
main() {
    validate_args "$@"

    local start_time=$(date_to_timestamp "$1")
    local end_time=$(date_to_timestamp "$2")
    local log_type=$(echo "$3" | tr '[:lower:]' '[:upper:]')
    local log_file="$4"

    check_log_file "$log_file"
    parse_logs "$start_time" "$end_time" "$log_type" "$log_file"
}

# Execute main function
main "$@"
```

- Script Usage example
```bash
./log.sh "2024-08-07 00:00:00" "2024-08-07 10:19:32" ERROR ${PWD}/log.txt
[2024-08-07 10:15:32] ERROR - An error occurred
[2024-08-07 10:18:05] ERROR - Failed to connect to database ${PWD}/log.txt

./log.sh "2024-08-07 00:00:00" "2024-08-07 10:16:00" ERROR ${PWD}/log.txt
[2024-08-07 10:15:32] ERROR - An error occurred

./log.sh "2024-08-07 00:00:00" "2024-08-07 10:17:00" info ${PWD}/log.txt
[2024-08-07 10:16:45] INFO - System is running

./log.sh "2024-08-07 00:00:00" "2024-08-07 10:17:00" info ${PWD}/log.txt
[2024-08-07 10:16:45] INFO - System is running

./log.sh "2024-08-07 00:00:00" "2024-08-07 10:16:00" info ${PWD}/log.txt

./log.sh "2024-08-07 00:00:00" "2024-08-07 10:30:00" info ${PWD}/log.txt
[2024-08-07 10:16:45] INFO - System is running
[2024-08-07 10:19:32] INFO - User logged in
```

- Positional Parameters $@ and $#
```bash
# Comparison of `$#` and `$@` in Bash

## `$#`

- **Definition**: Represents the number of arguments passed to the script or function.
- **Usage**: Used to check the number of arguments provided.
- **Example**:
  ```bash
  #!/bin/bash
  echo "Number of arguments: $#"
  
  # If run as: ./script.sh arg1 arg2 arg3
  # Output: Number of arguments: 3

## `$@`

- **Definition**: Represents all the arguments passed to the script or function as separate strings.
- **Usage**: Used to iterate over or pass all arguments.
- **Example**:

  #!/bin/bash
  echo "All arguments: $@"
  
  for arg in "$@"
  do
      echo "Argument: $arg"
  done
  
  # If run as: ./script.sh "hello world" 42 "bash scripting"
  # Output:
  # All arguments: hello world 42 bash scripting
  
  # Argument: hello world
  # Argument: 42
  # Argument: bash scripting
```

- functions local variables and global variables

Local Variables:
variables declared with local are only accessible within the function where they're declared.
They exist only for the duration of that function's execution.
They don't interfere with variables of the same name in other functions or the global scope.
you cannot directly access local variables of one function from another function.

Global Variables:
variables declared outside of functions, are global variables.

### Run Scripts

| Command | Shell Used | Effect on Current Shell | Runs in New Shell | Requires Execute Permission |
|---------|------------|-------------------------|-------------------|------------------------------|
| `source scriptname.sh` | Current Shell | Yes | No | No |
| `./scriptname.sh` | Shebang or Default | No | Yes | Yes |
| `sh scriptname.sh` | sh Shell (Bourne) | No | Yes | No |
| `bash scriptname.sh` | bash Shell | No | Yes | No |

- Grub2 (Grand Unified Boot Loader)

### GRUB2 Locations and Update Procedures

#### Ubuntu

#### Location
- Configuration file: `/etc/default/grub`
- GRUB files: `/boot/grub/`

#### Update Procedure
1. Edit `/etc/default/grub` as needed
2. Run: `sudo update-grub`

#### CentOS

#### Location
- Configuration file: `/etc/default/grub`
- GRUB files: `/boot/grub2/`

#### Update Procedure
1. Edit `/etc/default/grub` as needed
2. For BIOS systems, run: `sudo grub2-mkconfig -o /boot/grub2/grub.cfg`
3. For UEFI systems, run: `sudo grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg`

> Note: Always back up your configuration before making changes.
