# Bash Scripting

- Shell Tests

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