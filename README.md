<h2>Simple Docker Webapp (AWS-Router53 & EC2,Docker,CertBot,Nginx,Nginx Reverse Proxy,Domain-Freenom)</h2>

1. First create a ec2 instance (Ubuntu) with SG allowing ports 80,443,8081,8082

2. Install Docker, Nginx (For Nginx Reverse Proxy)on the EC2 Instance and register a free domain on Freenom

3. Create a basic html page , run a nginx container on ec2 instance and use the html page

   ```sh
   docker run --name nginx -v /data/www/:/usr/share/nginx/html:ro -d -p 8081:80 nginx
   ```

4. Edit the freenom domain nameservers to use that of route53 also create a www <b>A</b> record in route53 and create a nginx reverse proxy config in the <b>/etc/nginx/conf.d</b> for the www record with the filename <b>Ex: www.yourdomain.ga.conf</b> and restart nginx service

5. Install certbot and select the domain to get ssl certificate for.

6. Now you can access the First container directly via domain 
![Screenshot from 2022-07-26 14-12-39](https://user-images.githubusercontent.com/49603066/180968583-e43d7674-5479-4933-a1de-597c4ae114cb.png)


7. Create a Docker image using the <b>Dockerfile</b> and run another container on port 8082 using the image created also create another <b>A</b> record in router53 for the second container <b>Ex: web.yourdomain.ga</b>

8. Create another Nginx reverse proxy conf in the <b>/etc/nginx/conf.f/</b> for the second <b>A</b> record <b>Ex: web.yourdomain.ga.conf</b> and restart the nginx service.

9. Run the CertBot command again and select the second domain to get certificate for it. Now you can access the second container/webapp directly via the new subdomain 
![Screenshot from 2022-07-26 14-12-59](https://user-images.githubusercontent.com/49603066/180970506-df2cf166-0ee7-4db3-b967-0a776e4e05dd.png)
