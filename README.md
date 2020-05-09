## PreRequisites
1. Docker Engine 1.13.1+
2. AWS S3 Bucket Setup
3. AWS credentials with S3 access
   1. AWS_ACCESS_KEY_ID
   2. AWS_SECRET_ACCESS_KEY
   3. AWS region
   4. AWS bucket


## Installation

#### Setup Environment Variables
Copy paste the environment variables from the `.env.sample` file into a new `.env` file.
```
cp .env.sample .env
```
Then enter the storage Adapter ( S3 ) variables as obtained from AWS. You can remove any optional variables that you are NOT using

#### Build / Setup
```
docker-compose build
```

#### Start Environment
```
docker-compose up
```

## Access Site

Access Site on local
```
http://localhost:8080
```

Access Admin Section
```
http://localhost:8080/ghost
```