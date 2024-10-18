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
or
type chsh -s /bin/bash

type sudo -i
echo $SHELL
```

Change the SHELL for Bob from bash to Bourne Shell

Bob's password is caleston123

Note: - Normal users can not execute the high-level tasks so add sudo before the command.

```bash
sudo chsh -s /bin/sh bob
bob@caleston-lp10:~$ echo $SHELL
/bin/bash

# Note: It will be still shows /bin/bash but to verify the change
grep "^bob" /etc/passwd
bob:x:1000:1000::/home/bob:/bin/sh

# Open a new tab
$ echo $SHELL
/bin/sh
$ whoami
bob
$ grep 'bob' /etc/passwd  
bob:x:1000:1000::/home/bob:/bin/sh
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
sed 's|https://github.com/kodekloudhub/solar-system-9.git|"$1"|
g' /home/bob/script/clone_project.sh
#!/bin/bash
project="$1"
project_dir="$(basename "$project" .git)"

clone_project() {
cd /home/bob/git/
git clone "$project"
}

find_files() {
find "/home/bob/git/${project_dir}" -type f | wc -l
}
clone_project "$@"
find_files

sed -i 's|https://github.com/kodekloudhub/solar-system-9.git|"$1"|g' /home/bob/script/clone_project.sh

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

#########
# Gateway
#########
route -n
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

apt remove: Uninstalls a package but keeps its configuration files.
apt purge: Completely uninstalls a package along with its configuration files.
apt autoremove: Removes unnecessary dependencies that are no longer used.

apt vs apt-get: apt is a newer, more user-friendly package manager that combines the functionality of apt-get and apt-cache. It provides a more intuitive interface and better dependency resolution compared to apt-get.


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

### Linux Boot Methods

Linux systems can boot using a variety of methods, depending on the hardware and configuration. This README provides an overview of the primary boot methods for Linux.

#### 1. BIOS Boot (Legacy Boot)

- The traditional boot method, which involves the **Basic Input/Output System (BIOS)**.
- BIOS initializes hardware components and looks for the **Master Boot Record (MBR)** on the bootable device (typically the first 512 bytes of a disk).
- The MBR contains the **bootloader** (e.g., GRUB or LILO) that loads the Linux kernel.
- Suitable for systems with older hardware.
- Limitation: MBR supports a maximum disk size of 2TB and only four primary partitions.

#### 2. UEFI Boot

- Stands for **Unified Extensible Firmware Interface** and is a modern replacement for BIOS.
- UEFI can handle larger disk sizes (up to 9 ZB) and has better hardware initialization.
- Uses the **GUID Partition Table (GPT)** instead of MBR.
- UEFI boots by looking for an EFI System Partition (ESP) with a bootloader file (e.g., `grubx64.efi`).
- Supports Secure Boot, which ensures that only trusted OS loaders are executed.
- Supports a more advanced boot management interface and can store multiple bootloaders.

#### 3. PXE (Preboot Execution Environment) Boot

- Allows booting a system over a network.
- The system's firmware (BIOS/UEFI) initializes the NIC (Network Interface Card) and fetches the bootloader (usually via TFTP).
- Typically used in environments where systems need to be deployed or managed remotely, such as datacenters or diskless workstations.
- The bootloader can then load the kernel and initrd from a network server.

#### 4. Live CD/USB Boot

- Allows booting Linux from a **Live CD**, **DVD**, or **USB drive**.
- Useful for system recovery, troubleshooting, testing a distribution, or running a system without installing it.
- Most Linux distributions provide an ISO file that can be written to a USB drive.
- The system loads the kernel and filesystem image from the USB/CD and boots into a live session.

#### 5. Booting from ISO

- Booting directly from an ISO file, either mounted in a virtual environment or via specialized bootloader options.
- Can be used in virtual machines (e.g., VirtualBox, VMware) or with tools like GRUB to boot into a Linux installer without physically burning an ISO.

#### 6. iSCSI Boot

- Allows booting a system from an **iSCSI target** (a disk or partition on a remote server).
- Used in enterprise environments where centralized storage is preferred.
- Firmware must support iSCSI or have an iSCSI boot ROM for this option.

#### 7. USB Mass Storage Device Boot

- Similar to a Live USB boot, but can include configurations for fully-installed operating systems.
- Often used when no internal storage is available or for portable installations.

#### 8. Booting with a Hypervisor (Virtualization Boot)

- Systems boot within a virtual environment using a hypervisor like **KVM**, **Xen**, or **VMware**.
- Bootloader and disk configurations are handled through virtual machine configurations.

#### 9. System Rescue Boot

- Some distributions and tools (like **SystemRescueCD**) are designed specifically to boot into a rescue mode for troubleshooting and system repair.
- Usually, they contain utilities like `fsck`, `parted`, `chroot`, and other diagnostic tools.

#### 10. Embedded Systems Boot (U-Boot)

- For embedded systems, bootloaders like **Das U-Boot** are used.
- U-Boot initializes hardware and boots the kernel in ARM, PowerPC, or other embedded architectures.

#### Common Linux Bootloaders

- **GRUB (GRand Unified Bootloader)**: The most widely used bootloader for Linux systems. Supports both BIOS and UEFI systems.
- **GRUB2**: A modernized version of GRUB with better support for complex configurations.
- **LILO (Linux Loader)**: An older bootloader, less common today.
- **Syslinux/ISOLINUX**: Lightweight bootloaders often used for booting from removable media or network.

These boot methods depend on the system's hardware, firmware (BIOS or UEFI), and the specific use case.

### Linux `daemon-reload` Command

#### Overview

In Linux, `daemon-reload` refers to a command used to reload the systemd manager configuration. Specifically, it means using the `systemctl daemon-reload` command to tell systemd to re-read all its unit files (such as service, timer, and target files) without restarting the system.

#### Usage

You typically run `systemctl daemon-reload` after making changes to the unit files located in directories like `/etc/systemd/system/` or `/lib/systemd/system/`.

#### Common Scenarios

1. **After editing an existing service file** to change configurations.
2. **After creating a new service file** to define a new systemd service.
3. **After removing a service file** to ensure that systemd is aware of the changes.

#### Importance

`systemctl daemon-reload` updates the systemd manager's internal representation of the unit files. Without running this command, systemd may not detect changes made to the service files, causing the system to continue using old or missing configurations.

#### Syntax

```bash
systemctl daemon-reload
```

#### Note

Remember to run this command with sudo privileges if you're not logged in as the root user:

```bash
sudo systemctl daemon-reload
```


### Linux Boot Process

#### Steps

1. **BIOS/UEFI**: The process begins with either the BIOS (Basic Input/Output System) or UEFI (Unified Extensible Firmware Interface). This firmware initializes the hardware and looks for a bootable device.

2. **GRUB/GRUB2**: The Grand Unified Bootloader (GRUB) or its successor GRUB2 is loaded. This bootloader presents a menu allowing the user to choose which kernel to boot.

3. **vmlinux**: This is the Linux kernel, which is loaded into memory and started by GRUB.

4. **initrd/initramfs**: The initial RAM disk (initrd) or initial RAM filesystem (initramfs) is loaded. This contains essential drivers and modules needed to mount the root filesystem.

5. **Full Kernel**: The full Linux kernel starts running, initializing hardware and mounting the root filesystem.

6. **Init System**: Finally, the init system (often systemd in modern distributions) takes over, starting system services and bringing the system to a usable state.

#### Additional Components

###### InitramFS
InitramFS (initial RAM filesystem) is a temporary root filesystem used during the boot process. It's loaded into memory by the bootloader and contains essential drivers, modules, and tools needed to mount the actual root filesystem and continue the boot process.

###### Dracut
Dracut is an event-driven initramfs infrastructure. It's a tool used to create the initial ramdisk (initramfs) used in the Linux boot process. Here are some key points about Dracut:

- **Purpose**: Dracut creates a minimal generic initramfs that can boot on a variety of hardware configurations.
- **Flexibility**: It allows for easy customization of the initramfs through modules and configuration files.
- **Dynamic**: Dracut generates the initramfs dynamically, including only the drivers and tools necessary for the specific system.
- **Wide Adoption**: It's used by many major Linux distributions, including Fedora, RHEL, CentOS, and openSUSE.
- **Integration**: Dracut works closely with the kernel and init system to ensure a smooth boot process.
- **Troubleshooting**: It includes tools for debugging boot problems and can create a rescue initramfs for system recovery.

##### Notes

- The boot process is sequential, with each step handing off to the next.
- The specific details may vary slightly between different Linux distributions.
- Understanding this process can be crucial for troubleshooting boot issues or customizing the boot process.
- Tools like Dracut play a crucial role in creating a flexible and efficient boot process across diverse hardware configurations.

### Understanding Sparse Files and Disk Usage

### Observed Behavior

1. `du -hs /var/log/` shows a total size of 210M.
2. `find /var/log/ -type f -exec du -hs --apparent-size {} + | sort -hr | head -n1` shows `app.log` with an apparent size of 1.0G.

#### Explanation

The discrepancy is due to the presence of a sparse file, specifically `app.log`.

#### What is a Sparse File?

A sparse file is a type of file that intelligently manages disk space. It doesn't allocate disk space for empty regions, only storing meaningful data. This results in a file that appears larger than the physical space it occupies on disk.

#### Key Points

- **Physical Size**: The actual space used on disk (210M in this case).
- **Apparent Size**: The logical size of the file, including empty regions (1.0G for `app.log`).

- **Physical Size**: (du -h without --apparent-size): Represents the actual space occupied on the disk.
- **Apparent Size**: (--apparent-size): Represents the total size of the file as if all blocks were fully used.

#### Verification Commands

1a. Show physical size of all files: (actual size on disk)
   ```bash
   find /var/log/ -type f -exec du -h {} + | sort -hr | head
   ```
1b. Show apparent size of all files: (logical size)
   ```bash
   find /var/log/ -type f -exec du -h --apparent-size {} + | sort -hr | head
   ```


2. Compare apparent size and physical size:
   ```bash
   stat /var/log/app.log
   ```

3. Calculate disk usage including sparse files:
   ```bash
   du -hs --apparent-size /var/log/
   ```

#### Resolving the Discrepancy

To make the physical size match the apparent size, you can rewrite the sparse file with actual data:

```bash
dd if=/dev/zero of=/var/log/app.log bs=1M count=1024
```

Note: dd bs is the block size, and count is the number of blocks. This command writes 1024 blocks of 1M each, filling the file with zeros.

```bash
dd --help
truncate --help
```

After this, `du -hs /var/log/` should show a size closer to 1.0G plus the size of other files.

#### Conclusion

Understanding sparse files is crucial for accurately interpreting disk usage. While they save physical space, they can lead to confusion when comparing different disk usage reporting methods.

### Linux kernel Modules

#### Loading and Blacklisting Kernel Modules on Boot

Kernel modules are pieces of code that can be loaded and unloaded into the kernel on demand. They extend the functionality of the kernel without the need to reboot the system. Loading modules automatically on boot ensures that your system has all the necessary functionality available from startup. Conversely, blacklisting modules prevents them from loading, which can be useful for troubleshooting or when a module is causing conflicts.

#### Loading Modules

There are two main methods to load kernel modules on boot:

#### Using /etc/modules

1. Open the `/etc/modules` file with root privileges:

   ```
   sudo nano /etc/modules
   ```

2. Add the name of the module you want to load, one per line. For example:

   ```
   # /etc/modules
   nvidia
   vboxdrv
   ```

3. Save the file and exit.

#### Using /etc/modules-load.d/

1. Create a new .conf file in the `/etc/modules-load.d/` directory. Name it descriptively, e.g., `mymodules.conf`:

   ```
   sudo nano /etc/modules-load.d/mymodules.conf
   ```

2. Add the names of the modules you want to load, one per line:

   ```
   # /etc/modules-load.d/mymodules.conf
   nvidia
   vboxdrv
   ```

3. Save the file and exit.

#### Adding Module Parameters

If your module requires parameters, you can set them in the `/etc/modprobe.d/` directory:

1. Create a new .conf file in `/etc/modprobe.d/`. For example:

   ```
   sudo nano /etc/modprobe.d/mymodule_params.conf
   ```

2. Add the module options using this format:

   ```
   options module_name parameter1=value1 parameter2=value2
   ```

   For example:

   ```
   options nvidia NVreg_EnableMSI=0
   ```

3. Save the file and exit.

#### Blacklisting Modules

Blacklisting a module prevents it from loading automatically. This is useful when you want to disable a module that's causing problems or conflicts with other modules.

1. Create a new .conf file in the `/etc/modprobe.d/` directory. A common naming convention is `blacklist-<module>.conf`:

   ```
   sudo nano /etc/modprobe.d/blacklist-nouveau.conf
   ```

2. Add the blacklist directive for each module you want to prevent from loading:

   ```
   # /etc/modprobe.d/blacklist-nouveau.conf
   blacklist nouveau
   ```

3. You can blacklist multiple modules in the same file:

   ```
   blacklist nouveau
   blacklist radeon
   blacklist amdgpu
   ```

4. Save the file and exit.

5. After blacklisting, you may need to update the initial ramdisk (initramfs). On Ubuntu and Debian-based systems:

   ```
   sudo update-initramfs -u
   ```

   On Fedora or CentOS:

   ```
   sudo dracut --force
   ```

6. Reboot your system for the changes to take effect.

Note: Blacklisting a module doesn't guarantee it won't be loaded if another module depends on it. In such cases, you might need to use the `install` directive to force the module to do nothing:

```
install nouveau /bin/false
```

This tells the system to run `/bin/false` instead of loading the module, effectively preventing it from loading.

#### Troubleshooting

- If a module fails to load, check the system logs:

  ```
  journalctl -b | grep 'module'
  ```

- Ensure that the module is available in your kernel:

  ```
  modinfo module_name
  ```

- Verify that all dependencies are met. You can check module dependencies with:

  ```
  modprobe --show-depends module_name
  ```

