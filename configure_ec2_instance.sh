docker-machine create --driver amazonec2 \
          --amazonec2-access-key $AWS_ACCESS_KEY_ID \
          --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
          --amazonec2-vpc-id $AWS_VPC_ID \
          --amazonec2-ami $AWS_AMI_ID \
          --amazonec2-instance-type $AWS_INSTANCE_TYPE \
          --amazonec2-region $AWS_DEFAULT_REGION \
          --amazonec2-root-size 40 \
          --amazonec2-security-group $AWS_SECURITY_GROUP $1
eval "$(docker-machine env $1)"
docker-machine scp final_config.sh $1:final_config.sh
docker-machine ssh $1 "source final_config.sh"
docker-machine ssh $1 "rm final_config.sh"
docker-machine scp -r ipython_config/ $1:/data/ipython_config/
