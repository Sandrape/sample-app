#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" >> tempdir/Dockerfile2
echo "RUN pip install flask" >> tempdir/Dockerfile2
echo "COPY  ./static /home/myapp/static/" >> tempdir/Dockerfile2
echo "COPY  ./templates /home/myapp/templates/" >> tempdir/Dockerfile2
echo "COPY  sample_app.py /home/myapp/" >> tempdir/Dockerfile2
echo "EXPOSE 5050" >> tempdir/Dockerfile2
echo "CMD python /home/myapp/sample_app.py" >> tempdir/Dockerfile2

cd tempdir
docker build -t sampleapp .
docker run -t -d -p 5050:5050 --name samplerunning2 sampleapp
docker ps -a 
