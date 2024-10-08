# Backup with tar

- Example

```bash
ls /home/bob/reptile/snake/python/
p1.dat

bob@caleston-lp10:~$ my_path=`dirname /home/bob/reptile/snake/python/`
bob@caleston-lp10:~$ echo $my_path/
/home/bob/reptile/snake/

bob@caleston-lp10:~$ target=`basename /home/bob/reptile/snake/python/`
bob@caleston-lp10:~$ echo $target
python

bob@caleston-lp10:~$ tar -czvf python.tar.gz -C "$my_path" "$target"
python/
python/p1.dat
```