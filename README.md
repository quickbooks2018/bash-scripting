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