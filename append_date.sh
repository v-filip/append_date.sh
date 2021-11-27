#!/bin/bash
#Author: v-filip
#Purpose: This script will rename all the files with a user specifed extention to include today's date or user selected date.

echo "Hello! This script will rename all the files with a specified extention to include today's date or a specfied date"

read -p "Please enter the file extention (.jpg): " FILE_EXT

function rename_file_date_auto () {
        local DATE=$(date +%Y-%m-%d%n)
        ls *${FILE_EXT} &> /dev/null
                if [ "$?" = "2" ]
                then
                        echo "It appears that there are no files with $FILE_EXT extention!"
                        exit 1
                else
                        for FILE in *${FILE_EXT}
                        do
                                echo "Renaming the file ${FILE}!"
                                mv $FILE ${DATE}-${FILE}
                        done
                        exit 0
                fi
}

function rename_file_date_specified () {
        ls *${FILE_EXT} &> /dev/null
        if [ "$?" = "2" ]
        then
                echo "It appears that there are no files with $FILE_EXT extention!"
                exit 1
        else
                for FILE in *${FILE_EXT}
                do
                        echo "Renaming the file ${FILE}!"
                        mv $FILE ${DATE_SPECIFIED}-${FILE}
                done
                exit 0
        fi
}

read -p "Would you like to use today's date? (y/n): " DATE_ANSWER

if [ $DATE_ANSWER = "y" ]
then
        rename_file_date_auto
        exit 0
elif [ $DATE_ANSWER = "n" ]
then
        read -p "Please enter the date that you'd like to use (ex. DD-MM-YYYY): " DATE_SPECIFIED
        rename_file_date_specified
        exit 0
else
        echo "It looks like your answer is neither y or n. Please rerun the script!"
        exit 1
fi
