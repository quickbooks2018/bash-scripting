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

### Running script in background

ps -aux | grep -i bash
root         462  0.0  0.0  11724  7296 ?        Ss   00:55   0:00 /bin/bash /opt/websh/start-websh.sh
cloud_u+    2729  0.0  0.0   9100  5120 pts/0    Ss   04:12   0:00 -bash
root        2744  0.0  0.0   9104  5120 pts/1    S    04:12   0:00 -bash
cloud_u+    2885  0.0  0.0   9336  5248 pts/2    Ss   04:15   0:00 -bash
cloud_u+    2935  0.0  0.0   7764  3328 pts/2    S+   04:24   0:00 /bin/bash ./sleep.sh
root        2938  0.0  0.0   7004  2432 pts/1    S+   04:24   0:00 grep --color=auto -i bash
root@d8d3ed90041c:~#
root@d8d3ed90041c:~# ps -ef | grep -i bash
root         462       1  0 00:55 ?        00:00:00 /bin/bash /opt/websh/start-websh.sh
cloud_u+    2729    2673  0 04:12 pts/0    00:00:00 -bash
root        2744    2743  0 04:12 pts/1    00:00:00 -bash
cloud_u+    2885    2836  0 04:15 pts/2    00:00:00 -bash
cloud_u+    2935    2885  0 04:24 pts/2    00:00:00 /bin/bash ./sleep.sh
root        2943    2744  0 04:24 pts/1    00:00:00 grep --color=auto -i bash

see process id 2885 is running a script sleep.sh in background, and parent process id is 2885

```bash
nohub ./script.sh &
```

Explanation:
- `nohup`: Run a command immune to hangups, with output to a non-tty
- `&`: Run the command in the background

The command `nohup ./script.sh &` is used to run a shell script (`script.sh`) in the background, and it allows the script to continue running even after the terminal session is closed. Here’s a breakdown of each part:

1. **`nohup`**: Stands for "no hang up." It prevents the script from being terminated when the user logs out or closes the terminal. Normally, when you close a terminal, all running processes started from that terminal are killed. `nohup` ensures that the process keeps running in the background even if you log out.

2. **`./script.sh`**: This specifies the script you want to run. The `./` indicates that the script is located in the current directory, and `script.sh` is the name of the shell script.

3. **`&`**: This runs the script in the background, meaning the terminal is freed up for other commands while the script continues to run.

### Example of Output:
If you run `nohup ./script.sh &`, you may see something like:

```bash
nohup: appending output to 'nohup.out'
```

By default, `nohup` redirects the output (stdout and stderr) of the script to a file named `nohup.out`, unless you specify another output file.

### Summary:
- `nohup`: Ensures the script isn't killed when the terminal is closed.
- `&`: Runs the script in the background.
