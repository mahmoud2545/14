#!/bin/bash
z=$1
count1=$(wc -l ${1} | cut -d ' ' -f1 )
echo $count1                                                                                                                            
i=1                                                                                                                         
fif=1000
p=5060
while [ $i -le $count1 ]                                                                                                    
do                                                                                                                          
k=$(($i + $fif))                                                                                                            
                                                                                                                            
while [ $i -le $k ]                                                                                                         
do                                                                                                                          
if [ $i -gt $count1 ]; then                                                                                                 
break                                                                                                                       
fi                                                                                                                          
sed -n ''${i}'p' $1 >> tmpfile.txt                                                                                          
i=`expr $i + 1`                                                                                                             
done

filecontent=( `cat tmpfile.txt `)

for s in "${filecontent[@]}"
do

python svmap.py  $s -p$p -v >> $2 &

done 																														
echo "finished .$i FROM  $count1 " ;
rm tmpfile.txt
sleep 1
done




