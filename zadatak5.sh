echo "Argumenti navedeni u naredbenom retku su: $1 $2"

#provjera za 2 argumenta, ako nema 2 argumenta, izlazi
if [ $# != 2 ]; then
    echo "Upisi 2 argumenta"
    exit 1
fi


# provjeri postoji li kazalo koje je navedeno kao argument
if [ ! -d "$1" ]; then
  echo "Kazalo ne postoji ili nije navedeno kao prvi argument."
  exit 1
fi

dir=$1
pattern=$2
declare -i total=0

for file in $dir/*; do
  total+=`find "$file" -name "$2" -type f -exec wc -l {} \; | awk '{ a += $1 } END { print a }'`
done

echo "Ukupan broj redaka u datotekama s imenima koji odgovaraju uzorku je: $total"