grep -i -E "JabUka|Banana|JAGODA|Dinja|Lubenica" namirnice.txt

echo ""

grep -i -v -E "JabUka|Banana|JAGODA|Dinja|Lubenica" namirnice.txt

grep -E -r -n '[A-Z]{3}[0-9]{6}' projekti/*

find . -mtime -14 -mtime +7 -ls

for i in $(seq 1 15); do 
    echo -n "$i "; 
done;

echo ""

kraj=5
for i in $(seq 1 $kraj); do 
    echo -n "$i "; 
done;

echo ""

kraj=5
for i in {1..$kraj}; do 
    echo -n "$i "; 
done;