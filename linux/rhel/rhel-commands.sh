######################################################################

subscription-manager register --username $YOUR_REDHAT_ID
subscription-manager register --username $YOUR_REDHAT_ID --password $PASSWORD
subscription-manager attach --auto

rhc connect --username $YOUR_REDHAT_ID --password $PASSWORD

######################################################################

subscription-manager status
subscription-manager list

subscription-manager repos --list-enabled

######################################################################
