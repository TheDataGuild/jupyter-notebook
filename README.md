# docker-jupyter-notebook-py
Files for building the Guild Jupyter notebook Docker container and deploying the container on AWS. 

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
   * SSH inbound, All traffic outbound
5. Create an AWS instance
   * Run ```source configure_ec2_instance.sh \<instance name\>``` on your local machine to launch a VM on AWS  
6. Build the Docker container  
   * Run ```docker build -t jupyter-notebook-py .``` on your local machine in the container subdirectory within the cloned repository  
7. Attach the EBS volume to the VM  
   * Run ```docker-machine ssh \<instance name\>``` to SSH into the VM  
   * Run ```source config_ebs_vol.sh``` on the VM to mount the EBS volume   
   * Logout of the VM  
8. Run the notebook container  
   * Run ```docker-nb \<notebook password\>``` on your local machine  
9. Establish the SSH tunnel to the VM  
   * Install autossh http://linux.die.net/man/1/autossh. Available through macports for OSX.  
   * Run ```dm-nb-tunnel \<instance name\>``` to establish the tunnel. The tunnel will automatically restart as you disconnect and reconnect your local machine to networks.  

### Helpful Commands  
```dm```:                         Command list for docker-machine  
```dm start \<instance name\>```: Starts the specified VM  
```dm stop \<instance name\>```:  Stops the specified VM  
