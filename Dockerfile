#uses the latest ubuntu release
FROM ubuntu:latest
#updates the ubuntu 
RUN apt-get update
#installs vim and nginx
RUN apt install -y nginx vim
#copies hine_app.sh/ hine_app.sh from home dir
COPY hine_app.sh /hine_app.sh
#converts the app.sh into an executeable file
RUN chmod +x /hine_app.sh && /hine_app.sh
#opens port 80 
EXPOSE 80
#starts nginx uses global seperator and then turns the daemon off. 
CMD ["nginx", "-g", "daemon off;"]
#shout out to Rafael for the help on this!


