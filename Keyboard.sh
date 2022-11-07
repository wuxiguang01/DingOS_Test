#bin/bash

. Tool.sh
rm -fr xx*
component="keyboard"
hh="xx00"
splitFile keyboard.txt



main()
{


    for testCase in $(ls xx*);do
        case=$(head -1 $testCase|awk -F ":" '{print $2}' |sed 's/ //')
        com=$(cat $testCase|grep "Command" |awk -F'"' '{print $2}'|sed 's/^ \+//')
        testcase="$component/$case"
        echo "---------------------------------------$testcase-------------------------------------------" 
 	    cat $testCase|grep -v "Command"

	    if [ $testCase == "xx00" ]
	    then
		 read -p "请输入0-9数字:" num
		 echo $num
	 elif [ $testCase == "xx01" ]
	 then
	    read -p "请输入a-z字母:" num1
	    echo $num1
   	 elif [ $testCase == "xx03" ] 
    	 then
	    read -p "请输入abcABC:" num2
	    echo $num2

	    fi

 	    [[ -z $com ]] && show || command $com

    done
    rm -fr xx*
}

main
