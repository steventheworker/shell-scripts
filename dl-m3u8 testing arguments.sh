if [ -z "$1" ]
then
    echo "No argument supplied"
    exit 1
fi
arg1=$1

# $prefix/$fileName.m3u8
IFS=/ read -a myarray <<< "$1"

# echo "second to last array item ${myarray[*]: -2:1}"
fileName=${myarray[*]: -1}
endIndex="$(( ${#arg1} - ${#fileName} - 1))"
prefix="${arg1:0:$(($endIndex))}"
echo $prefix

IFS=? read -a filePathAndQuery <<< "$fileName"
echo ""
echo ${filePathAndQuery[0]}


# The -z switch will test if the expansion of "$1" is a null string or not. If it is a null string then the body is executed.
