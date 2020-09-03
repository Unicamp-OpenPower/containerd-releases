github_version=$(cat github_version.txt)
#ftp_version=$(cat ftp_version.txt)
ftp_version=0.1.1
del_version=$(cat delete_version.txt)

if [ $github_version != $ftp_version ]
then
  cd $GOPATH/src/github.com
  mkdir containerd
  cd containerd
  git clone https://github.com/containerd/containerd.git
  cd containerd
  #git checkout v$github_version
  echo "make"
  make
  echo "make install"
  sudo make install
  echo "make release"
  sudo make release
  cd releases
  ls
  pwd

  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; cd /ppc64el/containerd/latest; mkdir containerd-$github_version"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /ppc64el/containerd/latest/containerd-$github_version ctr"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /ppc64el/containerd/latest/containerd-$github_version containerd"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /ppc64el/containerd/latest/containerd-$github_version containerd-stress"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /ppc64el/containerd/latest/containerd-$github_version containerd-shim"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /ppc64el/containerd/latest/containerd-$github_version containerd-shim-runc-v1"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; rm -rf /ppc64el/terraform/latest/containerd-$ftp_version"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; cd /ppc64el/containerd; mkdir containerd-$github_version"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /ppc64el/containerd/containerd-$github_version ctr"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /ppc64el/containerd/containerd-$github_version containerd"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /ppc64el/containerd/containerd-$github_version containerd-stress"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /ppc64el/containerd/containerd-$github_version containerd-shim"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; put -O /ppc64el/containerd/containerd-$github_version containerd-shim-runc-v1"
  #lftp -c "open -u $USER,$PASS ftp://oplab9.parqtec.unicamp.br; rm -rf /ppc64el/containerd/containerd-$del_version"
fi
