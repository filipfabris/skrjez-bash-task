S="ovo je proba"
echo $S

array=`ls`
echo $array

echo "$S.$S.$S."

a=4
b=3
c=7
d=$(( ($a+4) * $b%$c))
echo $a $b $c $d

broj_rijeci=`wc -w *.txt | awk '{print  $1}' | tail -1`
#broj_rijeci=`wc -w *.txt | cut -d ' ' -f 2 | tail -1`
echo $broj_rijeci

ls ~