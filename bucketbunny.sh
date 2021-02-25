#!/bin/bash

echo -e "
                                          .clc
   .oOKNWWWX0kl                       lkKNMMMMWX0o
  lWMMMMMMMMMMMNk.                  dXMMMMMMMMMMMMN'
 .MMMMMMMMMMMMMMMNc               .KMMMMMMMMMMMMMMMN
 lMMMMMMMWXK00KXWMMo             .NMMXK0O00XWMMMMMMM.
 .MMMMMMNOOOOOOOOXMM,            XMN0OOOOOOO0MMMMMM0
  .MMMMMKO0000OOOOKMN           :MN0OOO00K00OWMMMMd
    'MMMN0XXXXK0OOONM;          NM0OO0KXXXXK0MMMc
        lWNXXXXXK0OKMK         .MNOO0KXXXXNW.
            WWNXXKOOWM.        oMXO0XXXWM.
             ,MWXX0ONM:        WM00KXWM0
               MMXKOKM0       .MWO0XWMl
                MMXO0MM       :MNO0NMc
                 MW00MM.      xMNOXMo
                 .MWNMM'      0MMWMk
                  cMMMMxclllccNMMMW
                  dMMMMMMMMMMMMMMMX;
               :ONMMMMMMMMMMMMMMMMMMXk.
             '0MMMMMMMMMMMMMMMMMMMMMMMWO.
            :WMMMMMMMWMMMMMMMMMWWMMMMMMMN.
           .MMMMMMMMc  KMMMMMMo  OMMMMMMMN
           kMMMMMMMMXdkMMMMMMMNdxWMMMMMMMM:
           OMWNNNMMMMMMMM;..oMMMMMMMWXXXNW:
           ,NXXXXXMMMMMMMx';0MMMMMMMXXXXXX
            oXXXXNMWWWWWWWNNWWWWWNWMWNXXN'
             ,MMMMMMMMMMMMMMMMMMMMMMMMMM
               cMMMMMMMMMMMMMMMMMMMMMM.
                  oMMMMMMMMMMMMMMMM,
                         kMMc
"


input=$1

bucket=$(aws s3 ls s3://$input)

if echo "$bucket" | grep -q PRE; then
        echo -e "\e[92mBucket found \e[0m"
        echo -e "\e[92mListing bucket data... \e[0m"
        echo "$bucket"
fi
echo "Frogy_was_here" >> frogy.txt
aws s3 cp frogy.txt s3://$input
upload=$(aws s3 ls s3://$input)
if echo "$upload" | grep -q "frogy.txt"; then
        echo -e "\e[92mFile uploaded to the bucket successfully - Writable bucket \e[0m"
        echo -e "\e[92mListing bucket data... \e[0m"
        echo "$upload"
        else
        :
fi
rm frogy.txt
aws s3 rm s3://$input/frogy.txt
delete=$(aws s3 ls s3://$input)
if echo "$delete" | grep -q "frogy.txt"; then
        :
        else
        echo -e "\e[92mFile deleted successfully - Writable bucket \e[0m"
        echo -e "\e[92mListing bucket data... \e[0m"
        echo "$delete"
fi
