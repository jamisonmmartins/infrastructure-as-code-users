#!/bin/bash

#*** GRUPOS ***
echo "Criando Grupos ..."
echo ""

#comando para criar grupo GRP_ADM
groupadd GRP_ADM

#comando para criar grupo GRP_VEN
groupadd GRP_VEN

#comando para criar grupo GRP_SEC
groupadd GRP_SEC


#*** USUARIOS  ***
echo ""
echo "Criando usuários ..."
echo ""

#Usuários do grupo GRP_ADM
#carlos
useradd carlos -m -c "Carlos" -s /bin/bash -G GRP_ADM -p $(openssl passwd -6 123)
passwd carlos -e

#maria
useradd maria -m -c "Maria" -s /bin/bash -G GRP_ADM -p $(openssl passwd -6 123)
passwd maria -e

#joao
useradd joao -m  -c "João" -s /bin/bash -G GRP_ADM -p $(openssl passwd -6 123)
passwd joao -e

#Usuários do grupo GRP_VEN
#debora
useradd debora -m  -c "Débora" -s /bin/bash -G GRP_VEN -p $(openssl passwd -6 123)
passwd debora -e

#sebastiana
useradd sebastiana -m -c "Sebastiana" -s /bin/bash -G GRP_VEN -p $(openssl passwd -6 123)
passwd sebastiana -e

#roberto
useradd roberto -m -c "Roberto" -s /bin/bash -G GRP_VEN -p $(openssl passwd -6 123)
passwd roberto -e

#Usuários do grupo GRP_sec
#josefina
useradd josefina -m -c "Josefina" -s /bin/bash -G GRP_SEC -p $(openssl passwd -6 123)
passwd josefina -e

#amanda
useradd amanda -m -c "Amanda" -s /bin/bash -G GRP_SEC -p $(openssl passwd -6 123)
passwd amanda -e

#rogerio
useradd rogerio -m -c "Rogerio" -s /bin/bash -G GRP_SEC -p $(openssl passwd -6 123)
passwd rogerio -e


#*** DIRETORIOS ***
echo ""
echo ""
echo "Criando diretórios"
echo ""

mkdir -p /home/publico /home/ven /home/sec /home/adm -v

echo ""
echo ""
echo "Especificando permissões..."

#permissão total para /home/publico
chmod 777 /home/publico

#permissão restrita aos respectivos grupos
chmod 770 /home/ven /home/sec /home/adm
chown root:GRP_VEN /home/ven
chown root:GRP_SEC /home/sec
chown root:GRP_ADM /home/adm

echo ""
echo "**** Fim do cadastro ****"
echo ""

echo ""
echo "Lista de grupos recém cadastrados"
cat /etc/group | grep GRP_VEN
cat /etc/group | grep GRP_SEC
cat /etc/group | grep GRP_ADM

echo ""
echo ""

echo "Lista de diretórios recém criados"
echo ""

ls -l /home | grep ven
ls -l /home | grep sec
ls -l /home | grep adm
ls -l /home | grep public
ls -l /home | grep carlos
ls -l /home | grep maria
ls -l /home | grep joao
ls -l /home | grep debora
ls -l /home | grep sebastiana
ls -l /home | grep roberto
ls -l /home | grep josefina
ls -l /home | grep amanda
ls -l /home | grep rogerio

echo ""
echo ""
echo "Lista de usuários recém cadastrados"
echo ""

cat /etc/passwd | grep carlos
cat /etc/passwd | grep maria
cat /etc/passwd | grep joao
cat /etc/passwd | grep debora
cat /etc/passwd | grep sebastiana
cat /etc/passwd | grep roberto
cat /etc/passwd | grep josefina
cat /etc/passwd | grep amanda
cat /etc/passwd | grep rogerio

echo ""
echo ""
echo "**** Fim da consulta ****"
echo ""
