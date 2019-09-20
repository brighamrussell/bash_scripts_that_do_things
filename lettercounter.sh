#!/bin/bash

# This script depends on the existence of /usr/share/dict/words
Dir='/tmp';
read -p 'Please enter a letter: ' LetterX;
read -p 'How many times does this letter occur? ' InstanceX;
grep "$LetterX" /usr/share/dict/words | grep -v "[A-Z\'-]" > $Dir/wordlist
wordnum=$(wc -l $Dir/wordlist);
echo $wordnum
>$Dir/wordlist2;
for i in $(cat $Dir/wordlist); do
  nl=$(echo $i|grep -o "$LetterX"|wc -l);
  if [ $nl -eq $InstanceX ]; then
    echo "$i $nl" >>$Dir/wordlist2;
  fi
done
Answer=$(wc -l $Dir/wordlist2);
echo "There are $Answer words in the dictionary in which the letter $LetterX occurs $InstanceX times";
