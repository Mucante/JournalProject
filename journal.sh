#!/bin/bash

JournalPath=./journalentries/
currentpassword=$( cat currentpass )

 dialog --title 'Journal' --msgbox "Welcome to the journal " 8 30

       trypassword=$( dialog --title 'Password' --inputbox "Please enter your password for the journal:" 10 30 3>&1 1>&2 2>&3 3>&- )
              
 if [ $trypassword == $currentpassword ]
 then 


 choosejob=$( dialog --menu 'Please pick your operation' 10 30 3 1 AddEntry 2 ReadEntry 3 Password 3>&1 1>&2 2>&3 3>&- )
 
   if [ $choosejob == '1' ]
     then

       choosedate=$( dialog --title 'Add' --inputbox "Choose the date of your entry in dd-mm-yyyy format: " 9 40 3>&1 1>&2 2>&3 3>&- )
       writinglog=$( dialog --title 'Add' --inputbox "You can enter the text now: " 9 40 3>&1 1>&2 2>&3 3>&- )
       echo "${writinglog}" > $JournalPath$choosedate.txt
       dialog --title 'Journal' --msgbox "Journal log has been saved. " 8 30
   exit
  
   elif [ $choosejob == '2' ]
     then

       ls journalentries > listofentries
       dialog --title 'List of Entries' --textbox listofentries 10 50
       chosenlog=$( dialog --title 'Information' --inputbox 'Enter the date of the journal you wish to read. Dont forget to enter the date in dd-mm-yyyy format: ' 12 40 3>&1 1>&2 2>&3 3>&- )
       thelog=$( cat $JournalPath$chosenlog.txt )
       dialog --title $chosenlog --msgbox "${thelog}" 10 40
   exit

   elif [ $choosejob == '3' ]
     then
       Psword=$( dialog --title 'Password' --inputbox "Please create/change the password for the journal:" 10 30 3>&1 1>&2 2>&3 3>&- )
       echo $Psword > currentpass
       dialog --title 'Password' --msgbox "Your password have been saved " 8 30
   exit
     
   fi

 else
  dialog --title 'Journal' --msgbox "You entered a wrong password." 8 30
 fi

