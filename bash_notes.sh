                                        Day 1
--------------------------------------------------------------------------------------
Bash Book: https://cted.cybbh.io/tech-college/pns/public/pns/latest/guides/bash_sg.html
OPENVPN Website: https://cctc.cybbh.io/students/students/latest/openvpn-guide.html
/> ls -al
  # this will show hidden files (typically start with a period)
/> ls -lisa
  # This lists everything in a long list (index number, hidden files, size, and puts them in a long list)
/> sudo !! 
  # this will run last command as root
/>grep
  # searches for pattern in file 
  # -o prints only what we are searching for
  > egrep or grep -E
  # -v inverts your search (find anything except this)
  > cat /etc/passwd | grep /bin/bash
    # dumps /etc/password and finds /bin/bash written in the text that was dumped
/> touch -t
  # changes time of file (yymmddhhmm.ss)
/> mkdir -p
  # makes parent directory
  > mkdir sushi{11,22,33,44}
/> umask
  # default permissions
/> rm
  # recursively removes something, forcefully
/> ls ~/*.log
  # finds files that end with .log in the ~/ directory
/> locate
  # find file by name
/> find
  # -name (denotes case sensitive)
     > find ~/1123 -name *.txt | grep -v '~'
  # -iname (denotes case insensitive)
  # -size (size in bytes)
    > find -size +10M -20M
  # -inum (inode numbers)
  # -gid 45645 (finds group id number)
  # -maxdepth (tells it how deep to go in directories)
    > find . -maxdepth 3 -type d
  # -type
    > find / -type s -exec echo {} 2>/dev/null \; | grep domain*
    > find /var/log -iname *.log -exec ls -al {} 2>/dev/null \;
      # \; for each result found, the command is executed
      # + says for every result of the find command, the command is executed only once
      #  https://linuxhandbook.com/find-exec-command/
  $examples:
      > mkdir 11{23,34,45,56}
        # makes directories 1123, 1134, 1145, 1156
      > touch {1,2,3,4,5,6~,7~,8~,9~}.txt
        # makes all these files ending in .txt
      > find ~/1123 -name *.txt
        # this finds files in the 1123 directory named *.txt
      > find ~/1123 -name *.txt | grep -v '~'
        # this finds files in the 1123 directory named *.txt, but disregards files with the ~ symbol in the name
      > find ~/1123 -name *.txt  ! -name '*~*' -exec cp {} ~/CUT \;
        # finds files in 1123 ending in .txt but dont have ~ in the name and copies to directory cut
      > find /var -empty -printf '%i %f\n'
        # finds files in /var that are empty and used -printf and formats inode nums first then filename
      > find -inum 4026532575 -printf '%i %f\n'
        # finds file with specific inumber and formats inode first then filename second
time = days
  a - accessed
  c - changed
  m - modified
/> find -cmin 30
  # finds everything that was changed in the last 30 minutes
/> killall
  # kills all the processes
/> kill ###
  # kills a process by number
/> pkill (name)
  # kills a process by name
/> cut
  > cut -d: -f1 fakepasswd
    # this gives field 1 of password
    # -d means delimitor, and its doing it by : (only things with delimiter)
    # -f1 means field 1
  > cut -d: -f1 -s fakepasswd
    # -s does not print lines not containing deliminters
  > cut -d: -f2-4 fakepasswd
    # prints fields 2-4
  # examples:
    > ls -p ~/CUT | grep -v '/$' | grep -E '\..+$' | cut -d '/' -f 2 > ~/CUT/names
      # lists directories found (puts / infront of directories) in CUT and takes everything that does have / and uses regex, and cuts by deliminter / in the second field and puts it in names

                                          Day 2
---------------------------------------------------------------------------------------
/> awk
  > tail fakepasswd.txt | awk -F: '{print $2}'
      # formats by ':' and prints field 2
  > awk -F: 'BEGIN {OFS="#"} {print $1,$3}' fakepasswd.txt
      # this delimits by ':' and replaces empty space with '#' and prints fields 1 and 3
  > awk -F: '($3 == 0) {print $1}' fakepassword.txt
      # uses boolean to operate. if field 3 is 0 then it will print the first field
      # this specific example was used to find root user
      [OUTPUT: 'root']
  > awk -F: '($3 >= 150){print $1,$6,$3}' fakepassword.txt
      # uses '>=' to determine if it will work
  > awk -F: '{print $NF}' fakepasswd.txt
      # this prints the last field
/> sort
    # -k by columns
    # -r reverse order
    # -nr numeric reverse order
    # -f ignore case
    # -s by size
    # -u by unique
    # | uniq takes away duplicates after sorting by unique
    # -t specifies the delimiter
    # -k specifies field
    $Examples:
      > egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' StoryHiddenIPs | sort | uniq -c | sort -nr
        # uses regex to find ip addresses, sorts them by unique and counts occurences then sorts occurences by reverse numberic order
      > awk -F: '$3 >= 4 && $3 != 0 && $7 == "/bin/bash" {print $1}' ~/passwd > ~/SED/names.txt
        # checks if the 3rd field is greater than 4, not equal to 0, and the 7th field is equal to /bin/bash and then prints the 1st field.
      > dmesg | egrep 'CPU|BIOS' | egrep -iv 'usable|reserved' | cut -d] -f2-
        # takes output of dmesg and takes out cpu or bios uppercase and excludes usable or reserved and prints everything except for the numbers before the text that are separated by ']'



REGEX101.COM

BASH SCRIPTING
---------------------
#!/bin/bash
if [[ -f /etc/passwd ]]; then
    echo "etc/passwd file exists"
elif [[ ! -f /etc/passwd ]]; then
    echo "/etc/passwd file doesn't exist"
fi

#!/bin/bash 
if [[ 3129 == $(( 15645/5 )) ]]; then
  echo "math checks out"
elif [[ 3129 != $(( 15645/5 )) ]]; then
  echo "math for muhrines"
fi

/>sed
  # -e is adding to the script
  # -i is insentitive
  # s is substituion start pattern
  # g is global
  # d deletes
  # $ means end of line
  > sed -e 's/chicken/hamburger/g' -e /s/pepperoni/sausage/' pizza.txt
    # replaces chicken with hamburger and pepperoni with sausage 
  > sed -e 's/chicken/hamburger/' pizza.txt
    # this replaces first instance by line of chicken with hamburger
  > sed -e '/chicken/d' pizza.txt
    # the 'd' deletes, so this one is deleting chicken
  > sed -e 's/chicken/hamburger/g' pizza.txt

SCRIPTING
------------------
#!/bin/bash
A=$(find /usr/bin -name passwd)
echo $A
echo
md5sum $A
echo
file $A


#!/bin/bash HASHED=$(openssl passwd -1 -salt bad4u Password1234) awk -F: v hh=$HASHED '[OFS=":"][$2=hh;print)' $HOME/PASS/shadow.txt_

                                                    Day 3
-----------------------------------------------------------------------------------
find ~/ -name '*.bin' -exec dirname {} \; | sort -u
find ~/ -name '*.bin' | rev | cut -d/ -f2-100 | rev | sort -u
  # both of these do the same thing. One uses 'dirname' and the other uses cut to reverses the text and takes fields 2-10 and prints them then reverses again and sorts
-------------
#!/bin/bash
name=$2
ugid=$3
file=$1
base=$(tail -1 $file)
echo $base | awk -F: -v name=$2 -v ugid=$3 '{OFS=":"} {$1=name} {$3=ugid} {$4=ugid} {$6="/home/"name} {$NF="/bin/bash"} {print $0}' >> $file
  # this script tails the given passwd file replaces the name field with $2, uid and gid with $3 and then prints the line out with changes added
-------------
md5sum $(find /bin /sbin /usr/bin /usr/sbin -type f -executable | sort | sed -n 10p) | cut -d' ' -f1
  # this looks through specific directories and finds executable files and sorts them, takes out the 10th item in the list and hashes the file and cuts an extra uneeded character off the end
-------------
sort -t: -k4 -n fakepasswd.txt | sed -n 10p | cut -d: -f6 | md5sum | cut -d' ' -f1
  # this takes the 10th line in password file and then sorts numerically by gid and takes an md5sum of the file path
-------------
#!/bin/bash
mkdir -p "$HOME/HASHES"
find /bin /etc /var -maxdepth 3 ! -type p -exec md5sum {} \; > "$HOME/HASHES/success" 2> "$HOME/HASHES/fail"
A=$(wc -l < "$HOME/HASHES/success")
B=$(grep -c "Is a directory" "$HOME/HASHES/fail")
if [[ "$A" -gt 0 ]]; then
    echo "Successfully Hashed Files: $A"
    echo "Unsuccessfully Hashed Directories: $B"
else
    echo "oops"
fi
------------------------------------------
if [ -d "$HOME/.ssh" ]; then
    mkdir -p "$HOME/SSH"
    cp -r "$HOME/.ssh/"* "$HOME/SSH/"
else
    echo "Run ssh-keygen"
fi
--------------------------
#!/bin/bash
A=$(route | grep 'default.*[[:digit:]]' | awk '{print $2}')
B=$(which ping)
C=" 0% packet loss"
D=$($B -c 6 $A | grep -Eo "$C")
if [[ "$C" == "$D" ]]; then
   echo "successful"
else
   echo "failure"
fi
------------------------
mkdir $HOME/ZIP
echo "12345" | md5sum | cut -d" " -f1 > $HOME/ZIP/file1
echo "6789" | md5sum | cut -d" " -f1 > $HOME/ZIP/file2
echo "abcdef" | md5sum | cut -d" " -f1 > $HOME/ZIP/file3
zip -j $HOME/ZIP/file.zip $HOME/ZIP/file{1,2,3}
tar -czf $HOME/ZIP/file.tar.gz -C $HOME/ZIP/ file.zip
----------------------------
rootline=$(head -1 $HOME/passwd)
for x in {LARRY,CURLY,MOE} ; do
  myuid=$(cat $HOME/$x.txt)
  mkdir $HOME/$x
  echo $rootline | awk -F: -v uu=$x -v ii=$myuid 'BEGIN{OFS=":"}{$1=uu;$3=ii;$4=ii;$6="$HOME/"uu}{print $0}' >> $HOME/passwd
--------------------
#!/bin/bash
find /etc -type f -exec stat -c '%a' {} \; > ./A 2>/dev/null
> ./less
> ./more
while read -r x; do
    if [[ $x -le 640 ]]; then
        echo "$x" >> ./less
    elif [[ $x -ge 642 ]]; then
        echo "$x" >> ./more
    fi
done < ./A
echo 'Files w/ OCTAL Perm Values 642+:'
sort ./more | uniq -c | sort -nr
echo
echo 'Files w/ OCTAL Perm Values 0-640:'
sort ./less | uniq -c | sort -nr