- To check if a module is currently loaded:

  ```
  lsmod | grep module_name
  ```

- If a blacklisted module is still loading, check if it's being loaded as a dependency. You can use `modprobe` with the `--show-depends` option to see the dependency tree.

Remember to replace `module_name` with the actual name of your module in the examples above.

### Linux Kernel Module Management Commands

#### insmod and rmmod

#### insmod (Insert Module)
- **Purpose**: Inserts a module into the Linux kernel.
- **Usage**: `insmod [module_name.ko]`
- **Example**: `insmod mymodule.ko`
- **Note**: Requires the full path to the module file and doesn't handle dependencies.

#### rmmod (Remove Module)
- **Purpose**: Removes a module from the Linux kernel.
- **Usage**: `rmmod [module_name]`
- **Example**: `rmmod mymodule`
- **Note**: The module must not be in use by any process or other module.

#### modprobe and lsmod

#### modprobe
- **Purpose**: Intelligently adds or removes modules from the Linux kernel.
- **Usage**:
    - To load: `modprobe [module_name]`
    - To unload: `modprobe -r [module_name]`
- **Example**:
    - Load: `modprobe bluetooth`
    - Unload: `modprobe -r bluetooth`
- **Note**: Handles dependencies automatically using the module database.

#### lsmod
- **Purpose**: Shows the status of modules in the Linux kernel.
- **Usage**: `lsmod`
- **Output**: Displays a list of loaded kernel modules, their sizes, and dependencies.

#### depmod

#### depmod
- **Purpose**: Generates a list of dependency descriptions for kernel modules.
- **Usage**: `depmod [-a]`
- **Note**:
    - Usually run automatically when installing a new kernel or modules.
    - The `-a` option forces a probe of all modules.
- **Function**: Creates the module dependency file used by modprobe.

These commands are crucial for system administrators and developers working with Linux kernel modules, allowing for efficient management and troubleshooting of kernel functionality.

**Note: The modprobe command operates at a higher abstraction level, serving as a user-facing interface that ultimately invokes insmod for kernel module management. This is conceptually similar to how ufw modifies firewall rules by interacting directly with iptables at a lower level.**

#### Amazon Ubuntu Box 22lts
```bash
sudo modprobe toshiba_bluetooth
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# lsmod | grep -i blue
toshiba_bluetooth      16384  0
sudo depmod -a
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# sudo modprobe -r toshiba_bluetooth
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# lsmod | grep -i blue
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# cat /etc/os-release 
PRETTY_NAME="Ubuntu 22.04.4 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.4 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# hostnamectl 
 Static hostname: d8d3ed90041c.mylabserver.com
       Icon name: computer-vm
         Chassis: vm
      Machine ID: ec2781cfcdcece29b987d3b72c65f0dd
         Boot ID: 219e41a31d2646ae99bcd83ca76eb302
  Virtualization: amazon
Operating System: Ubuntu 22.04.4 LTS              
          Kernel: Linux 6.8.0-1015-aws
    Architecture: x86-64
 Hardware Vendor: Amazon EC2
  Hardware Model: t3a.large
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# ls /lib/mod
modprobe.d/     modules/        modules-load.d/ 
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# ls /lib/modules
modules/        modules-load.d/ 
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# ls /lib/modules/
5.15.0-1023-aws/ 5.15.0-1030-aws/ 5.19.0-1027-aws/ 6.2.0-1013-aws/  6.5.0-1014-aws/  6.5.0-1023-aws/  6.8.0-1015-aws/  
5.15.0-1026-aws/ 5.19.0-1023-aws/ 6.2.0-1009-aws/  6.2.0-1017-aws/  6.5.0-1022-aws/  6.5.0-1024-aws/  
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# uname -a
Linux d8d3ed90041c.mylabserver.com 6.8.0-1015-aws #16~22.04.1-Ubuntu SMP Mon Aug 19 19:38:17 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# uname -r
6.8.0-1015-aws
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# cd /lib/modules/6.8.0-1015-aws/
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# ls
build   kernel         modules.alias.bin  modules.builtin.alias.bin  modules.builtin.modinfo  modules.dep.bin  modules.order    modules.symbols      vdso
initrd  modules.alias  modules.builtin    modules.builtin.bin        modules.dep              modules.devname  modules.softdep  modules.symbols.bin
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# ls kernel/
arch  block  crypto  drivers  fs  kernel  lib  mm  net  samples  sound  ubuntu  v4l2loopback  virt  zfs
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# ls kernel/sound/
soundcore.ko
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# ls -l /lib/modules/$(uname -r)/kernel/drivers/
total 460
drwxr-xr-x  5 root root  4096 Sep 30 11:17 accel
drwxr-xr-x  5 root root  4096 Sep 27 11:25 acpi
drwxr-xr-x  2 root root  4096 Sep 30 11:18 android
drwxr-xr-x  3 root root  4096 Sep 30 11:18 ata
drwxr-xr-x  2 root root  4096 Sep 30 11:18 atm
drwxr-xr-x  2 root root  4096 Sep 30 11:18 auxdisplay
drwxr-xr-x  3 root root  4096 Sep 30 11:17 base
drwxr-xr-x  2 root root  4096 Sep 27 11:25 bcma
drwxr-xr-x  9 root root  4096 Sep 30 11:18 block
drwxr-xr-x  3 root root  4096 Sep 30 11:17 bus
drwxr-xr-x  8 root root  4096 Sep 30 11:18 char
drwxr-xr-x  3 root root  4096 Sep 30 11:18 clk
drwxr-xr-x  4 root root  4096 Sep 30 11:18 comedi
drwxr-xr-x  2 root root  4096 Sep 30 11:18 counter
drwxr-xr-x  2 root root  4096 Sep 30 11:18 cpufreq
drwxr-xr-x  2 root root  4096 Sep 30 11:18 cpuidle
drwxr-xr-x  9 root root  4096 Sep 30 11:18 crypto
drwxr-xr-x  3 root root  4096 Sep 30 11:18 cxl
drwxr-xr-x  3 root root  4096 Sep 30 11:18 dax
drwxr-xr-x  2 root root  4096 Sep 27 11:25 dca
drwxr-xr-x 10 root root  4096 Sep 30 11:18 dma
drwxr-xr-x  2 root root  4096 Sep 30 11:18 edac
drwxr-xr-x  2 root root  4096 Sep 30 11:18 extcon
drwxr-xr-x  2 root root  4096 Sep 30 11:18 firewire
drwxr-xr-x  3 root root  4096 Sep 30 11:18 firmware
drwxr-xr-x  2 root root  4096 Sep 30 11:18 fpga
drwxr-xr-x  2 root root  4096 Sep 30 11:18 gnss
drwxr-xr-x  2 root root  4096 Sep 30 11:18 gpio
drwxr-xr-x  3 root root  4096 Sep 27 11:25 gpu
drwxr-xr-x  2 root root  4096 Sep 30 11:18 greybus
drwxr-xr-x  6 root root 12288 Sep 30 11:18 hid
drwxr-xr-x  3 root root  4096 Sep 30 11:18 hsi
drwxr-xr-x  2 root root  4096 Sep 27 11:25 hv
drwxr-xr-x  4 root root 12288 Sep 30 11:18 hwmon
drwxr-xr-x  4 root root  4096 Sep 30 11:18 hwtracing
drwxr-xr-x  5 root root  4096 Sep 30 11:18 i2c
drwxr-xr-x  3 root root  4096 Sep 30 11:18 i3c
drwxr-xr-x 31 root root  4096 Sep 30 11:18 iio
drwxr-xr-x  6 root root  4096 Sep 30 11:18 infiniband
drwxr-xr-x 11 root root  4096 Sep 30 11:18 input
drwxr-xr-x  3 root root  4096 Sep 27 11:25 iommu
drwxr-xr-x  4 root root  4096 Sep 30 11:18 ipack
drwxr-xr-x  2 root root  4096 Sep 30 11:18 irqchip
drwxr-xr-x  4 root root  4096 Sep 30 11:18 isdn
drwxr-xr-x  6 root root  4096 Sep 30 11:18 leds
drwxr-xr-x  2 root root  4096 Sep 30 11:18 macintosh
drwxr-xr-x  2 root root  4096 Sep 30 11:18 mailbox
drwxr-xr-x  2 root root  4096 Sep 30 11:18 mcb
drwxr-xr-x  4 root root  4096 Sep 27 11:25 md
drwxr-xr-x 19 root root  4096 Sep 30 11:18 media
drwxr-xr-x  2 root root  4096 Sep 30 11:18 memory
drwxr-xr-x  4 root root  4096 Sep 30 11:18 memstick
drwxr-xr-x  3 root root  4096 Sep 27 11:25 message
drwxr-xr-x  2 root root  4096 Sep 30 11:18 mfd
drwxr-xr-x 20 root root  4096 Sep 30 11:18 misc
drwxr-xr-x  4 root root  4096 Sep 30 11:18 mmc
drwxr-xr-x  2 root root  4096 Sep 30 11:18 most
drwxr-xr-x 11 root root  4096 Sep 30 11:18 mtd
drwxr-xr-x  2 root root  4096 Sep 30 11:18 mux
drwxr-xr-x 33 root root  4096 Sep 30 11:18 net
drwxr-xr-x 12 root root  4096 Sep 30 11:18 nfc
drwxr-xr-x  4 root root  4096 Sep 30 11:18 ntb
drwxr-xr-x  2 root root  4096 Sep 30 11:18 nvdimm
drwxr-xr-x  5 root root  4096 Sep 27 11:25 nvme
drwxr-xr-x  2 root root  4096 Sep 30 11:18 nvmem
drwxr-xr-x  2 root root  4096 Sep 30 11:18 parport
drwxr-xr-x  6 root root  4096 Sep 30 11:18 pci
drwxr-xr-x  2 root root  4096 Sep 30 11:18 pcmcia
drwxr-xr-x  2 root root  4096 Sep 30 11:18 peci
drwxr-xr-x  2 root root  4096 Sep 30 11:18 perf
drwxr-xr-x  9 root root  4096 Sep 30 11:18 phy
drwxr-xr-x  4 root root  4096 Sep 30 11:18 pinctrl
drwxr-xr-x  5 root root  4096 Sep 30 11:18 platform
drwxr-xr-x  4 root root  4096 Sep 30 11:18 power
drwxr-xr-x  2 root root  4096 Sep 30 11:18 powercap
drwxr-xr-x  3 root root  4096 Sep 30 11:18 pps
drwxr-xr-x  2 root root  4096 Sep 30 11:18 ptp
drwxr-xr-x  2 root root  4096 Sep 30 11:18 pwm
drwxr-xr-x  4 root root  4096 Sep 30 11:18 rapidio
drwxr-xr-x  2 root root 12288 Sep 30 11:18 regulator
drwxr-xr-x  2 root root  4096 Sep 30 11:18 reset
drwxr-xr-x  2 root root  4096 Sep 30 11:18 rpmsg
drwxr-xr-x  2 root root  4096 Sep 30 11:18 rtc
drwxr-xr-x 34 root root  4096 Sep 30 11:18 scsi
drwxr-xr-x  2 root root  4096 Sep 30 11:18 siox
drwxr-xr-x  2 root root  4096 Sep 30 11:18 slimbus
drwxr-xr-x  4 root root  4096 Sep 30 11:18 soc
drwxr-xr-x  2 root root  4096 Sep 27 11:25 soundwire
drwxr-xr-x  2 root root  4096 Sep 30 11:18 spi
drwxr-xr-x  2 root root  4096 Sep 30 11:18 spmi
drwxr-xr-x  2 root root  4096 Sep 27 11:25 ssb
drwxr-xr-x 20 root root  4096 Sep 30 11:18 staging
drwxr-xr-x  7 root root  4096 Sep 30 11:18 target
drwxr-xr-x  3 root root  4096 Sep 30 11:18 tee
drwxr-xr-x  3 root root  4096 Sep 30 11:18 thermal
drwxr-xr-x  2 root root  4096 Sep 30 11:18 thunderbolt
drwxr-xr-x  4 root root  4096 Sep 30 11:18 tty
drwxr-xr-x  4 root root  4096 Sep 30 11:18 ufs
drwxr-xr-x  2 root root  4096 Sep 30 11:18 uio
drwxr-xr-x 24 root root  4096 Sep 30 11:18 usb
drwxr-xr-x 10 root root  4096 Sep 30 11:18 vdpa
drwxr-xr-x  4 root root  4096 Sep 27 11:25 vfio
drwxr-xr-x  2 root root  4096 Sep 27 11:25 vhost
drwxr-xr-x  4 root root  4096 Sep 30 11:18 video
drwxr-xr-x  6 root root  4096 Sep 30 11:18 virt
drwxr-xr-x  2 root root  4096 Sep 27 11:25 virtio
drwxr-xr-x  4 root root  4096 Sep 30 11:18 w1
drwxr-xr-x  2 root root  4096 Sep 30 11:18 watchdog
drwxr-xr-x  4 root root  4096 Sep 27 11:25 xen
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# find /lib/modules/$(uname -r) -type f -name '*bluetooth*.ko*'
/lib/modules/6.8.0-1015-aws/kernel/drivers/platform/x86/toshiba_bluetooth.ko
root@d8d3ed90041c:/lib/modules/6.8.0-1015-aws# 
```
### Linux Networking

#### Route

- What is your gateway address?
```bash
route -n 

ip route
```

