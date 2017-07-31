# jupyter-notebook
Files for building the Guild Jupyter notebook Docker image and deploying the image on AWS. 

### Deployment Instructions
The following instructions are for OSX/Linux systems.  

1. Clone this repository  
2. On your local machine, install Docker and Docker Machine https://docs.docker.com/machine/install-machine/  
3. Make a copy of env_variables_and_aliases.template  
   ```
   cp env_variables_and_aliases.template env_variables_and_aliases
   ```
   and edit env_variables_and_aliases to define the environment variables and aliases. Source this file in your local shell.  
4. Through the AWS console, define the AWS security group "docker-machine"  
   * SSH inbound, Port 2376 inbound, All traffic outbound
5. Create an AWS instance
   * Run ```source launch_instance.sh \<instance name\>``` on your local machine
6. Modify the hashed notebook password in the Dockerfile as necessary
7. Build the Docker image
   * Run ```docker build -t jupyter-notebook container/``` on your local machine
8. Run the notebook container  
   * Run ```docker-nb``` on your local machine
9. Establish the SSH tunnel to the VM  
   * Run ```dm-nb-tunnel \<instance name\>``` to establish the tunnel
10. Open ```http://localhost:8888``` in a web browser.

### Helpful Commands  
```dm```:                         Command list for docker-machine  
```dm start \<instance name\>```: Starts the specified VM  
```dm stop \<instance name\>```:  Stops the specified VM  
