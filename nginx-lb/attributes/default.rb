default["nginx-lb"]["role"]    = "lb"
default["nginx-lb"]["cluster"] = ["Fruitkid", "Fruitkid Playground", "EasyBib Playground", "EasyBib"]
default["nginx-lb"]["dir"]     = "/etc/nginx"
default["nginx-lb"]["int_ip"]  = "127.0.0.1"
default["nginx-lb"]["user"]    = "www-data"
