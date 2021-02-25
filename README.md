# Bucketbunny - Automation for open s3 bucket pocs for pentest/bugbounty/red-teamings
This is a simple bash script to automate a number of tasks for the open s3 bucket pocs.<br/><br/>
<img src="https://user-images.githubusercontent.com/8291014/109222405-9e149d80-77b1-11eb-97ea-873560055c4e.png" alt="Frogy" title="Frogy" height="600" />

+ **Installation**
    ```sh
    git clone https://github.com/iamthefrogy/bucketbunny.git
    cd bucketbunny
    chmod +x bucketbunny.sh
    ```
+ **Usage**
    ```sh
    ./bucketbunny.sh s3_bucket_name
    ```
    
**TODO**
- ✅  ~~List bucket files~~
- ✅  ~~Upload file to bucket and verify~~
- ✅  ~~Delete file from bucket and verify~~
- If bucket is not writable, provide custom error message
- If bucket is not readable, provide custom error message
- If no bucket found, provide custome error message

**Warning:** This is just a research project. Kindly use it with caution and at your own risk. I won't be responsible for any misuse conduct.