- trouble shoot correct and in correct flags
```bash
 
root@d8d3ed90041c:/home/cloud_user# netstat -r
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
default         _gateway        0.0.0.0         UG        0 0          0 ens5
172.17.0.0      0.0.0.0         255.255.0.0     U         0 0          0 docker0
172.31.0.2      _gateway        255.255.255.255 UGH       0 0          0 ens5
172.31.32.0     0.0.0.0         255.255.240.0   U         0 0          0 ens5
_gateway        0.0.0.0         255.255.255.255 UH        0 0          0 ens5
root@d8d3ed90041c:/home/cloud_user# ping 172.17.0.0
PING 172.17.0.0 (172.17.0.0) 56(84) bytes of data.
From 172.17.0.1 icmp_seq=1 Destination Host Unreachable
From 172.17.0.1 icmp_seq=2 Destination Host Unreachable
From 172.17.0.1 icmp_seq=3 Destination Host Unreachable
From 172.17.0.1 icmp_seq=4 Destination Host Unreachable
From 172.17.0.1 icmp_seq=5 Destination Host Unreachable
From 172.17.0.1 icmp_seq=6 Destination Host Unreachable
From 172.17.0.1 icmp_seq=7 Destination Host Unreachable
From 172.17.0.1 icmp_seq=8 Destination Host Unreachable
From 172.17.0.1 icmp_seq=9 Destination Host Unreachable
^C
--- 172.17.0.0 ping statistics ---
12 packets transmitted, 0 received, +9 errors, 100% packet loss, time 11270ms
pipe 4
root@d8d3ed90041c:/home/cloud_user# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         _gateway        0.0.0.0         UG    100    0        0 ens5
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
172.31.0.2      _gateway        255.255.255.255 UGH   100    0        0 ens5
172.31.32.0     0.0.0.0         255.255.240.0   U     100    0        0 ens5
_gateway        0.0.0.0         255.255.255.255 UH    100    0        0 ens5
root@d8d3ed90041c:/home/cloud_user# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         172.31.32.1     0.0.0.0         UG    100    0        0 ens5
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
172.31.0.2      172.31.32.1     255.255.255.255 UGH   100    0        0 ens5
172.31.32.0     0.0.0.0         255.255.240.0   U     100    0        0 ens5
172.31.32.1     0.0.0.0         255.255.255.255 UH    100    0        0 ens5
root@d8d3ed90041c:/home/cloud_user# ping 172.31.32.1
PING 172.31.32.1 (172.31.32.1) 56(84) bytes of data.
64 bytes from 172.31.32.1: icmp_seq=1 ttl=64 time=0.081 ms
64 bytes from 172.31.32.1: icmp_seq=2 ttl=64 time=0.076 ms
64 bytes from 172.31.32.1: icmp_seq=3 ttl=64 time=0.144 ms
^C
--- 172.31.32.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2068ms
rtt min/avg/max/mdev = 0.076/0.100/0.144/0.030 ms

ip route                                                                                                                                  10/02/2024 03:43:22 AM
default via 172.31.32.1 dev ens5 proto dhcp src 172.31.44.189 metric 100 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown 
172.31.0.2 via 172.31.32.1 dev ens5 proto dhcp src 172.31.44.189 metric 100 
172.31.32.0/20 dev ens5 proto kernel scope link src 172.31.44.189 metric 100 
172.31.32.1 dev ens5 proto dhcp scope link src 172.31.44.189 metric 100 
```

Routing Table Analysis
netstat -r and route Outputs: The routing table lists different routes based on the destination network, gateway, netmask, flags, and the interface associated with each route.

default: The default route (0.0.0.0), typically used for forwarding packets to destinations not specified in other routes. It uses the gateway _gateway, which corresponds to 172.31.32.1 as seen in the route -n output.
172.17.0.0: This route is associated with the docker0 interface. It covers the IP range 172.17.0.0/16, which is commonly used by Docker for its container networking. It has a direct connection (U flag) without requiring a gateway.
172.31.0.2: This specific host route (255.255.255.255 netmask) indicates a route to 172.31.0.2 via _gateway. It uses the ens5 interface.
172.31.32.0: This route points to the subnet 172.31.32.0/20 and is directly connected to the ens5 interface, indicating a local subnet.
_gateway: This entry shows the specific gateway _gateway (corresponding to 172.31.32.1) used for some routes. This is common when using private subnets in a cloud environment.
route -n Output: The same routing table is displayed but with numerical values for IP addresses. This view is useful for understanding the exact IP addresses used by routes.

Default Route (0.0.0.0): Uses 172.31.32.1 as the gateway, which is the main route for traffic leaving the local network.
172.17.0.0: Route associated with the docker0 interface.
172.31.0.2: Host route with 172.31.32.1 as the gateway.
172.31.32.0: Directly connected to the ens5 interface.
172.31.32.1: This route indicates a host route pointing directly to the gateway.
Ping Analysis
Pinging 172.17.0.0: The ping command to 172.17.0.0 fails with "Destination Host Unreachable". This is because 172.17.0.0 is a network address, not a valid host address. Network addresses represent the start of a subnet, and they cannot be used to reach a specific host. The error message originates from 172.17.0.1, which is likely the local gateway for the Docker network (docker0).

Pinging 172.31.32.1: The ping to 172.31.32.1 is successful, indicating that this IP is reachable. This IP is the gateway for your system, typically managed by the cloud network provider (AWS, GCP, etc.), and serves as the primary route for outbound traffic.

Summary
The network routing table indicates that the system is using ens5 for cloud-based routing (172.31.x.x subnets), while docker0 is used for internal Docker networking (172.17.0.0/16).
Pinging a network address (172.17.0.0) will fail because it is not a valid host IP, whereas pinging a gateway IP (172.31.32.1) will succeed as long as the network is properly configured.

### DNS Tool

#### dig (Domain Information Groper)

`dig` is a flexible tool for interrogating DNS name servers. It performs DNS lookups and displays the answers returned from the queried name server(s).

#### Basic Usage

```bash
dig example.com
```

#### Specify Record Type

```bash
dig example.com A    # IPv4 address
dig example.com AAAA # IPv6 address
dig example.com MX   # Mail exchanger
dig example.com NS   # Name servers
```

#### Use a Specific DNS Server

```bash
dig @8.8.8.8 example.com
```

#### Short Answer

```bash
dig example.com +short
```

#### Reverse DNS Lookup

```bash
dig -x 192.0.2.1
```

#### nslookup (Name Server Lookup)

`nslookup` is a program to query Internet domain name servers. It has two modes: interactive and non-interactive.

#### Basic Usage (Non-interactive)

```bash
nslookup example.com
```

#### Specify Record Type

```bash
nslookup -type=A example.com    # IPv4 address
nslookup -type=AAAA example.com # IPv6 address
nslookup -type=MX example.com   # Mail exchanger
nslookup -type=NS example.com   # Name servers
```

#### Use a Specific DNS Server

```bash
nslookup example.com 8.8.8.8
```

#### Reverse DNS Lookup

```bash
nslookup 192.0.2.1
```

#### host

`host` is a simple utility for performing DNS lookups. It is normally used to convert names to IP addresses and vice versa.

#### Basic Usage

```bash
host example.com
```

#### Specify Record Type

```bash
host -t A example.com    # IPv4 address
host -t AAAA example.com # IPv6 address
host -t MX example.com   # Mail exchanger
host -t NS example.com   # Name servers
```

#### Use a Specific DNS Server

```bash
host example.com 8.8.8.8
```

#### Reverse DNS Lookup

```bash
host 192.0.2.1
```

#### Verbose Output

```bash
host -v example.com
```

#### Note on Using Specific DNS Servers

For all these tools, if you want to use a specific DNS server instead of your default DNS server, you can specify it in the command. For example:

```bash
dig @1.1.1.1 google.com
nslookup google.com 1.1.1.1
host google.com 1.1.1.1
```

This will use Cloudflare's DNS server (1.1.1.1) instead of your system's default DNS server.

### Modifying /etc/hosts Lookup Behavior

This guide explains how to modify the default behavior of `/etc/hosts` lookup by adjusting the configuration in the Name Service Switch (NSS) file.

#### Location of NSS Configuration

The NSS configuration file is located at:

```
/etc/nsswitch.conf
```

#### How to Modify nsswitch.conf

Follow these steps to modify the `nsswitch.conf` file:

1. Open the file using a text editor, such as `nano` or `vim`:

   ```bash
   sudo nano /etc/nsswitch.conf
   ```

2. Look for the line that starts with `hosts:`. By default, it may look something like this:

   ```
   hosts: files dns
   ```

    - `files` means the system will first look at `/etc/hosts`.
    - `dns` indicates that DNS will be checked next if no match is found in `/etc/hosts`.

3. To change the order or remove `/etc/hosts` lookup, modify this line. For example:

    - **Use only DNS**:
      ```
      hosts: dns
      ```

    - **Use `/etc/hosts` after DNS**:
      ```
      hosts: dns files
      ```

4. Save the file and exit the editor (`Ctrl + X` and then `Y` in `nano`).

#### Important Notes

- This setting controls the order in which name resolution occurs for all programs using the system's libraries.
- It's crucial to carefully test the changes to ensure that name resolution behaves as expected.

#### Caution

Modifying system files can have significant impacts on your system's behavior. Always make a backup of the original file before making changes, and ensure you have a way to revert changes if needed.

### Internal & External Commands

- How we check command is internal or external?
```bash
type echo
echo is a shell builtin

type mv
mv is /usr/bin/mv
```

### Alternative command for cd in Linux

- How to change directory in Linux without using cd command?
```bash
pushd /path/to/directory
```

- Command popd is used to remove the top directory from the stack and perform a cd to the new top directory.
```bash
popd
```

- Debian based systems network
```bash
/etc/network/interfaces # ubuntu 16.04
/etc/netplan/50-cloud-init.yaml # ubuntu 18.04
```

- Network management commands in Debian based systems
```bash
sudo netplan apply
sudo netplan --debug generate
systemctl status NetworkManager
systemctl status systemd-networkd
networkctl status
```

### Linux help

```bash
man test
help test
date --help
```

