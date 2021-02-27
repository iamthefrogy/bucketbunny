# Bucketbunny - Automation for open s3 bucket pocs for pentest/bugbounty/red-teamings
This is a simple bash script to automate a number of tasks for the open s3 bucket pocs.<br/><br/>
<img src="https://user-images.githubusercontent.com/8291014/109222405-9e149d80-77b1-11eb-97ea-873560055c4e.png" alt="Frogy" title="Frogy" height="700" />

+ **Logic**<br/>
<img src="https://user-images.githubusercontent.com/8291014/109382683-dd3e0e00-78d9-11eb-850d-8cdb80f84d12.jpg" alt="Frogy" title="Frogy" height="525" />

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
- ✅ ~~List bucket files~~
- ✅ ~~Upload file to bucket and verify~~
- ✅ ~~Delete file from bucket and verify~~
- ✅ ~~If bucket is not writable, provide custom error message~~
- ✅ ~~If bucket is not readable, provide custom error message~~
- ✅ ~~If no bucket found, provide custome error message~~
- Guessable objects
- Readable bucket policy
- Much more regarding S3 bucket enumeration and all the things we can do..

**Note**<br/>
<img src="https://user-images.githubusercontent.com/8291014/108618620-7327f380-7417-11eb-8f5a-2b462a820502.png" alt="Frogy" title="Frogy" height="40"/><br/>
This tool is in the very early phase of the development but trust me I have some great plans for this tool. So stay tuned.

**Warning:** This is just a research project. Kindly use it with caution and at your own risk. I won't be responsible for any misuse conduct.
