FROM ubuntu
# Set the working directory to /app
# WORKDIR /app

# Copy the current directory contents into the container at /app
# COPY . /app

# Install any needed packages specified in requirements.txt
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y net-tools
RUN apt-get install -y git g++ software-properties-common cmake maven openjdk-8-jdk
RUN add-apt-repository -y ppa:webupd8team/java && apt-get update && apt-get install -y junit ant java-wrappers
    
RUN cd && git clone https://github.com/barais/ESIRTPDockerSampleApp.git
RUN cd && git clone git://github.com/opencv/opencv.git
RUN cd ~/opencv && git checkout 3.4
RUN mkdir ~/opencv/build
RUN cd ~/opencv/build && cmake -DBUILD_SHARED_LIBS=OFF .. && make -j8

RUN cd ~/opencv/build && mvn install:install-file -Dfile=./bin/opencv-346.jar -DgroupId=org.opencv -DartifactId=opencv -Dversion=3.4.6 -Dpackaging=jar
RUN cd ~/ESIRTPDockerSampleApp && mvn package && java -Djava.library.path=/root/opencv/build/lib/ -jar target/fatjar-0.0.1-SNAPSHOT.jar
# Do not forget to update the path to your opencv install in Main.java

# Make port 80 available to the world outside this container
#EXPOSE 80

# Define environment variable
#ENV NAME World

# Run app.py when the container launches
#CMD ["python", "app.py"]