- apropos command is used to search the manual page names and descriptions.
```bash
apropos modp
modprobe (8)         - Add and remove modules from the Linux Kernel
modprobe.d (5)       - Configuration directory for modprobe

apropos docke
docker (1)           - Docker image and container command line interface
docker-attach (1)    - Attach local standard input, output, and error streams to a running container
docker-build (1)     - Build an image from a Dockerfile
docker-builder (1)   - Manage builds
docker-builder-build (1) - Build an image from a Dockerfile
docker-builder-prune (1) - Remove build cache
docker-checkpoint (1) - Manage checkpoints
docker-checkpoint-create (1) - Create a checkpoint from a running container
docker-checkpoint-ls (1) - List checkpoints for a container
docker-checkpoint-rm (1) - Remove a checkpoint
docker-commit (1)    - Create a new image from a container's changes
docker-config (1)    - Manage Swarm configs
docker-config-create (1) - Create a config from a file or STDIN
docker-config-inspect (1) - Display detailed information on one or more configs
docker-config-json (5) - Default Docker configuration file
docker-config-ls (1) - List configs
docker-config-rm (1) - Remove one or more configs
docker-container (1) - Manage containers
docker-container-attach (1) - Attach local standard input, output, and error streams to a running container
docker-container-commit (1) - Create a new image from a container's changes
docker-container-cp (1) - Copy files/folders between a container and the local filesystem
docker-container-create (1) - Create a new container
docker-container-diff (1) - Inspect changes to files or directories on a container's filesystem
docker-container-exec (1) - Execute a command in a running container
docker-container-export (1) - Export a container's filesystem as a tar archive
docker-container-inspect (1) - Display detailed information on one or more containers
docker-container-kill (1) - Kill one or more running containers
docker-container-logs (1) - Fetch the logs of a container
docker-container-ls (1) - List containers
docker-container-pause (1) - Pause all processes within one or more containers
docker-container-port (1) - List port mappings or a specific mapping for the container
docker-container-prune (1) - Remove all stopped containers
docker-container-rename (1) - Rename a container
docker-container-restart (1) - Restart one or more containers
docker-container-rm (1) - Remove one or more containers
docker-container-run (1) - Create and run a new container from an image
docker-container-start (1) - Start one or more stopped containers
docker-container-stats (1) - Display a live stream of container(s) resource usage statistics
docker-container-stop (1) - Stop one or more running containers
docker-container-top (1) - Display the running processes of a container
docker-container-unpause (1) - Unpause all processes within one or more containers
docker-container-update (1) - Update configuration of one or more containers
docker-container-wait (1) - Block until one or more containers stop, then print their exit codes
docker-context (1)   - Manage contexts
docker-context-create (1) - Create a context
docker-context-export (1) - Export a context to a tar archive FILE or a tar stream on STDOUT.
docker-context-import (1) - Import a context from a tar or zip file
docker-context-inspect (1) - Display detailed information on one or more contexts
docker-context-ls (1) - List contexts
docker-context-rm (1) - Remove one or more contexts
docker-context-show (1) - Print the name of the current context
docker-context-update (1) - Update a context
docker-context-use (1) - Set the current docker context
docker-cp (1)        - Copy files/folders between a container and the local filesystem
docker-create (1)    - Create a new container
docker-diff (1)      - Inspect changes to files or directories on a container's filesystem
docker-events (1)    - Get real time events from the server
docker-exec (1)      - Execute a command in a running container
docker-export (1)    - Export a container's filesystem as a tar archive
docker-history (1)   - Show the history of an image
docker-image (1)     - Manage images
docker-image-build (1) - Build an image from a Dockerfile
docker-image-history (1) - Show the history of an image
docker-image-import (1) - Import the contents from a tarball to create a filesystem image
docker-image-inspect (1) - Display detailed information on one or more images
docker-image-load (1) - Load an image from a tar archive or STDIN
docker-image-ls (1)  - List images
docker-image-prune (1) - Remove unused images
docker-image-pull (1) - Download an image from a registry
docker-image-push (1) - Upload an image to a registry
docker-image-rm (1)  - Remove one or more images
docker-image-save (1) - Save one or more images to a tar archive (streamed to STDOUT by default)
docker-image-tag (1) - Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
docker-images (1)    - List images
docker-import (1)    - Import the contents from a tarball to create a filesystem image
docker-info (1)      - Display system-wide information
docker-inspect (1)   - Return low-level information on Docker objects
docker-kill (1)      - Kill one or more running containers
docker-load (1)      - Load an image from a tar archive or STDIN
docker-login (1)     - Authenticate to a registry
docker-logout (1)    - Log out from a registry
docker-logs (1)      - Fetch the logs of a container
docker-manifest (1)  - Manage Docker image manifests and manifest lists
docker-manifest-annotate (1) - Add additional information to a local image manifest
docker-manifest-create (1) - Create a local manifest list for annotating and pushing to a registry
docker-manifest-inspect (1) - Display an image manifest, or manifest list
docker-manifest-push (1) - Push a manifest list to a repository
docker-manifest-rm (1) - Delete one or more manifest lists from local storage
docker-network (1)   - Manage networks
docker-network-connect (1) - Connect a container to a network
docker-network-create (1) - Create a network
docker-network-disconnect (1) - Disconnect a container from a network
docker-network-inspect (1) - Display detailed information on one or more networks
docker-network-ls (1) - List networks
docker-network-prune (1) - Remove all unused networks
docker-network-rm (1) - Remove one or more networks
docker-node (1)      - Manage Swarm nodes
docker-node-demote (1) - Demote one or more nodes from manager in the swarm
docker-node-inspect (1) - Display detailed information on one or more nodes
docker-node-ls (1)   - List nodes in the swarm
docker-node-promote (1) - Promote one or more nodes to manager in the swarm
docker-node-ps (1)   - List tasks running on one or more nodes, defaults to current node
docker-node-rm (1)   - Remove one or more nodes from the swarm
docker-node-update (1) - Update a node
docker-pause (1)     - Pause all processes within one or more containers
docker-plugin (1)    - Manage plugins
docker-plugin-create (1) - Create a plugin from a rootfs and configuration. Plugin data directory must contain config.json and rootfs directory.
docker-plugin-disable (1) - Disable a plugin
docker-plugin-enable (1) - Enable a plugin
docker-plugin-inspect (1) - Display detailed information on one or more plugins
docker-plugin-install (1) - Install a plugin
docker-plugin-ls (1) - List plugins
docker-plugin-push (1) - Push a plugin to a registry
docker-plugin-rm (1) - Remove one or more plugins
docker-plugin-set (1) - Change settings for a plugin
docker-plugin-upgrade (1) - Upgrade an existing plugin
docker-port (1)      - List port mappings or a specific mapping for the container
docker-ps (1)        - List containers
docker-pull (1)      - Download an image from a registry
docker-push (1)      - Upload an image to a registry
docker-rename (1)    - Rename a container
docker-restart (1)   - Restart one or more containers
docker-rm (1)        - Remove one or more containers
docker-rmi (1)       - Remove one or more images
docker-run (1)       - Create and run a new container from an image
docker-save (1)      - Save one or more images to a tar archive (streamed to STDOUT by default)
docker-search (1)    - Search Docker Hub for images
docker-secret (1)    - Manage Swarm secrets
docker-secret-create (1) - Create a secret from a file or STDIN as content
docker-secret-inspect (1) - Display detailed information on one or more secrets
docker-secret-ls (1) - List secrets
docker-secret-rm (1) - Remove one or more secrets
docker-service (1)   - Manage Swarm services
docker-service-create (1) - Create a new service
docker-service-inspect (1) - Display detailed information on one or more services
docker-service-logs (1) - Fetch the logs of a service or task
docker-service-ls (1) - List services
docker-service-ps (1) - List the tasks of one or more services
docker-service-rm (1) - Remove one or more services
docker-service-rollback (1) - Revert changes to a service's configuration
docker-service-scale (1) - Scale one or multiple replicated services
docker-service-update (1) - Update a service
docker-stack (1)     - Manage Swarm stacks
docker-stack-config (1) - Outputs the final config file, after doing merges and interpolations
docker-stack-deploy (1) - Deploy a new stack or update an existing stack
docker-stack-ls (1)  - List stacks
docker-stack-ps (1)  - List the tasks in the stack
docker-stack-rm (1)  - Remove one or more stacks
docker-stack-services (1) - List the services in the stack
docker-start (1)     - Start one or more stopped containers
docker-stats (1)     - Display a live stream of container(s) resource usage statistics
docker-stop (1)      - Stop one or more running containers
docker-swarm (1)     - Manage Swarm
docker-swarm-ca (1)  - Display and rotate the root CA
docker-swarm-init (1) - Initialize a swarm
docker-swarm-join (1) - Join a swarm as a node and/or manager
docker-swarm-join-token (1) - Manage join tokens
docker-swarm-leave (1) - Leave the swarm
docker-swarm-unlock (1) - Unlock swarm
docker-swarm-unlock-key (1) - Manage the unlock key
docker-swarm-update (1) - Update the swarm
docker-system (1)    - Manage Docker
docker-system-df (1) - Show docker disk usage
docker-system-events (1) - Get real time events from the server
docker-system-info (1) - Display system-wide information
docker-system-prune (1) - Remove unused data
docker-tag (1)       - Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
docker-top (1)       - Display the running processes of a container
docker-trust (1)     - Manage trust on Docker images
docker-trust-inspect (1) - Return low-level information about keys and signatures
docker-trust-key (1) - Manage keys for signing Docker images
docker-trust-key-generate (1) - Generate and load a signing key-pair
docker-trust-key-load (1) - Load a private key file for signing
docker-trust-revoke (1) - Remove trust for an image
docker-trust-sign (1) - Sign an image
docker-trust-signer (1) - Manage entities who can sign Docker images
docker-trust-signer-add (1) - Add a signer
docker-trust-signer-remove (1) - Remove a signer
docker-unpause (1)   - Unpause all processes within one or more containers
docker-update (1)    - Update configuration of one or more containers
docker-version (1)   - Show the Docker version information
docker-volume (1)    - Manage volumes
docker-volume-create (1) - Create a volume
docker-volume-inspect (1) - Display detailed information on one or more volumes
docker-volume-ls (1) - List volumes
docker-volume-prune (1) - Remove unused local volumes
docker-volume-rm (1) - Remove one or more volumes
docker-volume-update (1) - Update a volume (cluster volumes only)
docker-wait (1)      - Block until one or more containers stop, then print their exit codes
dockerd (8)          - Enable daemon mode
Dockerfile (5)       - automate the steps of creating a Docker image
```

### Persistent environment variables

- How to set environment variables permanently in Linux?
```bash
echo "export VARIABLE=value" >> ~/.profile
source ~/.profile

echo "export VARIABLE=value" >> ~/.pam_environment
source ~/.pam_environment
```

- Note: if variable is not exported then it will not be available in subshell

### PS1 Variable

PS1 is a primary prompt variable. It is used to define the primary prompt string. The default value of PS1 is '\s-\v\$ '.

```bash
man bash

/PROMPTING

man bash | grep -A 15 'PROMPTING'

echo $PS1
\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$
```

### Linux Run Levels

The term runlevels is used in the sysV init systems. These have been replaced by systemd targets in systemd based systems.

The complete list of runlevels and the corresponding systemd targets can be seen below:

runlevel 0 -> poweroff.target

runlevel 1 -> rescue.target

runlevel 2 -> multi-user.target

runlevel 3 -> multi-user.target

runlevel 4 -> multi-user.target

runlevel 5 -> graphical.target

runlevel 6 -> reboot.target


# linux disk management

```bash
root@d8d3ed90041c:~# ls -l /dev/block/
total 0
lrwxrwxrwx 1 root root 10 Oct  5 22:54 259:0 -> ../nvme0n1
lrwxrwxrwx 1 root root 12 Oct  5 22:54 259:1 -> ../nvme0n1p1
lrwxrwxrwx 1 root root 13 Oct  5 22:54 259:2 -> ../nvme0n1p14
lrwxrwxrwx 1 root root 13 Oct  5 22:54 259:3 -> ../nvme0n1p15
lrwxrwxrwx 1 root root  8 Oct  5 22:54 7:0 -> ../loop0
lrwxrwxrwx 1 root root  8 Oct  5 22:54 7:1 -> ../loop1
lrwxrwxrwx 1 root root  9 Oct  5 22:54 7:10 -> ../loop10
lrwxrwxrwx 1 root root  9 Oct  5 22:54 7:11 -> ../loop11
lrwxrwxrwx 1 root root  8 Oct  5 22:54 7:2 -> ../loop2
lrwxrwxrwx 1 root root  8 Oct  5 22:54 7:3 -> ../loop3
lrwxrwxrwx 1 root root  8 Oct  5 22:54 7:4 -> ../loop4
lrwxrwxrwx 1 root root  8 Oct  5 22:54 7:5 -> ../loop5
lrwxrwxrwx 1 root root  8 Oct  5 22:54 7:6 -> ../loop6
lrwxrwxrwx 1 root root  8 Oct  5 22:54 7:7 -> ../loop7
lrwxrwxrwx 1 root root  8 Oct  5 22:54 7:8 -> ../loop8
lrwxrwxrwx 1 root root  8 Oct  5 22:54 7:9 -> ../loop9
root@d8d3ed90041c:~#
root@d8d3ed90041c:~# cat /proc/partitions
major minor  #blocks  name

7        0      25500 loop0
7        1      26360 loop1
7        2      56996 loop2
7        3      56692 loop3
7        4      65480 loop4
7        5      65508 loop5
7        6      76028 loop6
7        7      89120 loop7
259        0   20971520 nvme0n1
259        1   20857839 nvme0n1p1
259        2       4096 nvme0n1p14
259        3     108544 nvme0n1p15
7        8      89128 loop8
7        9      41400 loop9
7       10      39760 loop10
root@d8d3ed90041c:~# lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0          7:0    0 24.9M  1 loop /snap/amazon-ssm-agent/7628
loop1          7:1    0 25.7M  1 loop /snap/amazon-ssm-agent/9565
loop2          7:2    0 55.7M  1 loop /snap/core18/2829
loop3          7:3    0 55.4M  1 loop /snap/core18/2846
loop4          7:4    0 63.9M  1 loop /snap/core20/2318
loop5          7:5    0   64M  1 loop /snap/core20/2379
loop6          7:6    0 74.2M  1 loop /snap/core22/1621
loop7          7:7    0   87M  1 loop /snap/lxd/28373
loop8          7:8    0   87M  1 loop /snap/lxd/29351
loop9          7:9    0 40.4M  1 loop /snap/snapd/20671
loop10         7:10   0 38.8M  1 loop /snap/snapd/21759
nvme0n1      259:0    0   20G  0 disk
├─nvme0n1p1  259:1    0 19.9G  0 part /
├─nvme0n1p14 259:2    0    4M  0 part
└─nvme0n1p15 259:3    0  106M  0 part /boot/efi

lsblk -f
NAME         FSTYPE   FSVER LABEL           UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
loop0                                                                                  0   100% /snap/amazon-ssm-agent/7628
loop1                                                                                  0   100% /snap/amazon-ssm-agent/9565
loop2                                                                                  0   100% /snap/core18/2829
loop3                                                                                  0   100% /snap/core18/2846
loop4                                                                                  0   100% /snap/core20/2318
loop5                                                                                  0   100% /snap/core20/2379
loop6                                                                                  0   100% /snap/core22/1621
loop7                                                                                  0   100% /snap/lxd/28373
loop8        squashfs 4.0                                                              0   100% /snap/lxd/29351
loop9        squashfs 4.0                                                              0   100% /snap/snapd/20671
loop10       squashfs 4.0                                                              0   100% /snap/snapd/21759
nvme0n1                                                                                         
├─nvme0n1p1  ext4     1.0   cloudimg-rootfs 4a8f1382-2078-4ed0-aa98-28106fe6a808   14.2G    26% /
├─nvme0n1p14                                                                                    
└─nvme0n1p15 vfat     FAT32 UEFI            9DD2-0054                              98.3M     6% /boot/efi

root@d8d3ed90041c:~# fdisk -l
Disk /dev/loop0: 24.9 MiB, 26112000 bytes, 51000 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop1: 25.74 MiB, 26992640 bytes, 52720 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop2: 55.66 MiB, 58363904 bytes, 113992 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop3: 55.36 MiB, 58052608 bytes, 113384 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop4: 63.95 MiB, 67051520 bytes, 130960 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop5: 63.97 MiB, 67080192 bytes, 131016 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop6: 74.25 MiB, 77852672 bytes, 152056 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop7: 87.03 MiB, 91258880 bytes, 178240 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/nvme0n1: 20 GiB, 21474836480 bytes, 41943040 sectors
Disk model: Amazon Elastic Block Store              
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: 3E71004C-6554-4CC5-893B-909ACC543283

Device           Start      End  Sectors  Size Type
/dev/nvme0n1p1  227328 41943006 41715679 19.9G Linux filesystem
/dev/nvme0n1p14   2048    10239     8192    4M BIOS boot
/dev/nvme0n1p15  10240   227327   217088  106M EFI System

Partition table entries are not in disk order.


Disk /dev/loop8: 87.04 MiB, 91267072 bytes, 178256 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop9: 40.43 MiB, 42393600 bytes, 82800 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop10: 38.83 MiB, 40714240 bytes, 79520 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
root@d8d3ed90041c:~# 
```

### New tools for linux disk management

- parted (non gui)
- gparted (gui)
- fdisk (non gui) - command line tool which is used to manage disk partitions

### fdisk

