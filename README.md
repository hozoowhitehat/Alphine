# Alphine

git clone https://github.com/hozoowhitehat/Alphine

cd Alphine

docker build -t alpine-novnc .


docker run -it -p 6080:6080 -p 5901:5901 --name alpine-novnc alpine-novnc


http://localhost:6080


pulseaudio --check


docker run -it -p 6080:6080 -p 5901:5901 --name alpine-novnc \
   -v /run/user/$(id -u)/pulse:/run/user/$(id -u)/pulse \
   alpine-novnc


  # FIX ERROR NOVNC

  ENV PULSE_SERVER=unix:/run/user/1000/pulse/native

  docker logs alpine-novnc
  
