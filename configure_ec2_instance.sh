docker-machine create --driver amazonec2 \
          --amazonec2-access-key $AWS_ACCESS_KEY_ID \
          --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
          --amazonec2-vpc-id $AWS_VPC_ID \
          --amazonec2-instance-type $AWS_INSTANCE_TYPE \
          --amazonec2-region $AWS_DEFAULT_REGION \
          --amazonec2-security-group $AWS_SECURITY_GROUP $1
eval "$(docker-machine env $1)"
printf "[default]\naws_access_key_id=$AWS_ACCESS_KEY_ID\naws_secret_access_key=$AWS_SECRET_ACCESS_KEY\n" > credentials
printf "[default]\nregion=$AWS_DEFAULT_REGION\n" > config
docker-machine scp credentials $1:credentials
docker-machine scp config $1:config
docker-machine scp final_config.sh $1:final_config.sh
docker-machine ssh $1 "source final_config.sh $AWS_EBS_VOL"
docker-machine scp mount_ebs_vol.sh $1:mount_ebs_vol.sh
rm credentials
rm config