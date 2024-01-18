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