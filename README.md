# docker-jupyter-notebook-py
Files for building the Guild Jupyter notebook Docker container and deploying the container on AWS. 

### Deployment Instructions
The following instructions are for OSX/*nix systems.  

1. Clone this repository.  
2. On your local machine, install Docker and Docker Machine https://docs.docker.com/machine/install-machine/  
3. On your local machine, define the following environment variables and aliases:  
   * export AWS_ACCESS_KEY_ID=\<access key ID\>  
   * export AWS_SECRET_ACCESS_KEY=\<secret access key\>  
   * export AWS_VPC_ID=\<VPC ID\>  
   * export AWS_INSTANCE_TYPE=\<instance type - ex: c3.8xlarge\>  
   * export AWS_DEFAULT_REGION=\<AWS region - ex: us-west-2\>  
   * export AWS_SECURITY_GROUP=docker-machine  
   * export AWS_EBS_VOL=\<EBS volume ID\>  
   * alias dm=docker-machine  
   * alias dm-create-aws="dm create --driver amazonec2 \  
                               --amazonec2-access-key $AWS_ACCESS_KEY_ID \  
                               --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \  
                               --amazonec2-vpc-id $AWS_VPC_ID \  
                               --amazonec2-instance-type $AWS_INSTANCE_TYPE \  
                               --amazonec2-region $AWS_DEFAULT_REGION \  
                               --amazonec2-security-group $AWS_SECURITY_GROUP"
   * dm-env() {  
         eval "$(docker-machine env $1)"  
     }  
   * dm-nb-tunnel() {  
         autossh -M 8889 -f -i ~/.docker/machine/machines/$1/id_rsa -N -L 8888:localhost:8888 ubuntu@$(docker-machine ip $1)  
     }  
   * docker-nb() {  
         docker run -d -p 8888:8888 -e "PASSWORD=$1" -v /data:/notebooks jupyter-notebook-py  
     }  
4. Through the AWS console, define the AWS security group "docker-machine"
   * SSH inbound, All traffic outbound
5. Create an AWS instance
   * Run 'dm-create-aws \<instance name\>' on your local machine to launch a VM on AWS  
   * Run 'dm-env \<instance name\>' on your local machine to configure the environment variables in your shell enabling access to the VM  
6. Build the Docker container  
   * Run 'docker build -t jupyter-notebook-py .' on your local machine in the container subdirectory within the cloned repository  
