FROM alpine:latest

# Install necessary packages
RUN apk update && \
    apk add --no-cache \
    xfce4 \
    novnc \
    xorg-server \
    xf86-video-fbdev \
    tigervnc \
    dbus \
    sudo \
    xinit \
    pulseaudio \
    alsa-utils \
    alsa-lib \
    pulseaudio-utils \
    bash \
    curl

# Set up the VNC session
RUN echo "xfce4-session" > ~/.xinitrc

# Set VNC password (you can change the password here)
RUN mkdir -p /root/.vnc && \
    echo "password" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Set the screen resolution to 1600x900
RUN echo "xrandr --output VGA-1 --mode 1600x900" >> ~/.xinitrc

# Expose the required ports (6080 for noVNC, 5901 for VNC server)
EXPOSE 6080 5901

# Start VNC server and noVNC (for browser access)
CMD ["sh", "-c", "vncserver :1 -geometry 1600x900 && novnc --vnc localhost:5901 --listen 6080"]
