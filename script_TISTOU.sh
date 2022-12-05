#!/bin/bash


# Copier le fichier de configuration sur le serveur

cp ./config__files/ssh/sshd_config /etc/ssh/sshd_config

cp ./config__files/ssh/Banner /etc/Banner


# Redemarrer le service sshd 

systemctl restart sshd 

#Création d'un utilisateur


echo "INDIQUEZ le nom de l'utilisateur que vous souhaitez créer"
read username

echo "INDIQUEZ le mdp de l'utilisateur"
read passwd

useradd -d /home/$username -p $passwd $username

#Ajout du user aux membres sudo

usermod -aG sudo $username 

#autorisation pour le user d'utiliser la clé ssh

#on créé les repertoires du nouveau user
mkdir /home/$username
mkdir /home/$username/.ssh
#on copie la clé utilisée par ubuntu
cp /home/ubuntu/.ssh/authorized_keys /home/$username/.ssh/authorized_keys

#on met le user propriétaire du  fichier contenant la clé 
chown -R $username:$username /home/$username/.ssh/
