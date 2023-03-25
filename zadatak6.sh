#. zadatak6.sh Testovi/dir1/ Testovi/dir2/

# provjeri broj argumenata
if [ $# -ne 2 ]; then
    echo "Upotreba: $0 DIR1 DIR2"
    exit 1
fi

# provjeri postojanje direktorija
if [ ! -d "$1" ]; then
    echo "Direktorij '$1' ne postoji"
    exit 1
fi

if [ ! -d "$2" ]; then
    echo "Direktorij '$2' ne postoji"
    exit 1
fi


# izvrsi sinkronizaciju iz DIR1 u DIR2
for file1 in $1/*; do
    file2=$2/`basename $file1`
    # echo $file1
    # echo $file2

    if [ ! -e $file2 ] || [ $file1 -nt $file2 ]; then
        echo "$file1 --> $file2"
    fi
done


# izvrsi sinkronizaciju iz DIR1 u DIR2
for file2 in $2/*; do
    file1=$1/`basename $file2`
    # echo $file1
    # echo $file2

    if [ ! -e $file1 ] || [ $file2 -nt $file1 ]; then
        echo "$file2 --> $file1"
    fi
done
