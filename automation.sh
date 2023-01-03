sudo apt update -y
sudo apt install apache2
sudo ufw allow 'Apache'
sudo systemctl start apache2
timestamp=`date +'%d%m%Y-%H%M%S'`

file="Divya-httpd-logs-$timestamp.tar" 
sudo tar -cvf $file /var/log/apache2/*.log
sudo mv *.tar /tmp/
s3_bucket="upgrad-divya"
sudo apt install awscli -y
sudo aws s3 \
	cp /tmp/$file \
	s3://$s3_bucket/$file
