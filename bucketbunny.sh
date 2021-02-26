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
bucket=$(aws s3 ls s3://$1 --recursive --summarize 2>&1)

if echo "$bucket" | grep -q "Total Objects"; then
        echo -e "\e[92mBucket found \e[0m"
        echo -e "\e[92mListing bucket data... \e[0m"
        echo "$bucket"
        echo "Frogy_was_here" >> frogy.txt

        ######################################## Uploading frogy.txt file on the bucket ########################################

        echo -e "\e[92mUploading frogy.txt to the bucket... \e[0m"
        aws s3 cp frogy.txt s3://$1 &>/dev/null
        upload=$(aws s3 ls s3://$1 --recursive --summarize 2>&1)

                if echo "$upload" | grep -q "frogy.txt"; then
                        echo -e "\e[92mFile uploaded to the bucket successfully - Writable bucket \e[0m"
                        echo -e "\e[92mListing bucket data... \e[0m"
                        echo "$upload"

        ######################################## Deleting frogy.txt file on the bucket ########################################

                        echo -e "\e[92mDeleting frogy.txt to the bucket... \e[0m"
                        aws s3 rm s3://$1/frogy.txt &>/dev/null
                        echo -e "\e[92mFile deleted from the bucket successfully - Writable bucket \e[0m"
                        delete=$(aws s3 ls s3://$1 --recursive --summarize 2>&1)
                        echo -e "\e[92mListing bucket data... \e[0m"
                        echo "$delete"
                        rm frogy.txt
        else
                        if aws s3 cp frogy.txt s3://admin.istox.com 2>&1 | grep -q "AccessDenied"; then
                        echo -e "\e[92mFile cannot be uploaded to the bucket - Bucket is readable but not writable... \e[0m"
                        rm frogy.txt
                        else
                        echo -e "\e[91mUnknown error...Contact Author @iamthefrogy.  \e[0m"
                        rm frogy.txt
                        fi
        fi

else
                if echo "$bucket" | grep -q "NoSuchBucket"; then
                        echo -e "\e[92mBucket does not exist. \e[0m"
                else
                        if echo "$bucket" | grep -q "AccessDenied"; then
                                echo -e "\e[92mBucket is not readable. \e[0m"
                        else
                        echo "Unknown error"
                        fi
                fi
fi
