#!/usr/bin/env bash
github_version=$(cat github_version.txt)
github_version=1.4.3
ftp_version=$(cat ftp_version.txt)
LOCALPATH=$GOPATH/src/github.com/containerd/containerd/releases

if [ $github_version != $ftp_version ]
then
  git clone https://$USERNAME:$TOKEN@github.com/Unicamp-OpenPower/repository-scrips.git
  cd repository-scrips/
  chmod +x empacotar-containerd-deb.sh
  chmod +x empacotar-containerd-rpm.sh
  sudo mv empacotar-containerd-deb.sh $LOCALPATH
  sudo mv empacotar-containerd-rpm.sh $LOCALPATH
  cd $LOCALPATH
  sudo ./empacotar-containerd-deb.sh containerd-$github_version.linux-ppc64le.tar.gz $github_version
  sudo ./empacotar-containerd-rpm.sh containerd-$github_version.linux-ppc64le.tar.gz $github_version

  lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /repository/debian/ppc64el/containerd/ $LOCALPATH/containerd-$github_version-ppc64le.deb"
  sudo lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /repository/rpm/ppc64le/containerd/ ~/rpmbuild/RPMS/ppc64le/containerd-$github_version-1.ppc64le.rpm"
fi
