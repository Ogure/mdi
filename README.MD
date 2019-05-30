# Docker App - ESIR 2 IN - PIPELIN & KERBIRIOU 

Ce repo github contient le TP réalisé dans le cadre de la matière MDI. Il s'agit d'un dockerfile permettant l'installation de d'une application Java dont la source est sur ce [github](https://github.com/barais/ESIRTPDockerSampleApp)

# Prérequis
Il est préférable d'utiliser un **linux** (type Ubuntu), Windows ne supportant Docker que dans sa versions "Pro". 
Il est nécessaire d 'avoir au moins **10Go** de libre sur ça machine avant l’exécution.

# Installation
## Installation Docker

Pour installer Docker sur sa machine, suivre [ce tutoriel](http://olivier.barais.fr/blog/posts/teaching/istic/m2/french/2018/09/10/Operation_portable_M2_ISTIC.html).

## Installation de l'app

    git clone $this repo$
    cd $this repo$
    sudo docker build -t appdocker .


# Troubleshoot

> Beaucoup de problèmes se sont passés lors du développement, comme un cassage de vm et une impossibilité de développer sur les machines de l'istic car elles ne possèdent pas assez d'espace sur le disque
> Par ailleurs, *oracle-java8-installer* qui fait partie des librairies requises vient tout juste de ne plus être soutenue.
> La commande aurait été `add-apt-repository -y ppa:webupd8team/java && apt-get update && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && apt-get install -y oracle-java8-installer` c.f. [Communication Oracle](https://launchpad.net/~webupd8team/+archive/ubuntu/java).
