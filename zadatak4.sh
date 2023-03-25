# . zadatak4.sh ./../lab1/Testovi/Slike/

if [ "$#" -eq 1 ]; then
    echo "Path $1"
else
    printf "Krivi broj argumenata\n"
    printf "Primjer: ./zadatak4.sh [path]\n"
    exit 1
fi

path=$1

if [ -d "$path" ]; then
    echo "Direktorij postoji"
else
    echo "Direktroji ne postoji"
    exit 1
fi

        # declare -a myarray # myarray=() is the same
        # declare -i i=0 #declaring integer variable
        # for file in `ls $path` ; do
        #     # echo "$file"
        #     myarray+=("$file")
        #     i=$i+1 #i+=1 same
        #     if [ $i -eq 20 ] #Same as [ $i = 10 ]
        #     then
        #         break   # break out of the loop when i equals 5
        #     fi
        # done
        # #Same as array2=`ls $path`
        # #Number of elements in array
        # # echo "Number of elements in array: ${#myarray[@]}"

        # #sort array
        # sorted_array=($(sort <<<"${myarray[*]}"))
        # # echo "${sorted_array[@]}"
        # # echo "Number of elements in array: ${#sorted_array[@]}"

sorted_array=`ls $path`
current_month=""

for file in ${sorted_array}
do
    month=${file:4:2} #offset 4, length 2
    year=${file:0:4} #offset 0, length 4

    if [ "$current_month" != "$month-$year" ] #Ako je promjenjen broj mjeseca
    then
        if [ "$current_month" != "" ] #Nije prvi prolazak
        then
            echo "--- Ukupno: $count slika -----"
        fi

        current_month="$month-$year"
        echo "$month-$year :"
        echo "----------"
        count=0
    fi

    count=$((count+1)) #Ako count nije deklariran kao integer
    printf "%d. %s\n" "$count" "$file"
done

echo "--- Ukupno: $count slika -----"

