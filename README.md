# docker-jupyter-notebook-py
Files for building the Guild Jupyter notebook Docker container and deploying the container on AWS. 

### Deployment Instructions
The following instructions are for OSX/*nix systems.  

1. Clone this repository.  
2. On your local machine, install Docker and Docker Machine https://docs.docker.com/machine/install-machine/  
3. On your local machine, define the environment variables and aliases that are listed in the file env_variables_and_aliases
4. Through the AWS console, define the AWS security group "docker-machine"
   * SSH inbound, All traffic outbound
5. Create an AWS instance
   * Run 'dm-create-aws \<instance name\>' on your local machine to launch a VM on AWS  
   * Run 'dm-env \<instance name\>' on your local machine to configure the environment variables in your shell enabling access to the VM  
6. Build the Docker container  
   * Run 'docker build -t jupyter-notebook-py .' on your local machine in the container subdirectory within the cloned repository  
