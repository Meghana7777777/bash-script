#! /bin/bash
# this is a comment 
echo "hello world" # this is also a comment

# In shell script we have two types of variables
# system variables , user variables
# System variables are always in capital letters
# User variables are lower case (it's not manditory in lower case)

# System variables 
echo $BASH
echo $BASH_VERSION
echo $HOME
echo $PWD
 
#User variables
name=file
echo This is my first $name

#Read command allows you to prompt for input and store it in a variable
echo "Enter name : "
read name
echo name : $name

echo "Enter names : "            or     echo "Enter names : "
read name1 name2 name3                  read -a names
echo names : $name1 $name2 $name3       echo "Names : ${names[0]} ,${names[1]}"

# get input in the same line
read -p 'username : ' user_var
read -sp 'password : ' pass_var
echo
echo "username : $user_var"
echo "password : $pass_var"

# arrays 
echo $0 $1 $2 $3 '> echo $1 $2 $3 '

# here $0 represents the file name and remaining values represents which arguments are u passed

args=("$@")   #in this way also pass arrays
echo ${args[0]} ${args[1]}  ${args[2]} ${args[3]}

echo $@ # it is same as above 'echo args'
echo $# #it diplays the number og arguments passed


#Integer comparison

# -eq - is equal to -if [ "$a" -eq "$b" ]
# -ne - is not equal to -if [ "$a" -ne "$b"]
# -gt - is greater than -if [ "$a" -gt "$b" ]
# -ge - is greater than or equal to -if ["$a" -ge "$b"]
# -lt - is less than - if [ "$a" -lt "$b"]
# -le - is less than or equal to - if ["$a" -le "$b"]
#  <  - is less than - (( "$a" < "$b"))
#  <= - is less than or equal to - (( "$a" <= "$b"))
#  >  - is greater than -(("$a" < "$b"))
#  >= - is greather than or equal to (("$a" >= "$b"))

# String Comparison

#  = - is equal to - if ["$a"="$b"]
#  == - is equal to - if ["$a" == "$b"]
#  != -is not equal to -if ["$a" != "$b"]
#  < - is less than, in ASCII alphabetical order -if [[ "$a" < "$b"]]
#  > - is greater than, in ASCII alphabetical order -if [[ "$a" > "$b"]]
# -Z - string is null, that is ,has zero length

# format to write 'if' condition in shellscript
#   if[]
#   then 
#	  echo ---
#    fi

#! /bin/bash
# integer comparison

count=10

if [ $count -ne 9 ]
then
	echo " true"
fi
	    
#! /bin/bash
# string comparison

word=abcd

if [ $word = "abcd" ]
then 
	echo "true"
fi

# checking the file is available and test file is empty or not

# flags
# -e = exist
# -f = regular file (nothing but created by touch command)
# -d = directory
# -s = checks file is empty or non -empty
# -r = file is readable 
# -w = file is writable
# -x = file is executable

#! /bin/bash

echo -e "Enter the name of the file : \c" # \c = continue the cursor at the sameline
read file_name

if [ -e $file_name ]
then
	echo "found"
else
	echo "not found"
fi

# appending data to existing file

#! /bin/bash

echo -e "Enter the name of the file : \c"
read file_name

if [ -f $file_name ]
then
	if [ -w $file_name ]
	then
		echo "Type some text data. To quit press ctrl+d."
		cat >> $file_name
	else
		echo "Type file does not have write permissions"
	fi
else
 echo "$file_name not exists"
fi


#using logical 'AND/&&/-a' operator 

#! /bin/bash

age=25

if [ "$age" -gt 18 ] && [ "$age" -lt 30 ]
# if [[ "$age" -gt 18 && "$age" -lt 30]
# if [ "$age" -gt 18 -a "$age" -lt 30 ]
then
	echo "valid age"
else
	echo "not valid age"
fi

#using logical '0R/||/-o' operator
# OR operator satisfies only one condition is true ,no need two conditions are true

#! /bin/bash

age=25

if [ "$age" -gt 18 ] || [ "$age" -gt 30 ]
# if [ "$age" -eq 18 -o "$age" -ne 20 ]
# if [[ "$age" -gt 18 || "$age" -gt 30 ]]
then
	echo 'true'
else
	echo 'false'
fi

# using airthmetaic operations(+ , -, *, / ,% )
#! /bin/bash

num1=20
num2=5

echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))

#in expression

echo $(expr $num1 + $num2 )
echo $(expr $num1 - $num2 )
echo $(expr $num1 \* $num2 )
echo $(expr $num1 / $num2 )
echo $(expr $num1 % $num2 )

#floating point(decimal numbers) math operations

#! /bin/bash

num1=20.5
num2=5

echo "20.5+5"| bc # bc command is used to do some math operations like decimal,powers squareroot etc..
echo "20.5-5"| bc
echo "20.5*5"| bc
echo "scale=2;20.5/5"| bc # here scale variable gives the exact value of division and modules operations
echo "20.5%5"| bc

  OR
echo "$num1+$num2" | bc
echo "$num1-$num2" | bc
echo "$num1*$num2" | bc
echo "$num1/$num2" | bc
echo "$num1%$num2" | bc

#using squareroot , power

num=4

echo "sqrt(4)" | bc -l # -l define the standard math library
echo "3^3" | bc -l

# case statement
#! /bin/bash
# basic syntax

#case expression in
#	pattern1 )
#		statements ;;
#	pattern2 )
#		statements ;;
#...
#esac

fruit=$1

case $fruit in
        "apple" )
                echo "cost of $fruit is 10" ;;
        "banana" )
                echo "cost of $fruit is 5" ;;
        "pineapple" )
                echo "cost of $fruit is 15" ;;
        * )
                echo "not available" ;;
esac

#! /bin/bash

echo -e "Enter some character : \c"
read value
case $value in
	[a-z] )
		echo "user entered $value  a to z";;
	[A-Z] )
                echo " user entered $value A TO z";;
	[0-9] )
		echo " user entred $value 0 to 9" ;;
	? )
		echo " user entered $value special character";;
	* )
		echo " unkwown input";;
esac

#arrays
#! /bin/bash

os=( 'ubuntu' 'windows' 'linux' )
os[3]='mac' # add value 'mac' in 3 place
unset os[2]
echo "${os[@]}"  #'@' displays all elements in variable
echo "${os[1]}"  #'1' displays the index value(1)
echo "${!os[@]}" #'!' displays the index numbers
echo "${#os[@]}" #'#' displays the length of values

# while loop

#! /bin/bash
n=1
while [ $n -le 10 ]  # (( $n '<=' 10 ))
do
	echo "$n"
	n=$(( n+1 ))  #(( n++ )) , (( ++n ))
done


# sleep command
#! /bin/bash

n=5
while [ $n -le 10 ]
do
	echo "$n"
	n=$(( ++n )) # remove this line we get continuos number 5
	sleep 2 # sleep commnand is used to get the output slowly according to time
done

# read file by using while loop in three ways
#! /bin/bash

while read p
do
	echo $p
done < hello.sh

 OR

cat hello.sh | while read p
do
	echo $p
done


 OR

while IFS= read -r line
do
	echo $line
done < hello.sh

