if [ "X$1" == "X" ]; then
    echo "none input file!"
    exit 1
fi

sed -i.bak s,%5C,/,g $1
