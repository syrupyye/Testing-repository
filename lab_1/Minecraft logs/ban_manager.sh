#!/bin/bash


format() {
sed -i '/11_Steve_11[[:space:]]/d' "$1"
sort -u "$1" -o "$1"
}

add()    {

local nickname time reason

if [[ $# -eq 1 ]]; then
	read -r nickname time reason <<< "$1"
elif [[ $# -eq 3 ]]; then
	nickname="$1"
	time="$2"
	reason="$3"
else
	echo "Positional arguments failure." >&2
	return 1
fi

if [[ -z "$nickname" || -z "$time" || -z "$reason" ]]; then
	echo "Positional arguments are not to be empty" >&2
	return 1
fi

sed -i "/^${nickname}[[:space:]]/d" banlist.txt

echo "$nickname $time $reason" >> banlist.txt

}

info()   {
local nickname="$1"
sed -n "/^${nickname}[[:space:]]/p" banlist.txt	
}

remove() {
local nickname="$1"
sed -i "/^${nickname}[[:space:]]/d" banlist.txt
}


sort()   {
local key="$1"
local file="$2"
case "$key" in
	--name)
	command sort -k1,1 banlist.txt > "$file"
	;;
	--time)
	command sort -k2,2 banlist.txt  > "$file"
	;;
	*)
	echo "Unknown key for sorting." >&2
	return 1
	;;
esac
}

action="$1"
shift

case "$action" in
    format) format "$@" ;;
    add)    add    "$@" ;;
    info)   info   "$@" ;;
    remove) remove "$@" ;;
    sort)   sort   "$@" ;;
    *)
        echo "Unknown instruction: $action" >&2
        exit 1
        ;;
esac


