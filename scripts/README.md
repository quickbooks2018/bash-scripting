# Bash Scripting

### Run script with `source` vs `./script.sh`

When you have a bash script and you want to execute it, you can do so in two ways:
The key difference between executing a script with `source` and executing it with `./script.sh` lies in the execution environment and how changes made in the script affect the current shell. Here's a brief explanation with examples.

### Difference:
- **Executing with `source` (or `.`):** The script is executed **in the current shell**. Any environment variables or changes to the working directory (`cd`, etc.) made by the script will affect the current shell session.
- **Executing with `./script.sh`:** The script runs **in a new subshell**. Changes to the environment within the script (like variables, `cd`, etc.) do not affect the current shell.

### Example

Let’s say you have a script called `script.sh`:

```bash
#!/bin/bash
# script.sh

echo "Current Directory: $(pwd)"
MY_VAR="Hello, World!"
cd /tmp
```

#### Running with `source`:

```bash
source ./script.sh
```

- The script will execute in the current shell.
- `MY_VAR` will be set in your current shell.
- The current working directory will change to `/tmp`.

#### Running with `./script.sh`:

```bash
./script.sh
```

- The script runs in a **new subshell**.
- `MY_VAR` will not be available in the current shell.
- The current working directory will not change in the current shell.

### Example Behavior:

```bash
$ pwd
/home/user
$ source ./script.sh
Current Directory: /home/user
$ echo $MY_VAR
Hello, World!
$ pwd
/tmp

$ cd /home/user
$ ./script.sh
Current Directory: /home/user
$ echo $MY_VAR

$ pwd
/home/user
```

As you can see, when using `source`, the environment variables and directory changes remain in the current shell. With `./script.sh`, those changes are isolated to the subshell and do not affect the current shell.

