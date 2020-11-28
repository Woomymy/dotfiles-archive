source "./lib/colors.sh"
# Expected usage: 
# copy_file DIR FILE (without /) 
copy_file() {
    if [[ ! -f "/$1/$2" ]]; then
        redprint "File $1/$2 does not exist!"
        return;
    fi
    DIR=$1
    FILE=$2
    greenprint "Copying file $1/$2..."
    mkdir -p ./$1
    cp "/${1}/${2}" "./${1}/${2}"
}
# Expected usage: 
# copy_dir DIR(without /)
copy_dir() {
     if [[ ! -d "/$1" ]]; then
        redprint "Directory $1 does not exist!"
        return;
    fi
    DIR=$1
    greenprint "Copying file $1..."
    mkdir -p ./$1
    cp -r "/${1}/"* "./${1}/"
}