<h1>About the Project</h1>
As part of your company's expansion into the e-learning sector, we've been assigned the task of creating a comprehensive e-learning platform. Our objective is to develop a scalable and user-friendly solution that caters to the diverse needs of our target audience.
<h2>Description</h2>
Our developers have written the code for the e-learning platform, ensuring it's robust and user-friendly. Meanwhile, our DevOps team has created a Dockerfile to package the application into a Docker image for easy deployment. Once the image is built, it's pushed to a Docker registry, allowing us to manage and distribute it efficiently. Finally, we've exposed the platform through a specific port to make it accessible to users.
<h2>Getting Started</h2>
This is an example of how you may give instructions on setting up your project locally. To get a local copy up and running follow these simple example steps.
<h3 dir="auto" tabindex="-1">Prerequisites</h3>
<ul>
 	<li>Docker</li>
</ul>
Before starting your project setup, ensure that Docker is installed on your system. Docker is required to manage containers and dependencies for your project environment.
<h3>Installation</h3>
Below is the script to install Docker on your system, taken from <a href="https://get.docker.com/" target="_new">https://get.docker.com</a>:
<pre class="EnlighterJSRAW" data-enlighter-language="generic">curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh</pre>
<strong>Step 1: Clone the git Repository</strong>
<pre class="EnlighterJSRAW" data-enlighter-language="generic">git clone https://github.com/k21academyuk/K21-webpage.git</pre>
<strong>Step 2: Create a Dockerfile</strong>

A Dockerfile is a text document that<strong> contains instructions for building a Docker image.</strong> Docker uses these files to automate the process of creating containerized applications.
<pre class="EnlighterJSRAW" data-enlighter-language="generic">cd K21-webpage
vi Dockerfile</pre>
Add the all the commands that a user could call on the command line to assemble an image.
<pre class="EnlighterJSRAW" data-enlighter-language="generic"># Use the official Ubuntu base image
FROM ubuntu

# Add metadata to the image
LABEL creator="K21Academy"

# Update package lists
RUN apt-get update

# Install NGINX
RUN apt-get install -y nginx

# Copy application files into the container's NGINX HTML directory
COPY MiniProject1 /var/www/html/

# Expose port 80 to allow outside connections
EXPOSE 80

# Command to start NGINX server in the foreground
CMD ["nginx", "-g", "daemon off;"]</pre>
<strong>Step 3: Build Docker Image</strong>

To build a Docker image from the Dockerfile, run the following command:
<pre class="EnlighterJSRAW" data-enlighter-language="generic">docker build -t my-nginx-image .
docker images</pre>
<strong>Step 4: Push the Docker Image to Docker Hub</strong>
<ol>
 	<li>Login to you Dockerhub user <code>docker login</code> command</li>
 	<li>Tag the image with your Docker Hub repository name in order to push it to Docker Hub.</li>
</ol>
<pre class="EnlighterJSRAW" data-enlighter-language="generic">docker tag nginx-app &lt;username&gt;/web-app:1.0 //Syntax
docker tag nginx-app k21academy/web-app:1.0</pre>
<strong>Step 5: Running a Container and Exposing it to a Specific Port</strong>

Once the Docker image has been successfully built and pushed to the registry, the next step is to run a container from this image and expose it to a specific port. Here's how we accomplish this:
<pre class="EnlighterJSRAW" data-enlighter-language="generic">docker run -dit -p &lt;host_port&gt;:&lt;container_port&gt; &lt;image_name&gt;:&lt;tag&gt;
docker run -dit -p 2402:80 k21academy/web-app:1.0</pre>
<strong>Step 6: Access the Application</strong>:

Finally, you can access your application by navigating to <strong>http://&lt;publicip&gt;:2402</strong>
