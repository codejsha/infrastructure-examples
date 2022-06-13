######################################################################

kubectl api-versions

kubectl top nodes
kubectl top pods

kubectl create --recursive --filename resource.yaml

cat <<EOF | kubectl apply --filename -
EOF

cat <<EOF | kubectl create --filename -
EOF