```bash
root@d8d3ed90041c:~# lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0          7:0    0 24.9M  1 loop /snap/amazon-ssm-agent/7628
loop1          7:1    0 25.7M  1 loop /snap/amazon-ssm-agent/9565
loop2          7:2    0 55.7M  1 loop /snap/core18/2829
loop3          7:3    0 55.4M  1 loop /snap/core18/2846
loop4          7:4    0 63.9M  1 loop /snap/core20/2318
loop5          7:5    0   64M  1 loop /snap/core20/2379
loop6          7:6    0 74.2M  1 loop /snap/core22/1621
loop7          7:7    0   87M  1 loop /snap/lxd/28373
loop8          7:8    0   87M  1 loop /snap/lxd/29351
loop9          7:9    0 40.4M  1 loop /snap/snapd/20671
loop10         7:10   0 38.8M  1 loop /snap/snapd/21759
nvme0n1      259:0    0   20G  0 disk
├─nvme0n1p1  259:1    0 19.9G  0 part /
├─nvme0n1p14 259:2    0    4M  0 part
└─nvme0n1p15 259:3    0  106M  0 part /boot/efi
root@d8d3ed90041c:~# fdisk /dev/
/dev/loop0       /dev/loop10      /dev/loop3       /dev/loop5       /dev/loop7       /dev/loop9       /dev/nvme0n1p1   /dev/nvme0n1p15  
/dev/loop1       /dev/loop2       /dev/loop4       /dev/loop6       /dev/loop8       /dev/nvme0n1     /dev/nvme0n1p14  
root@d8d3ed90041c:~# fdisk /dev/nvme0n1
```
Welcome to fdisk (util-linux 2.37.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

This disk is currently in use - repartitioning is probably a bad idea.
It's recommended to umount all file systems, and swapoff all swap
partitions on this disk.

```bash
Command (m for help): m

Help:

GPT
M   enter protective/hybrid MBR

Generic
d   delete a partition
F   list free unpartitioned space
l   list known partition types
n   add a new partition
p   print the partition table
t   change a partition type
v   verify the partition table
i   print information about a partition

Misc
m   print this menu
x   extra functionality (experts only)

Script
I   load disk layout from sfdisk script file
O   dump disk layout to sfdisk script file

Save & Exit
w   write table to disk and exit
q   quit without saving changes

Create a new label
g   create a new empty GPT partition table
G   create a new empty SGI (IRIX) partition table
o   create a new empty DOS partition table
s   create a new empty Sun partition table


Command (m for help): p

Disk /dev/nvme0n1: 20 GiB, 21474836480 bytes, 41943040 sectors
Disk model: Amazon Elastic Block Store              
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: 3E71004C-6554-4CC5-893B-909ACC543283

Device           Start      End  Sectors  Size Type
/dev/nvme0n1p1  227328 41943006 41715679 19.9G Linux filesystem
/dev/nvme0n1p14   2048    10239     8192    4M BIOS boot
/dev/nvme0n1p15  10240   227327   217088  106M EFI System

Partition table entries are not in disk order.

Command (m for help): 
```

### Linux questions and answers

Q. What is the init process used by this system?

Ans
cat /proc/1/comm
systemd

ls -l /sbin/init
lrwxrwxrwx 1 root root 20 Nov 21  2023 /sbin/init -> /lib/systemd/systemd
root@d8d3ed90041c:~# 

Q.what is your current or default runlevel?
```bash
Ans
systemctl | grep -i target
basic.target                                                                 loaded active     active    Basic System
cloud-config.target                                                          loaded active     active    Cloud-config availability
cloud-init.target                                                            loaded active     active    Cloud-init target
cryptsetup.target                                                            loaded active     active    Local Encrypted Volumes
getty-pre.target                                                             loaded active     active    Preparation for Logins
getty.target                                                                 loaded active     active    Login Prompts
graphical.target                                                             loaded active     active    Graphical Interface
local-fs-pre.target                                                          loaded active     active    Preparation for Local File Systems
local-fs.target                                                              loaded active     active    Local File Systems
multi-user.target                                                            loaded active     active    Multi-User System
network-online.target                                                        loaded active     active    Network is Online
network-pre.target                                                           loaded active     active    Preparation for Network
network.target                                                               loaded active     active    Network
nss-lookup.target                                                            loaded active     active    Host and Network Name Lookups
paths.target                                                                 loaded active     active    Path Units
remote-fs-pre.target                                                         loaded active     active    Preparation for Remote File Systems
remote-fs.target                                                             loaded active     active    Remote File Systems
slices.target                                                                loaded active     active    Slice Units
snapd.mounts-pre.target                                                      loaded active     active    Mounting snaps
snapd.mounts.target                                                          loaded active     active    Mounted snaps
sockets.target                                                               loaded active     active    Socket Units
swap.target                                                                  loaded active     active    Swaps
sysinit.target                                                               loaded active     active    System Initialization
time-set.target                                                              loaded active     active    System Time Set
time-sync.target                                                             loaded active     active    System Time Synchronized
timers.target                                                                loaded active     active    Timer Units
veritysetup.target                                                           loaded active     active    Local Verity Protected Volumes
root@d8d3ed90041c:~# runlevel
N 5
root@d8d3ed90041c:~# 
```

Q. change the target to multi-user.target
systemccntl set-default multi-user.target

Q. What is the name of the vendor for the Ethernet Controller used in this system?
lspci | grep -i ethernet

### linux disk scanning
lsblk -f

```bash
- disk scanning is usally disable with -1 Max mount count
  tune2fs -l /dev/nvme0n1p1
  tune2fs 1.46.5 (30-Dec-2021)
  Filesystem volume name:   cloudimg-rootfs
  Last mounted on:          /
  Filesystem UUID:          4a8f1382-2078-4ed0-aa98-28106fe6a808
  Filesystem magic number:  0xEF53
  Filesystem revision #:    1 (dynamic)
  Filesystem features:      has_journal ext_attr resize_inode dir_index filetype needs_recovery extent 64bit flex_bg sparse_super large_file huge_file dir_nlink extra_isize metadata_csum
  Filesystem flags:         signed_directory_hash
  Default mount options:    user_xattr acl
  Filesystem state:         clean
  Errors behavior:          Continue
  Filesystem OS type:       Linux
  Inode count:              2580480
  Block count:              5214459
  Reserved block count:     0
  Overhead clusters:        180811
  Free blocks:              3717778
  Free inodes:              2394307
  First block:              0
  Block size:               4096
  Fragment size:            4096
  Group descriptor size:    64
  Reserved GDT blocks:      253
  Blocks per group:         32768
  Fragments per group:      32768
  Inodes per group:         16128
  Inode blocks per group:   1008
  Flex block group size:    16
  Filesystem created:       Fri Nov 18 02:11:30 2022
  Last mount time:          Sat Oct  5 22:54:10 2024
  Last write time:          Sun Oct  6 01:27:10 2024
  Mount count:              32
  **Maximum mount count:      -1**
  Last checked:             Fri Nov 18 02:16:08 2022
  Check interval:           0 (<none>)
  Lifetime writes:          41 GB
  Reserved blocks uid:      0 (user root)
  Reserved blocks gid:      0 (group root)
  First inode:              11
  Inode size:               256
  Required extra isize:     32
  Desired extra isize:      32
  Journal inode:            8
  Default directory hash:   half_md4
  Directory Hash Seed:      07b93017-1e70-4f8d-8ff6-b76e12556f46
  Journal backup:           inode blocks
  Checksum type:            crc32c
  Checksum:                 0x476c2da8
```
- We can change the max mount count to 1
```bash
  tune2fs -c 10 /dev/nvme0n1p1
```

```bash
tune2fs 1.46.5 (30-Dec-2021)
Setting maximal mount count to 10


root@d8d3ed90041c:~# tune2fs -l /dev/nvme0n1p1
tune2fs 1.46.5 (30-Dec-2021)
Filesystem volume name:   cloudimg-rootfs
Last mounted on:          /
Filesystem UUID:          4a8f1382-2078-4ed0-aa98-28106fe6a808
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal ext_attr resize_inode dir_index filetype needs_recovery extent 64bit flex_bg sparse_super large_file huge_file dir_nlink extra_isize metadata_csum
Filesystem flags:         signed_directory_hash
Default mount options:    user_xattr acl
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              2580480
Block count:              5214459
Reserved block count:     0
Overhead clusters:        180811
Free blocks:              3717778
Free inodes:              2394307
First block:              0
Block size:               4096
Fragment size:            4096
Group descriptor size:    64
Reserved GDT blocks:      253
Blocks per group:         32768
Fragments per group:      32768
Inodes per group:         16128
Inode blocks per group:   1008
Flex block group size:    16
Filesystem created:       Fri Nov 18 02:11:30 2022
Last mount time:          Sat Oct  5 22:54:10 2024
Last write time:          Sun Oct  6 02:38:28 2024
Mount count:              32
Maximum mount count:      10
Last checked:             Fri Nov 18 02:16:08 2022
Check interval:           0 (<none>)
Lifetime writes:          41 GB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:               256
Required extra isize:     32
Desired extra isize:      32
Journal inode:            8
Default directory hash:   half_md4
Directory Hash Seed:      07b93017-1e70-4f8d-8ff6-b76e12556f46
Journal backup:           inode blocks
Checksum type:            crc32c
Checksum:                 0x24e6dc8f

reboot

cloudimg-rootfs
Last mounted on:          /
Filesystem UUID:          4a8f1382-2078-4ed0-aa98-28106fe6a808
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal ext_attr resize_inode dir_index filetype needs_recovery extent 64bit flex_bg sparse_super large_file huge_file dir_nlink extra_isize metadata_csum
Filesystem flags:         signed_directory_hash
Default mount options:    user_xattr acl
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              2580480
Block count:              5214459
Reserved block count:     0
Overhead clusters:        180811
Free blocks:              3717763
Free inodes:              2394325
First block:              0
Block size:               4096
Fragment size:            4096
Group descriptor size:    64
Reserved GDT blocks:      253
Blocks per group:         32768
Fragments per group:      32768
Inodes per group:         16128
Inode blocks per group:   1008
Flex block group size:    16
Filesystem created:       Fri Nov 18 02:11:30 2022
Last mount time:          Sun Oct  6 02:41:16 2024
Last write time:          Sun Oct  6 02:40:52 2024
Mount count:              1
Maximum mount count:      10
Last checked:             Sun Oct  6 02:40:52 2024
Check interval:           0 (<none>)
Lifetime writes:          41 GB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:               256
Required extra isize:     32
Desired extra isize:      32
Journal inode:            8
Default directory hash:   half_md4
Directory Hash Seed:      07b93017-1e70-4f8d-8ff6-b76e12556f46
Journal backup:           inode blocks
Checksum type:            crc32c
Checksum:                 0x8afbe38a
root@d8d3ed90041c:~# fsck /dev/nvme0n1p1
fsck from util-linux 2.37.2
e2fsck 1.46.5 (30-Dec-2021)
/dev/nvme0n1p1 is mounted.
e2fsck: Cannot continue, aborting.
```

- Caution: In case of big data disk, time to scan the disk will be high

### Bash Script Conditionals: Single vs. Double Brackets

#### Single Brackets `[ ]`

Single brackets `[ ]` are the traditional test command in Bash. They are POSIX-compliant and work in most shells.


Key points:
- /bin/sh will work in docker container
- More portable across different shells
- Requires quoting variables to prevent word splitting
- Uses `-a` for AND, `-o` for OR
- Requires escaping certain characters like `<` and `>`

Example:
```bash
if [ "$a" = "foo" ]; then
    echo "a is foo"
fi
```

#### Double Brackets `[[ ]]`

Double brackets `[[ ]]` are a Bash-specific extension and provide more features.

Key points:
- Bash-specific (not POSIX-compliant)
- No need to quote variables (prevents word splitting automatically)
- Uses `&&` for AND, `||` for OR
- Supports pattern matching and regular expressions
- Performs better as it's a built-in Bash keyword

Example:
```bash
if [[ $a == foo* ]]; then
    echo "a starts with foo"
fi
```

#### When to Use Which

- Use `[ ]` for maximum portability across different shells
- Use `[[ ]]` in Bash scripts for advanced features and better performance

### Linux Logical Volume Manager (LVM) Commands

##### Introduction to LVM

LVM (Logical Volume Manager) is a device mapper framework that provides logical volume management for the Linux kernel. It allows for more flexible disk space management than traditional partitioning schemes.

#### Physical Volume (PV) Commands

##### Create a Physical Volume
```
pvcreate /dev/sdb
```

##### Display PV Information
```
pvdisplay
pvs
```

##### Remove a Physical Volume
```
pvremove /dev/sdb
```

#### Volume Group (VG) Commands

##### Create a Volume Group
```
vgcreate vg_name /dev/sdb /dev/sdc
```

##### Display VG Information
```
vgdisplay
vgs
```

##### Extend a Volume Group
```
vgextend vg_name /dev/sdd
```

##### Remove a Volume Group
```
vgremove vg_name
```

#### Logical Volume (LV) Commands

##### Create a Logical Volume
```
lvcreate -L 10G -n lv_name vg_name
```

##### Display LV Information
```
lvdisplay
lvs
```

##### Remove a Logical Volume
```
lvremove /dev/vg_name/lv_name
```

#### Resizing Operations

##### Extend a Logical Volume
```
lvextend -L +5G /dev/vg_name/lv_name
resize2fs /dev/vg_name/lv_name
```

##### Reduce a Logical Volume
```
resize2fs /dev/vg_name/lv_name 15G
lvreduce -L 15G /dev/vg_name/lv_name
```

#### Snapshot Operations

##### Create a Snapshot
```
lvcreate -L 1G -s -n snap_name /dev/vg_name/lv_name
```

##### Merge a Snapshot
```
lvconvert --merge /dev/vg_name/snap_name
```

#### Troubleshooting

##### Scan for Volume Groups
```
vgscan
```

##### Activate All Volume Groups
```
vgchange -ay
```

##### Check and Repair Volume Group Metadata
```
vgck vg_name
```

##### Display Detailed LVM Records
```
lvmdump
```

##### Recover Physical Volume Metadata
```
pvck -v /dev/sdb
```

Remember to use these commands with caution, especially when modifying existing volumes. Always back up important data before making changes to your LVM configuration.

### Understanding `getconf ARG_MAX`

#### What is `getconf ARG_MAX`?

`getconf ARG_MAX` is a command used in Unix-like operating systems to retrieve the maximum length of arguments for the `exec` family of functions.

#### Output Explanation

The output you received is:

```
2097152
```

This number represents the maximum length, in bytes, of the arguments and environment data that can be passed to the `exec` family of functions.

#### What does this mean?

- The value 2097152 is equal to 2 MB (2 * 1024 * 1024 bytes).
- This limit includes the sum of the lengths of all arguments and environment variables passed to a program when it is executed.
- It's a system-imposed limit to prevent excessive memory usage or potential security issues from extremely large argument lists.

#### Practical Implications

- This limit affects operations like passing long lists of files to commands.
- If you exceed this limit, you may encounter "Argument list too long" errors.
- For operations involving many files, you might need to use alternative methods like `xargs` or process files in batches.

#### Note

The exact value of `ARG_MAX` can vary between different systems and configurations. Always check the value on your specific system if you need to rely on it for your operations.

### Linux Networking Administration and Troubleshooting

### Viewing Network Information

#### Display Network Interfaces
```bash
ip link
```
Shows all network interfaces on the system.

#### View IP Addresses
```bash
ip addr
```
Displays IP addresses assigned to all interfaces.

#### Show Routing Table
```bash
ip route
# or
route -n
```
These commands display the system's routing table.

#### Configuring Network Interfaces

##### Add an IP Address
```bash
sudo ip addr add 192.168.1.10/24 dev eth0
```
Adds the IP 192.168.1.10 with a /24 subnet mask to eth0.

#### Delete an IP Address
```bash
sudo ip addr del 192.168.1.10/24 dev eth0
```
Removes the specified IP address from eth0.

#### Bring Interface Up/Down
```bash
sudo ip link set eth0 up
sudo ip link set eth0 down
```
Enables or disables the eth0 interface.

#### Managing Routes

##### Add a Static Route
```bash
sudo ip route add 192.168.1.0/24 via 192.168.2.1
```
Adds a route to the 192.168.1.0/24 network via the gateway 192.168.2.1.

##### Add a default Route
route -n

```bash
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         172.16.238.187  0.0.0.0         UG    0      0        0 eth0
172.16.238.0    0.0.0.0         255.255.255.0   U     0      0        0 eth0
172.16.239.0    0.0.0.0         255.255.255.0   U     0      0        0 eth1
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 eth2
bob@caleston-lp10:~$ ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
inet 172.16.238.187  netmask 255.255.255.0  broadcast 172.16.238.255
ether 02:42:ac:10:ee:bb  txqueuelen 0  (Ethernet)
RX packets 0  bytes 0 (0.0 B)
RX errors 0  dropped 0  overruns 0  frame 0
TX packets 21  bytes 882 (882.0 B)
TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
inet 172.16.239.187  netmask 255.255.255.0  broadcast 172.16.239.255
ether 02:42:ac:10:ef:bb  txqueuelen 0  (Ethernet)
RX packets 274  bytes 37665 (37.6 KB)
RX errors 0  dropped 0  overruns 0  frame 0
TX packets 458  bytes 39461 (39.4 KB)
TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth2: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1410
inet 172.17.0.4  netmask 255.255.0.0  broadcast 172.17.255.255
ether 02:42:ac:11:00:04  txqueuelen 0  (Ethernet)
RX packets 2703  bytes 8329010 (8.3 MB)
RX errors 0  dropped 0  overruns 0  frame 0
TX packets 2026  bytes 361817 (361.8 KB)
TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
inet 127.0.0.1  netmask 255.0.0.0
loop  txqueuelen 1000  (Local Loopback)
RX packets 44  bytes 4508 (4.5 KB)
RX errors 0  dropped 0  overruns 0  frame 0
TX packets 44  bytes 4508 (4.5 KB)
TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

#### Task
While we are at it, there is also a missing default route on the server devapp01.

Add the default route via eth0 gateway.

Bob's default password is caleston123

#### Solution
```bash
sudo ip route add default via 172.16.238.187 dev eth0

route -n
```
##### Delete a default Route
```bash
sudo ip route del default
```

#### Delete a Route
```bash
sudo ip route del 192.168.1.0/24
sudo ip route del 172.16.238.0/24 dev eth0
sudo ip route del 172.16.239.0/24 dev eth1
```
Removes the specified route.

#### Making Changes Persistent

#### Ubuntu (18.04 and later using Netplan)

1. Edit or create a .yaml file in `/etc/netplan/`, e.g., `/etc/netplan/01-netcfg.yaml`:

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      addresses:
        - 192.168.1.10/24
      routes:
        - to: 192.168.1.0/24
          via: 192.168.2.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```

2. Apply changes:
```bash
sudo netplan apply
```

#### CentOS 7 and 8

1. Edit the interface configuration file, e.g., `/etc/sysconfig/network-scripts/ifcfg-eth0`:

```
DEVICE=eth0
BOOTPROTO=static
IPADDR=192.168.1.10
NETMASK=255.255.255.0
ONBOOT=yes
```

2. For static routes, create or edit `/etc/sysconfig/network-scripts/route-eth0`:

```
192.168.1.0/24 via 192.168.2.1
```

3. Restart the network service:
```bash
sudo systemctl restart network
```

#### Expanded Troubleshooting Section

#### Basic Connectivity Tests

##### Ping a Host
```bash
ping -c 4 8.8.8.8
```
Tests connectivity to Google's DNS server. The `-c 4` option limits it to 4 packets.

##### Trace Route to a Host
```bash
traceroute google.com
```
Shows the path packets take to reach google.com.

##### Check DNS Resolution
```bash
nslookup google.com
# or
dig google.com
```
Queries DNS to resolve the IP address of google.com. `dig` provides more detailed DNS information.

#### Network Interface and Traffic Analysis

##### View Network Statistics
```bash
netstat -tuln
# or
ss -tuln
```
Displays active network connections and listening ports. `ss` is a more modern replacement for `netstat`.

##### Monitor Network Traffic in Real-time
```bash
sudo tcpdump -i eth0
```
Captures and displays packet data on the eth0 interface.

#### Show Network Interface Details
```bash
ethtool eth0
```
Displays detailed information about the eth0 network interface, including speed and duplex settings.

#### Firewall and Port Checking

##### Check if a Port is Open
```bash
nc -zv 192.168.1.1 22
# or
curl -v telnet://192.168.1.1:22
```
Tests if port 22 (SSH) is open on 192.168.1.1.

#### List Firewall Rules (Ubuntu/Debian)
```bash
sudo iptables -L
```

#### List Firewall Rules (CentOS 7/8)
```bash
sudo firewall-cmd --list-all
```

#### Advanced Diagnostics

##### View ARP Cache
```bash
arp -e
```
Displays the ARP (Address Resolution Protocol) cache, showing IP to MAC address mappings.

##### Check Network Interface Errors
```bash
ifconfig eth0
# or
ip -s link show eth0
```
Shows detailed statistics for the eth0 interface, including packet errors.

##### Monitor Network Connections
```bash
watch ss -tup
```
Continuously updates and displays active network connections.

##### View Routing Information
```bash
netstat -rn
```
Displays the routing table with numeric addresses.

#### Network Service Diagnostics

##### Check if NetworkManager is Running
```bash
systemctl status NetworkManager
```

##### Restart NetworkManager
```bash
sudo systemctl restart NetworkManager
```

##### View Network-Related Log Messages
```bash
journalctl -u NetworkManager
```
Displays log messages related to NetworkManager.

#### Performance Testing

##### Test Network Throughput
```bash
iperf3 -c iperf.server.com
```
Measures network throughput to an iperf3 server. (Requires iperf3 to be installed)

##### Check Network Interface Speed
```bash
ethtool eth0 | grep Speed
```
Displays the current speed of the eth0 interface.

Remember to use `sudo` for commands that require administrative privileges. Always backup configuration files before making changes.

### Linux Ubuntu User Management

#### Creating group in ubuntu

Create a new group with ID 1009 before creating the user
You can create the group first using the groupadd command:
```bash
groupadd -g 1009 robert_group
```

delete a group in ubuntu
```bash
groupdel robert_group
```

#### Creating a user in ubuntu
```bash
useradd -u 1009 -g 1009 -d /home/robert -s /bin/bash -c "Mercury Project member" bob
```
flag/swtiches/options explanation:
-u 1009: Sets the user ID for bob to 1009. This is unique for each user.
-g 1009: Sets the group ID for bob to 1009. The user will be assigned to this group.
-d /home/robert: This specifies the home directory for bob as /home/robert. The correct option for home directory specification is -d.
-s /bin/bash: Sets /bin/bash as the login shell for bob, meaning when bob logs in, they will be placed in a Bash shell.
-c "Mercury Project member": Adds the comment "Mercury Project member" to the user's details, usually visible in the GECOS field when you check user details.
bob: This is the username you are creating.

#### delete a user in ubuntu
```bash
userdel -r bob
```

Fix the issue manually, if user directory is not created

To resolve this, you can manually create the home directory for "bob" using the following steps:

Create the home directory:

```bash
mkdir /home/robert
```
Set the correct ownership for the home directory:
```bash
chown bob:robert_group /home/robert
```
Optionally, copy the skeleton files (like .bashrc, .profile, etc.) into the new home directory:
```bash
cp -r /etc/skel/. /home/robert/
```

### Linux File Permissions and Ownership

#### Understanding File Permissions

#### File types in Linux

- `-`: Regular file
- `d`: Directory
- `l`: Symbolic link
- `c`: Character device
- `b`: Block device
- `p`: Named pipe
- `s`: Socket
- `D`: Door (Solaris)
- `n`: Network file (special file type in Linux)

#### File Permission Notations

- `r`: Read permission
- `w`: Write permission
- `x`: Execute permission
- `-`: No permission
- `s`: Setuid or setgid permission
- `t`: Sticky bit
- `u`: User permission
- `g`: Group permission
- `o`: Others permission
- `a`: All users permission
- `+`: Add permission
- `-`: Remove permission
- `=`: Set permission
- `rwx`: Read, write, and execute permissions
- `rw-`: Read and write permissions
- `r--`: Read-only permission
- `---`: No permission
- `r-x`: Read and execute permissions
- `r-xr-xr-x`: Common permission notation
- `777`: Octal permission notation
- `u+x`: Add execute permission for the user
- `g-w`: Remove write permission for the group
- `o=r`: Set read-only permission for others
- `u=rw,g=r,o=r`: Set read and write permission for the user, read-only permission for the group and others
- `u=rwx,g=rx,o=r`: Set read, write, and execute permission for the user, read and execute permission for the group, and read-only permission for others
- `u=rwx,g=rx,o=rx`: Set read, write, and execute permission for the user, read and execute permission for the group and others
- `u=rwx,g=rx,o=`: Set read, write, and execute permission for the user, read and execute permission for the group, and no permission for others
- `u=rwx,g=,o=`: Set read, write, and execute permission for the user, and no permission for the group and others
- `u=rwx,g=u+r,o=`: Set read, write, and execute permission for the user, add read permission for the group, and no permission for others

#### Changing File Permissions

#### Change File Permissions Numerically

- `chmod 777 file.txt`: Set read, write, and execute permissions for all users
- `chmod 755 file.txt`: Set read, write, and execute permissions for the user, and read and execute permissions for the group and others
- `chmod 644 file.txt`: Set read and write permissions for the user, and read-only permissions for the group and others
- `chmod 600 file.txt`: Set read and write permissions for the user, and no permissions for the group and others
- `chmod 666 file.txt`: Set read and write permissions for all users
- `chmod 644 *.txt`: Set read and write permissions for the user, and read-only permissions for the group and others for all .txt files in the directory
- `chmod -R 755 directory`: Recursively set read, write, and execute permissions for the user, and read and execute permissions for the group and others for all files and directories in the directory
- `chmod -R 644 directory`: Recursively set read and write permissions for the user, and read-only permissions for the group and others for all files and directories in the directory
- `chmod -R 600 directory`: Recursively set read and write permissions for the user, and no permissions for the group and others for all files and directories in the directory
- `chmod -R 777 directory`: Recursively set read, write, and execute permissions for all users for all files and directories in the directory
- `chmod -R 666 directory`: Recursively set read and write permissions for all users for all files and directories in the directory
- `chmod -R 644 *.txt`: Recursively set read and write permissions for the user, and read-only permissions for the group and others for all .txt files in the directory
- `chmod -R 755 *.txt`: Recursively set read, write, and execute permissions for the user, and read and execute permissions for the group and others for all .txt files in the directory
- `chmod -R 600 *.txt`: Recursively set read and write permissions for the user, and no permissions for the group and others for all .txt files in the directory
- `chmod -R 777 *.txt`: Recursively set read, write, and execute permissions for all users for all .txt files in the directory
- `chmod -R 666 *.txt`: Recursively set read and write permissions for all users for all .txt files in the directory
- `chmod -R 644 /path/to/directory`: Recursively set read and write permissions for the user, and read-only permissions for the group and others for all files and directories in the specified directory path
- `chmod -R 755 /path/to/directory`: Recursively set read, write, and execute permissions for the user, and read and execute permissions for the group and others for all files and directories in the specified directory path
- `chmod -R 600 /path/to/directory`: Recursively set read and write permissions for the user, and no permissions for the group and others for all files and directories in the specified directory path
- `chmod -R 777 /path/to/directory`: Recursively set read, write, and execute permissions for all users for all files and directories in the specified directory path
- `chmod -R 666 /path/to/directory`: Recursively set read and write permissions for all users for all files and directories in the specified directory path

Here is a table format summarizing the Linux file permissions and their corresponding values:

| **Permission** | **Symbol** | **Binary Value** | **Octal Value** | **Description**           |
|----------------|------------|------------------|-----------------|---------------------------|
| Read (r)       | `r`        | 100              | 4               | Allows reading the file    |
| Write (w)      | `w`        | 010              | 2               | Allows writing to the file |
| Execute (x)    | `x`        | 001              | 1               | Allows executing the file  |
| No Permission  | `-`        | 000              | 0               | No permission              |

### Example of Permission Combinations:

| **Permission String** | **Owner (User)** | **Group** | **Others** | **Octal Representation** |
|-----------------------|------------------|-----------|------------|--------------------------|
| `rwxr-xr--`           | rwx (7)          | r-x (5)   | r-- (4)    | 754                      |
| `rw-r--r--`           | rw- (6)          | r-- (4)   | r-- (4)    | 644                      |
| `rwx------`           | rwx (7)          | --- (0)   | --- (0)    | 700                      |
| `rwxrwxrwx`           | rwx (7)          | rwx (7)   | rwx (7)    | 777                      |

In the octal representation:
- The first digit represents the permissions for the **owner (user)**.
- The second digit represents the permissions for the **group**.
- The third digit represents the permissions for **others**.

### File Ownership

#### Changing File Ownership

- `chown user:group file.txt`: Change the owner and group of the file to user and group.
- `chown user file.txt`: Change the owner of the file to user.
- `chown :group file.txt`: Change the group of the file to group.
- `chown -R user:group directory`: Recursively change the owner and group of the directory and its contents to user and group.
- `chown -R user directory`: Recursively change the owner of the directory and its contents to user.
- `chown -R :group directory`: Recursively change the group of the directory and its contents to group.
- `chown -R user:group /path/to/directory`: Recursively change the owner and group of the specified directory path and its contents to user and group.
- `chown -R user /path/to/directory`: Recursively change the owner of the specified directory path and its contents to user.
- `chown -R :group /path/to/directory`: Recursively change the group of the specified directory path and its contents to group.

chgrp command is used to change the group ownership of a file or directory.

- `chgrp group file.txt`: Change the group of the file to group.
- `chgrp -R group directory`: Recursively change the group of the directory and its contents to group.
- `chgrp group /path/to/directory`: Change the group of the specified directory path to group.
- `chgrp -R group /path/to/directory`: Recursively change the group of the specified directory path and its contents to group.

**RAID (Redundant Array of Independent Disks)** is a technology that combines multiple physical hard drives into a single logical unit to improve performance, increase storage capacity, or enhance data redundancy (protection). RAID allows data to be distributed across several drives, offering benefits depending on the specific RAID level used.

### Why Should We Use RAID?

RAID is primarily used for:
- **Improved Performance**: RAID can distribute data across multiple disks, speeding up read and write operations.
- **Data Redundancy**: RAID can provide fault tolerance, meaning if one drive fails, the data remains intact on other drives.
- **Larger Storage Capacity**: RAID allows you to combine the storage space of multiple drives into one large virtual drive.

### Different RAID Levels and Their Advantages/Disadvantages

1. **RAID 0 (Striping)**

   **How It Works**: RAID 0 splits data evenly across two or more disks (striping) without redundancy.

   **Advantages**:
    - **Increased Performance**: Striping data across multiple drives speeds up read and write operations, as multiple drives can be accessed simultaneously.
    - **Full Capacity**: All disk space is used for storage (no overhead for redundancy).

   **Disadvantages**:
    - **No Redundancy**: If one disk fails, all data is lost since RAID 0 has no fault tolerance.
    - **Not Suitable for Critical Systems**: Due to the risk of data loss, RAID 0 is not recommended for systems where data reliability is important.

   **Use Case**: Ideal for non-critical systems where performance matters more than data redundancy, such as temporary file storage or gaming PCs.

2. **RAID 1 (Mirroring)**

   **How It Works**: RAID 1 mirrors (duplicates) the same data on two or more drives.

   **Advantages**:
    - **High Redundancy**: If one disk fails, the mirrored disk continues to function with the same data.
    - **Simple to Implement**: RAID 1 is straightforward, as data is simply copied from one disk to another.

   **Disadvantages**:
    - **Reduced Capacity**: Only 50% of the total disk space is available for storage, as the other half is used for the mirror.
    - **No Performance Improvement**: Write speeds are slower due to the need to write to two disks, though read speeds can improve slightly.

   **Use Case**: Ideal for systems where data availability is critical, such as personal files, system drives, or servers where uptime is essential.

3. **RAID 5 (Striping with Parity)**

   **How It Works**: RAID 5 stripes data across multiple disks and stores parity information (used for recovery) on each disk. The parity data is spread across all disks, allowing for one disk failure without data loss.

   **Advantages**:
    - **Balanced Performance and Redundancy**: RAID 5 provides good read/write performance with built-in fault tolerance.
    - **Efficient Storage Use**: Only one drive's worth of space is used for parity, so if you have five drives, you get the storage capacity of four drives.

   **Disadvantages**:
    - **Slower Write Performance**: Writing data is slower due to the need to calculate and write parity information.
    - **Limited Fault Tolerance**: Can tolerate only one disk failure. If a second disk fails before the first one is replaced, all data is lost.

   **Use Case**: Commonly used in enterprise environments and file servers where both performance and fault tolerance are needed without sacrificing too much disk space.

4. **RAID 6 (Striping with Dual Parity)**

   **How It Works**: Similar to RAID 5, but with two sets of parity information spread across all drives. This allows RAID 6 to tolerate the failure of up to two disks.

   **Advantages**:
    - **Increased Fault Tolerance**: Can survive up to two disk failures without data loss.
    - **Good Read Performance**: Similar to RAID 5, RAID 6 offers good read performance.

   **Disadvantages**:
    - **Reduced Write Performance**: Writing data is even slower than RAID 5 because two sets of parity need to be calculated and written.
    - **Higher Storage Overhead**: The additional parity means RAID 6 uses more disk space for redundancy, so you lose the capacity of two drives.

   **Use Case**: Ideal for large storage systems where high fault tolerance is required, such as mission-critical databases or systems where disk failure could have severe consequences.

5. **RAID 10 (1+0)**

   **How It Works**: RAID 10 combines the mirroring of RAID 1 and the striping of RAID 0. Data is mirrored across pairs of disks, and those pairs are striped for better performance.

   **Advantages**:
    - **High Performance and Fault Tolerance**: RAID 10 offers both the speed of RAID 0 (striping) and the redundancy of RAID 1 (mirroring).
    - **Fast Recovery**: If a disk fails, recovery is quick because the data is mirrored.

   **Disadvantages**:
    - **High Cost in Disk Usage**: Like RAID 1, RAID 10 loses 50% of total disk space to redundancy. It requires at least four disks.
    - **Complex Setup**: RAID 10 is more complex to configure than simpler RAID levels.

   **Use Case**: Ideal for high-performance applications like databases or mission-critical servers where both speed and redundancy are crucial.

6. **RAID 50 (5+0)**

   **How It Works**: RAID 50 combines RAID 5's striping with parity with RAID 0's striping across RAID 5 arrays.

   **Advantages**:
    - **Good Performance and Fault Tolerance**: Offers better write performance than RAID 5, as striping is used across multiple RAID 5 arrays.
    - **Higher Fault Tolerance than RAID 5**: RAID 50 can handle the failure of one disk per RAID 5 set.

   **Disadvantages**:
    - **Complex Setup**: Requires at least six disks and is more complex to manage.
    - **Not as Fault Tolerant as RAID 6**: It can't tolerate two simultaneous disk failures in the same RAID 5 set.

   **Use Case**: Suitable for large databases or applications requiring a combination of performance and fault tolerance.

7. **RAID 60 (6+0)**

   **How It Works**: RAID 60 is a combination of RAID 6 with RAID 0, striping data across RAID 6 arrays.

   **Advantages**:
    - **High Fault Tolerance**: RAID 60 can handle up to two disk failures per RAID 6 set.
    - **Good Performance**: Read/write performance is generally better than RAID 6, as RAID 60 stripes data across multiple RAID 6 sets.

   **Disadvantages**:
    - **Expensive in Disk Usage**: Like RAID 6, RAID 60 has higher overhead for storing parity, plus the overhead of RAID 0 striping.
    - **Complex Configuration**: RAID 60 requires at least eight disks and is complex to configure.

   **Use Case**: Best suited for systems requiring both high fault tolerance and high performance, such as high-availability servers.

### Summary of RAID Levels:

| RAID Level | Key Feature           | Fault Tolerance | Performance      | Storage Efficiency | Use Case                     |
|------------|-----------------------|-----------------|------------------|--------------------|------------------------------|
| RAID 0     | Striping (no redundancy) | None            | High             | 100%               | Non-critical data, gaming     |
| RAID 1     | Mirroring              | Yes (1 disk)     | Moderate (read)  | 50%                | Personal files, critical systems |
| RAID 5     | Striping with parity   | Yes (1 disk)     | Good (read)      | Efficient          | Enterprise systems, file servers |
| RAID 6     | Dual parity            | Yes (2 disks)    | Good (read)      | Reduced            | Critical storage systems      |
| RAID 10    | Mirroring + striping   | Yes (1 disk per mirror) | High      | 50%                | High-performance databases    |
| RAID 50    | RAID 5 + striping      | Yes (1 disk per RAID 5 set) | Good | Good               | Large data applications       |
| RAID 60    | RAID 6 + striping      | Yes (2 disks per RAID 6 set) | Good | Moderate           | High-availability systems     |

### Conclusion

Each RAID level offers unique advantages depending on the need for **performance**, **data redundancy**, and **storage capacity**.

- **RAID 0** is best for **performance** but offers no redundancy.
- **RAID 1** is ideal for **redundancy** but sacrifices storage capacity.
- **RAID 5 and RAID 6** balance performance and fault tolerance but can suffer from slower writes.
- **RAID 10** combines the best of both worlds: high **performance** and **redundancy**, making it a top choice for mission-critical systems, but with high disk overhead.

Choosing the "most powerful" RAID depends on your specific needs: RAID 10 is excellent for high performance and redundancy, but RAID 5/6 may be better for those needing storage efficiency with some fault tolerance.

Sure! Let me explain **striping** and **parity** in simple terms:

### What is **Striping**?

**Striping** means splitting data into small pieces and writing those pieces across multiple disks. This helps in improving the speed of data operations because different parts of the data can be read from or written to multiple disks at the same time.

- **Analogy**: Imagine you’re copying pages of a book by hand. If you have multiple people (disks) helping you, and you give each person a few pages to copy, the whole job gets done faster. That’s striping!
- **Advantage**: Faster performance because multiple disks are working together.
- **Disadvantage**: No data protection. If one disk fails, you lose part of the data.

**Example**: RAID 0 uses striping, but if one drive fails, all data is lost because there’s no backup.

### What is **Parity**?

**Parity** is a way of providing fault tolerance by adding extra data to help recover lost information if a disk fails. In RAID, parity is calculated based on the data on the disks, and this parity information is stored across the disks. If one disk fails, RAID can use the parity information to rebuild the lost data.

- **Analogy**: Imagine you have three friends (disks), each holding some numbers. You keep a "checksum" (parity) of those numbers. If one of your friends forgets their number (disk fails), you can use the checksum to figure out what that number was and recover it.
- **Advantage**: Redundancy (fault tolerance). You can recover data if one disk fails.
- **Disadvantage**: Parity adds overhead. The system has to calculate parity data, which can slow down write operations slightly, and some storage capacity is used for parity.

**Example**: RAID 5 uses striping with parity, so if one disk fails, it can be rebuilt using the parity data stored on the other disks.

### Summary:

- **Striping**: Breaks data into chunks and writes it across multiple disks for faster performance but provides no data protection.
- **Parity**: Adds a backup mechanism that helps recover data if one disk fails, but it requires some extra disk space and can slow down writes.

### RAID Commands Breakdown:

1. **`mdadm --create --verbose /dev/md0 --level=5 --raid-devices=4 /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1`**

    - **mdadm**: This command is used to create and manage software RAID arrays.
    - **--create**: This option tells `mdadm` that you are creating a new RAID array.
    - **--verbose**: Provides detailed information about the process while creating the RAID array.
    - **/dev/md0**: Specifies the name of the RAID device (in this case, `/dev/md0`).
    - **--level=5**: Specifies that you are creating a RAID 5 array. RAID 5 uses striping with parity, meaning data is spread across all disks with redundancy (if one disk fails, data can be rebuilt from parity).
    - **--raid-devices=4**: Specifies the number of devices (disks or partitions) to be used in the RAID array.
    - **/dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1**: Lists the four partitions that are used in the RAID array.

2. **`cat /proc/mdstat`**

    - This command shows the status of the RAID array. It reads from `/proc/mdstat`, which contains details about RAID devices, active arrays, and their state.
    - **Personality**: Indicates the types of RAID setups available.
    - **md0**: Indicates the RAID device (`/dev/md0`).
    - **active raid5**: Specifies that RAID 5 is active on this device.
    - **blocks**: Indicates the number of blocks (storage units) in the array.
    - **[UUU_]**: Shows the status of the disks. A "U" indicates a working disk, and an underscore ("_") would indicate a failed disk. In this case, the array is in recovery mode, as one disk is not yet functional.

3. **`ls /dev | grep md`**

    - **ls /dev**: This lists all device files under the `/dev` directory.
    - **grep md**: Filters the output to show only devices with "md" in their name, which would be the RAID devices (like `/dev/md0`).

4. **`mdadm --detail --scan`**

    - This command provides detailed information about all active RAID arrays on the system and outputs the configuration in a format that can be used in `/etc/mdadm/mdadm.conf` for automatic RAID assembly on boot.

5. **`mdadm --detail --scan > /etc/mdadm/mdadm.conf`**

    - This command saves the detailed configuration of the RAID array into the `/etc/mdadm/mdadm.conf` file, which ensures the RAID is automatically recognized and assembled during system boot.

6. **`mkfs.ext4 /dev/md0`**

    - **mkfs.ext4**: This command is used to format the device with the ext4 filesystem, which is a popular Linux filesystem.
    - **/dev/md0**: This is the RAID device that was just created. By formatting it with ext4, you are making it ready for use as a mountable filesystem.

7. **`lsblk`**
    - This command lists information about block devices, including disks and partitions. It shows the disk name, size, and partitions associated with each disk. you will see raid device `md0` in the output.
---

### Reason to Create a Partition in a Disk:

Partitions are created on disks for several important reasons:

1. **Logical Separation**: Partitioning allows you to divide a single disk into multiple logical sections. This enables you to install different operating systems or separate user data, logs, or system files on different partitions.

2. **Data Organization**: Having separate partitions for different types of data (e.g., system files, user data, backups) helps in organizing data and making it easier to manage.

3. **Performance**: Some filesystems and RAID levels perform better when placed on specific partitions, especially if the partitions are aligned with physical disk properties.

4. **Data Protection**: If you need to reinstall an operating system, for example, partitions allow you to wipe the system partition without affecting user data on other partitions.

5. **Flexibility**: With partitions, you can allocate different filesystems, formats, or security settings for each partition, giving you flexibility in how you manage storage.

6. **RAID Setup**: As shown in this example, partitions are necessary when creating RAID arrays. Each partition becomes part of the array, and the RAID configuration can spread data across multiple partitions for redundancy and performance benefits.

By creating partitions and using RAID, you achieve fault tolerance (especially with RAID 5) and better data management on the disks.

### Copy Files and Directories in Linux

### 1. `scp` (Secure Copy Protocol)

`scp` is a tool used to copy files and directories between systems in a secure way, using SSH for data transfer. It’s simple and useful for quick file transfers. However, `scp` does not offer advanced features such as partial transfers, resumable transfers, or preserving ownership like `rsync`.

#### Key Options:
- `-p`: Preserves file modification and access times, as well as file modes (permissions).
- `-r`: Recursively copies directories and their contents.
- `-v`: Verbose mode for detailed logging.
- `-i`: Specifies the identity file (private key) for authentication.

#### Example Usage:

1. **Copying a Single File**:
   ```bash
   scp /path/to/localfile.txt user@remote:/path/to/destination/
   ```
   This copies `localfile.txt` to the specified path on the remote server.

2. **Copying a Directory with Preservation**:
   ```bash
   scp -pr /path/to/localdir user@remote:/path/to/destination/
   ```
   This command copies the entire directory `localdir` from the local system to the remote system while preserving file permissions and timestamps.

#### Limitations of `scp`:
- No built-in support for resuming failed transfers.
- Cannot directly preserve ownership unless the user has root permissions on the destination system.

---

### 2. `rsync` (Remote Sync)

`rsync` is a powerful tool for copying and synchronizing files and directories across local and remote systems. It offers more advanced features compared to `scp`, such as partial transfers, file compression, and resumable transfers. `rsync` is especially useful for synchronizing large datasets and maintaining backups.

#### Key Options:
- `-a`: Archive mode. This option preserves file permissions, ownership, timestamps, symbolic links, and more. It is equivalent to using `-rlptgoD`.
    - `-r`: Recursively copy directories.
    - `-l`: Copy symlinks as symlinks.
    - `-p`: Preserve permissions.
    - `-t`: Preserve modification times.
    - `-g`: Preserve group ownership.
    - `-o`: Preserve user ownership.
    - `-D`: Preserve device and special files.
- `-z`: Compress files during transfer for faster speeds.
- `-P`: Shows progress during the transfer and makes the transfer resumable in case it gets interrupted.
- `--delete`: Deletes files in the destination that are not present in the source (for syncing).
- `--dry-run`: Simulates the transfer without actually making any changes, useful for testing.

#### Example Usage:

1. **Basic File Copy**:
   ```bash
   rsync /path/to/localfile.txt user@remote:/path/to/destination/
   ```

2. **Copy a Directory with Preservation of Permissions, Ownership, and Timestamps**:
   ```bash
   rsync -av /path/to/localdir user@remote:/path/to/destination/
   ```
    - The `-a` option ensures that file permissions, ownership, and timestamps are preserved, making this a more complete solution than `scp`.

3. **Copy with Progress Display and Resume Capability**:
   ```bash
   rsync -avzP /path/to/localdir user@remote:/path/to/destination/
   ```
    - The `-P` option shows the progress and allows the transfer to resume in case it was interrupted.

4. **Synchronize Two Directories** (Including Deleting Files Not Present in Source):
   ```bash
   rsync -av --delete /path/to/localdir/ user@remote:/path/to/destination/
   ```
    - This command syncs the local directory with the remote one, deleting any files from the destination that don’t exist in the source.

---

### Comparison: `scp` vs `rsync`

| Feature                     | `scp`                                             | `rsync`                                                   |
|-----------------------------|---------------------------------------------------|-----------------------------------------------------------|
| Secure Transfer              | Yes (uses SSH)                                    | Yes (uses SSH)                                             |
| Directory Transfer           | Yes, with `-r`                                    | Yes, with `-a` or `-r`                                     |
| Preserve Permissions         | Yes, with `-p`                                    | Yes, with `-a`                                             |
| Preserve Ownership           | No (unless root on destination)                   | Yes, with `-a`                                             |
| Resume Capability            | No                                                | Yes, with `-P`                                             |
| Synchronization/Incremental  | No                                                | Yes                                                        |
| Compression                  | No                                                | Yes, with `-z`                                             |
| Progress Display             | No                                                | Yes, with `-P`                                             |
| Partial Transfers            | No                                                | Yes (only transfers changes, much more efficient)          |
| Speed                        | Slower (copies everything every time)             | Faster (transfers only changed parts of files)             |
| Ideal Use Case               | Quick one-off transfers                           | Backup, large file sync, or when you need advanced options |

### When to Use `scp`:
- For quick, straightforward file transfers where advanced options are not needed.
- When you need a simple way to copy files between hosts without worrying about synchronization or partial transfers.

### When to Use `rsync`:
- For transferring large datasets or directories where preserving file ownership, permissions, and timestamps is important.
- When you need to sync directories or resume interrupted transfers.
- For regular backups, synchronizations, or when you need to optimize bandwidth with compression.


### What are Shell Keywords?

Shell keywords are reserved words that have special meaning to the shell. They are fundamental to shell scripting and command-line operations. Examples include `if`, `else`, `for`, `while`, etc.

#### How to Count Shell Keywords

To count the number of shell keywords available in your system, use the following command:

```bash
compgen -k | wc -l
```

This command typically outputs 22 on most modern Unix-like systems.

#### How it Works

- `compgen -k`: Lists all shell keywords
- `|`: Pipes the output to the next command
- `wc -l`: Counts the number of lines in the input

#### Examples

1. Count the keywords:
   ```bash
   $ compgen -k | wc -l
   22
   ```

2. List all keywords:
   ```bash
   $ compgen -k
   if
   then
   else
   elif
   fi
   case
   esac
   for
   select
   while
   until
   do
   done
   in
   function
   time
   {
   }
   !
   [[
   ]]
   coproc
   ```

3. Compare with built-in commands:
   ```bash
   $ compgen -b | wc -l
   61
   ```
   This shows there are more built-in commands than keywords.

#### Note

The exact number of keywords may vary slightly between different shell implementations or versions. Always test on your specific system.

### IP Tables Setup on ubuntu

Ip Tables installation on ubuntu
```bash
sudo apt update -y && sudo apt install -y iptables
```

#### List IP Tables Rules

To list the current IP tables rules, use the following command:
```bash
sudo iptables -L
```

##### Task 1
On devapp01, add an incoming rule permitting SSH and HTTP connection from Bob's Laptop.
Bob's Laptop has an IP address of 172.16.238.187.

To set up an `iptables` rule that permits incoming SSH (port 22) and HTTP (port 80) connections from Bob's Laptop with IP address `172.16.238.187`, you can add the following rules:

1. Allow incoming SSH traffic:
   ```bash
   sudo iptables -A INPUT -p tcp -s 172.16.238.187 --dport 22 -j ACCEPT
   ```

2. Allow incoming HTTP traffic:
   ```bash
   sudo iptables -A INPUT -p tcp -s 172.16.238.187 --dport 80 -j ACCEPT
   ```

These commands will append (`-A`) new rules to the `INPUT` chain to allow traffic from the specified IP address for SSH (port 22) and HTTP (port 80). You can verify the new rules using:
```bash
sudo iptables -L
```

Sure! Here's a breakdown of each option used in the `iptables` command:

### 1. `iptables`
This is the command-line utility for configuring the Linux kernel's IP packet filter rules, also known as the firewall.

### 2. `-A INPUT`
- **`-A`**: This stands for **append**. It means you're adding a new rule to the specified chain.
- **`INPUT`**: This is the name of the chain where you're adding the rule. The `INPUT` chain is used to filter packets destined for the local system (i.e., incoming traffic). We're specifying that this rule applies to all incoming packets.

### 3. `-p tcp`
- **`-p`**: This specifies the protocol. In this case, we are using **TCP** (Transmission Control Protocol), which is the protocol used by SSH and HTTP.

### 4. `-s 172.16.238.187`
- **`-s`**: This option sets the **source IP address**. Here, we are specifying that the rule only applies to packets coming from **172.16.238.187** (Bob's Laptop). This restricts the rule to allow traffic only from this IP address.

### 5. `--dport 22` (for SSH) or `--dport 80` (for HTTP)
- **`--dport`**: This option sets the **destination port** for the rule.
    - For SSH, the destination port is **22** (the default SSH port).
    - For HTTP, the destination port is **80** (the default HTTP port).

This means the rule applies to traffic that is trying to connect to port 22 (for SSH) or port 80 (for HTTP) on your machine.

### 6. `-j ACCEPT`
- **`-j`**: This option specifies the **target** of the rule, i.e., what to do with packets that match the rule. In this case, the target is **ACCEPT**.
- **`ACCEPT`**: This means that packets matching the rule will be allowed to pass through.

### Full Example:

#### For SSH:
```bash
sudo iptables -A INPUT -p tcp -s 172.16.238.187 --dport 22 -j ACCEPT
```
This allows incoming TCP traffic from Bob's Laptop (IP `172.16.238.187`) destined for port 22 (SSH) and accepts it.

#### For HTTP:
```bash
sudo iptables -A INPUT -p tcp -s 172.16.238.187 --dport 80 -j ACCEPT
```
This allows incoming TCP traffic from Bob's Laptop (IP `172.16.238.187`) destined for port 80 (HTTP) and accepts it.

### Summary:
- **iptables**: The command-line tool to manage firewall rules.
- **-A INPUT**: Add a rule to the `INPUT` chain, which handles incoming traffic.
- **-p tcp**: The protocol is TCP.
- **-s 172.16.238.187**: Specifies the source IP address (Bob's Laptop).
- **--dport 22/80**: Specifies the destination port (SSH is 22, HTTP is 80).
- **-j ACCEPT**: Accept the traffic if it matches the rule.

#### Task 2
Now, lockdown incoming traffic on devapp01. Drop incoming connections from any source on any destination port for any protocol (TCP/UDP).
Remember, this rule should be at the bottom of the chain for the SSH and HTTP access from caleston-lp10 to work.


To block all incoming traffic except the allowed SSH and HTTP connections from Bob's Laptop, you need to add a rule to drop all other traffic at the end of the `INPUT` chain. This ensures that the SSH and HTTP access you've already allowed will still work, and all other traffic will be dropped.

You can do this by appending the following rule to block all remaining incoming connections:

```bash
sudo iptables -A INPUT -j DROP
```

### Explanation:
- **`-A INPUT`**: This appends the rule to the `INPUT` chain, meaning it applies to all incoming packets.
- **`-j DROP`**: This tells `iptables` to **drop** all packets that do not match any previous rules in the chain (i.e., all incoming connections from other sources or ports).

### The order of rules is crucial:
The rules that allow traffic from Bob’s Laptop for SSH and HTTP must be placed **before** this drop rule, which blocks everything else. Since you have already added the SSH and HTTP rules, appending this `DROP` rule at the end ensures that all other traffic will be blocked.

You can verify the rules by running:

```bash
sudo iptables -L
```

This should show:
- SSH and HTTP rules for `172.16.238.187`.
- A final `DROP` rule for everything else.

#### Task 3
On devapp01, add an outgoing rule permitting access to port 5432 on devdb01 and HTTP access to caleston-repo-01. Once this is done, block outgoing traffic to any destination on http/https ports from devapp01
Note: caleston-repo-01 has the ip address of 172.16.238.15

IP address for `devdb01` (172.16.238.11):

1. **Allow outgoing traffic to `devdb01` on port 5432:**
   ```bash
   sudo iptables -A OUTPUT -p tcp -d 172.16.238.11 --dport 5432 -j ACCEPT
   ```

2. **Allow HTTP access to `caleston-repo-01` on port 80:**
   Since `caleston-repo-01` has the IP address 172.16.238.15, allow outgoing HTTP traffic:
   ```bash
   sudo iptables -A OUTPUT -p tcp -d 172.16.238.15 --dport 80 -j ACCEPT
   ```

3. **Block all other outgoing traffic on HTTP (port 80) and HTTPS (port 443):**
   Block outgoing traffic to all other destinations on ports 80 and 443:
   ```bash
   sudo iptables -A OUTPUT -p tcp --dport 80 -j DROP
   sudo iptables -A OUTPUT -p tcp --dport 443 -j DROP
   ```

Once you've applied these rules, verify them with:
```bash
sudo iptables -L OUTPUT -v
```

#### Task 4
Add an OUTPUT rule to the top of the chain which will allow https connection to google.com on devapp01
Note: https connection uses port 443

To add an **OUTPUT** rule that permits **HTTPS** connections to `google.com` on `devapp01`, you can follow this approach:

1. **Allow outgoing HTTPS (port 443) traffic to google.com:**
   Since the IP address of `google.com` in your example is `173.194.194.139`, you would allow traffic specifically to that IP address over port 443. Run the following command:

   ```bash
   sudo iptables -I OUTPUT 1 -p tcp -d 173.194.194.139 --dport 443 -j ACCEPT
   ```

   This rule uses `-I OUTPUT 1` to insert the rule at the top of the **OUTPUT** chain.

2. **Verify the rules:**
   After adding the rule, list the **OUTPUT** rules to verify it was added at the top:
   ```bash
   sudo iptables -L OUTPUT -v
   ```

This should allow HTTPS traffic specifically to google.com while maintaining the previous restrictions on other outgoing traffic.
