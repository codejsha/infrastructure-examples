######################################################################

### install cli
VELERO_VERSION="1.6.3"

curl -LJO https://github.com/vmware-tanzu/velero/releases/download/v${VELERO_VERSION}/velero-v${VELERO_VERSION}-linux-amd64.tar.gz
tar -xzf velero-v${VELERO_VERSION}-linux-amd64.tar.gz
cd velero-v${VELERO_VERSION}-linux-amd64
sudo mv velero /usr/local/bin
sudo chown root:root /usr/local/bin/velero

### autocompletion
sudo yum install -y bash-completion
source <(velero completion bash)
sudo velero completion bash | sudo tee /etc/bash_completion.d/velero

######################################################################

velero backup-location get
velero backup get

velero backup create mybackup --include-namespaces test
velero backup create minio-backup --include-namespaces minio
--include-resources
--exclude-resources

velero backup describe mybackup
velero backup logs mybackup
velero backup delete mybackup
velero backup delete --all

velero restore get
velero restore create mybackup-restore1 --from-backup mybackup
velero restore describe mybackup-restore1
velero restore logs mybackup-restore1
velero restore delete mybackup-restore1
velero restore delete --all

velero schedule get
velero schedule create firstschedule --schedule="@every 1day" --include-namespcaes
velero schedule delete firstschedule
velero schedule delete --all
