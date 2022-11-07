#!/bin/bash

testResult="DingDaoOS-`date +%Y%m%d`.txt"
splitFile()
{
        file=$1
        [ $# -eq 1 ] && (csplit -z $file '/TestCase:/' '{*}' >/dev/null)

}

show()
{
        while true
        do
                echoYello "Is the result expected?"
                echo -e "===>Pick an action"
                echo -e "    p => set outcome to \033[32mpass\033[0m"
                echo -e "    f => set outcome to \033[31mfail\033[0m"
                #echo -e "    r =>\033[31mRerun the case \033[0m"
                #echo "\t s => set outcome to skip"
                #echo "\t r => re-run this job"
                echo -n "[pf]: "
                read  -r ans </dev/tty
                case $ans in
                        p)
                                echoGreen "Test case $testcase is passed"
                printf "%-20s ===> %-15s\n" $testcase passed >> $testResult
                                break
                                ;;
                        f)
                                echoRed "Test case $testcase is failed"
                printf "%-20s ===> %-15s\n" $testcase failed >> $testResult
                                break
                                ;;
                        *)
                                echoYello "Please input the correct choice,p or f"
                                continue
                                ;;
                esac
        done
}

echoGreen(){
        echo -e "\033[32m$@ \033[0m"
}


echoYello(){
        echo -e "\033[33m$@ \033[0m"
}


