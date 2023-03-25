# Bash commands

### List all enviroment variabless
```bash 
env | less
```

### Read File
* Read whole file in one line
```bash
for line in "${my_array[@]}"; do
```

* Read line by line
```bash
for word in $(cat log1.txt); do
        echo $word;
done
```

```bash
for word in $(cat log1.txt); do
        echo $word;
done
```

### Line extractor
* Read line by line ad take 7th element
* Elements are splitet by whitespace (" ")
```bash
awk '{print $7}' log1.txt
```


### Cut deimiter
```bash
cut -d '"' -f 2 example.txt
```
* Input
```
This is "some text" with double quotes.
Another line with "more text" in quotes
```
* Output
```
some text
more text
```

### Sed command
* GET -> get
```bash
awk '{print " : " $6 $7}' log1.txt |sed 's/GET/get/g' |sort | uniq -c | sort -rn
```

```
GET/zadaci.pdf
->
get/zadaci.pdf
```

* " -> none
* espace is used
``` bash
awk '{print " : " $6 $7}' log1.txt |sed 's/\"//g' |sort | uniq -c | sort -rn
```

```
"GET/zadaci.pdf
->
GET/zadaci.pdf
```

### Read elements from input and add it to array
```bash
myarray=()
for i in {1..5}
do
    read -p "Enter element $i: " element
    echo "Adding $element to array"
    echo "myarray[$i]=$element"
    echo $i
    myarray+=("$element")
done

echo "The array contains: ${myarray[@]}"
```

### Sort elements based on month
```bash
declare -A months=( [01]="Jan" [02]="Feb" [03]="Mar" [04]="Apr" [05]="May" [06]="Jun" [07]="Jul" [08]="Aug" [09]="Sep" [10]="Oct" [11]="Nov" [12]="Dec" )

current_month=""

for file in ${sorted_array[@]}
do
    month=${file:4:2} #offset 4, length 2
    year=${file:0:4} #offset 0, length 4

    if [ "$current_month" != "$month-$year" ] #if month changed
    then
        if [ "$current_month" != "" ] #not first time
        then
            echo "--- Ukupno: $count slika -----"
        fi

        current_month="$month-$year"
        # echo "$(echo "${months[$month]}")-$year :"
        echo "$month-$year :"
        echo "----------"
        count=0
    fi

    count=$((count+1)) #arithmetics in bash
    printf "%d. %s\n" "$count" "$file"
done

echo "--- Ukupno: $count slika -----"
```

* Input:
```
20200102_1025.jpg
20200102_1915.jpg
20200207_1706.jpg
20200212_0954.jpg
20200214_1234.jpg
```
* Output:
```
01-2020 :
----------
1. 20200102_1025.jpg
2. 20200102_1915.jpg
--- Ukupno: 2 slika -----
02-2020 :
----------
1. 20200207_1706.jpg
2. 20200212_0954.jpg
3. 20200214_1234.jpg
--- Ukupno: 3 slika -----
```

### AWK command

#### Count number of lines, using END to print only last one
``` bash
awk 'END {print NR}' zd5/a/a1.txt
```
Output:
```
3
```
#### Count number of lines, without end

``` bash
awk '{print NR}' zd5/a/a1.txt
```
Output:
```
1
2
3
```

### Find command, find files and execute echo
* {} contains found file names
* exec command executes on every found file
* must end with \ ;
```bash
find a -name "*.txt" -exec echo {} \;
```

* Count number of lines in each found file
```bash
find "a" -name "*.txt" -exec wc -l {} \;
```