mkdir ~/.aws
mv config ~/.aws
mv credentials ~/.aws
sudo apt-get install -y emacs24 python-pip unzip
sudo pip install awscli
instanceid=$(curl http://169.254.169.254/latest/meta-data/instance-id)
aws ec2 attach-volume --volume-id $1 --instance-id $instanceid --device /dev/xvdf

