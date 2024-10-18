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
```bash
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
````
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

### strace

```bash
strace -Tfp 3116
```
-T: This option adds timing information (how long each system call took) to the output.
-f: This tells strace to follow child processes that are spawned by the traced process.
-p 462: This attaches strace to the process with PID 3116, allowing you to monitor the system calls made by this running process.

```bash
 ps -ef | grep -i bash
root         462       1  0 00:55 ?        00:00:00 /bin/bash /opt/websh/start-websh.sh
cloud_u+    2729    2673  0 04:12 pts/0    00:00:00 -bash
root        2744    2743  0 04:12 pts/1    00:00:00 -bash
cloud_u+    3116    3068  0 04:43 pts/2    00:00:00 -bash
cloud_u+    3136    3116  0 04:45 pts/2    00:00:00 /bin/bash ./sleep.sh
root        3139    2744  0 04:45 pts/1    00:00:00 grep --color=auto -i bash
root@d8d3ed90041c:~# strace -Tfp 3116
strace: Process 3116 attached
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], WSTOPPED|WCONTINUED, NULL) = 3136 <68.242025>
rt_sigprocmask(SIG_BLOCK, [CHLD TSTP TTIN TTOU], [CHLD], 8) = 0 <0.000019>
ioctl(255, TIOCSPGRP, [3116])           = 0 <0.000018>
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0 <0.000017>
ioctl(255, TCGETS, {B38400 opost isig icanon echo ...}) = 0 <0.000017>
ioctl(255, TIOCGWINSZ, {ws_row=42, ws_col=160, ws_xpixel=0, ws_ypixel=0}) = 0 <0.000016>
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0 <0.000017>
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=3136, si_uid=1001, si_status=0, si_utime=0, si_stime=0} ---
wait4(-1, 0x7ffd18ae0150, WNOHANG|WSTOPPED|WCONTINUED, NULL) = -1 ECHILD (No child processes) <0.000013>
rt_sigreturn({mask=[]})                 = 0 <0.000023>
rt_sigaction(SIGINT, {sa_handler=0x60a5dc7eb150, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=0x60a5dc7eb150, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000019>
rt_sigprocmask(SIG_BLOCK, [CHLD TSTP TTIN TTOU], [], 8) = 0 <0.000019>
ioctl(255, TIOCSPGRP, [3116])           = 0 <0.000018>
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0 <0.000018>
rt_sigaction(SIGINT, {sa_handler=0x60a5dc7eb150, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=0x60a5dc7eb150, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000017>
fcntl(0, F_GETFL)                       = 0x2 (flags O_RDWR) <0.000015>
ioctl(0, TIOCGWINSZ, {ws_row=42, ws_col=160, ws_xpixel=0, ws_ypixel=0}) = 0 <0.000017>
ioctl(0, TIOCSWINSZ, {ws_row=42, ws_col=160, ws_xpixel=0, ws_ypixel=0}) = 0 <0.000017>
ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) = 0 <0.000016>
ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) = 0 <0.000016>
ioctl(0, SNDCTL_TMR_STOP or TCSETSW, {B38400 opost isig -icanon -echo ...}) = 0 <0.000022>
ioctl(0, TCGETS, {B38400 opost isig -icanon -echo ...}) = 0 <0.000016>
write(2, "\33[?2004h", 8)               = 8 <0.000020>
rt_sigprocmask(SIG_BLOCK, [HUP INT QUIT ALRM TERM TSTP TTIN TTOU], [], 8) = 0 <0.000017>
rt_sigaction(SIGINT, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=0x60a5dc7eb150, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000017>
rt_sigaction(SIGTERM, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000018>
rt_sigaction(SIGTERM, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000017>
rt_sigaction(SIGHUP, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=0x60a5dc7eb530, sa_mask=[HUP INT ILL TRAP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000013>
rt_sigaction(SIGQUIT, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000016>
rt_sigaction(SIGQUIT, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000016>
rt_sigaction(SIGALRM, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=0x60a5dc7eb530, sa_mask=[HUP INT ILL TRAP ABRT BUS FPE USR1 SEGV USR2 PIPE ALRM TERM XCPU XFSZ VTALRM SYS], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000013>
rt_sigaction(SIGTSTP, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000017>
rt_sigaction(SIGTSTP, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000015>
rt_sigaction(SIGTTOU, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000017>
rt_sigaction(SIGTTOU, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000016>
rt_sigaction(SIGTTIN, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000015>
rt_sigaction(SIGTTIN, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, {sa_handler=0x60a5dc84ca20, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7a2560042520}, 8) = 0 <0.000018>
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0 <0.000017>
rt_sigaction(SIGWINCH, {sa_handler=0x60a5dc84ca30, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7a2560042520}, {sa_handler=0x60a5dc7e9300, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7a2560042520}, 8) = 0 <0.000015>
write(2, "\33]0;cloud_user@d8d3ed90041c: ~/b"..., 84) = 84 <0.000027>
pselect6(1, [0], NULL, NULL, NULL, {sigmask=[], sigsetsize=8}
```

The `strace` output you're observing indicates that you're tracing a Bash shell process (PID 3116) and capturing the system calls it's making. Here’s a breakdown of what’s happening in the output:

1. **wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], WSTOPPED|WCONTINUED, NULL)**: The process is waiting for a child process to finish. This system call waits for a process to change state (e.g., terminate or stop), and in this case, the child process (PID 3136, as seen later) has finished with a status code of 0, indicating a successful exit.

2. **rt_sigprocmask**: These calls involve manipulating the signal mask for the process. Signals are used for communication between processes and the operating system. The `rt_sigprocmask` system call blocks or unblocks signals, ensuring certain signals (like `CHLD`, `TSTP`, `TTIN`, etc.) are temporarily blocked or unblocked during specific operations.

3. **ioctl**: This is a system call used to control device parameters. In this case, it's operating on file descriptors (likely associated with the terminal or controlling tty), setting parameters like the terminal's window size (`TIOCGWINSZ`) and group ownership (`TIOCSPGRP`).

4. **SIGCHLD**: The process receives a `SIGCHLD` signal, which is sent when a child process terminates. This is confirmed by `si_pid=3136`, meaning the child process with PID 3136 has exited.

5. **pselect6(1, [0], NULL, NULL, NULL, {sigmask=[], sigsetsize=8})**: The `pselect6` system call is used to monitor file descriptors (in this case, stdin represented by `0`) for readiness to perform I/O. The system call is used in conjunction with signals. The process is waiting for input or a signal to occur.

### Key System Calls:
- **wait4**: This shows that the process is waiting for child processes to terminate.
- **ioctl**: Manipulating terminal settings (e.g., getting window size, setting group process ID).
- **rt_sigprocmask**: Signal handling for managing signals like `SIGCHLD`, which informs the process when a child process has terminated.
- **SIGCHLD**: The signal received when the child process (PID 3136) terminates.

In summary, the `strace` output shows a Bash process (PID 3116) waiting for a child process (PID 3136, which is the `/bin/bash ./sleep.sh` process) to finish. It successfully detects the child’s termination and handles signals related to the terminal and process control.

If you have any specific questions or need further clarification about the output, feel free to ask!


### Brace expansion & for loop example

- brace expansion example
```bash
mkdir {1..7}
mkdir dir{1..7}
touch file{1..7}.txt
```

- for loop examole
```bash
for i in `seq 7`; do echo $i; done
for i in {1..7}; do echo $i; done
```

### bash && vs ||
- `&&`: The `&&` operator is used to execute the second command only if the first command is successful (i.e., returns an exit status of 0).
- `||`: The `||` operator is used to execute the second command only if the first command fails (i.e., returns a non-zero exit status).