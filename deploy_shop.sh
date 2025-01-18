# 给我带个参数，可以执行不同逻辑，如我输入java部署后台,使用vue部署前端

if [ $1 = "java" ]; then
    docker-compose stop zhian-shop
    docker-compose rm -f
    docker images | grep 'registry.cn-hongkong.aliyuncs.com/zla/zhian-shop' | grep '2.0' | awk '{print $3}' | xargs -r docker rmi
    docker pull registry.cn-hongkong.aliyuncs.com/zla/zhian-shop:2.0
    docker-compose up -d zhian-shop
fi
if [ $1 = "vue" ]; then
    tar -zxvf /home/admin/app/package.tgz 
    rm -rf /home/admin/app/package.tgz
    mkdir -p /var/www/zhian_shop
    rm -rf /var/www/zhian_shop/
    mv /home/admin/app/* /var/www/zhian_shop/
  


