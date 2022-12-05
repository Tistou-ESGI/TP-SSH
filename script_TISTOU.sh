#!/bin/bash


# Copier le fichier de configuration sur le serveur

cp config_files/ssh/sshd_config /etc/ssh/sshd_config

cp config_files/ssh/Banner /etc/Banner


# Redemarrer le service sshd 

systemctl restart sshd 

#Création d'un utilisateur


echo "INDIQUEZ le nom de l'utilisateur que vous souhaitez créer"
read username


useradd -d /home/$username $username

#Ajout du user aux membres sudo

adduser $username sudo

#autorisation pour le user d'utiliser la clé ssh

