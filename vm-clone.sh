#!/bin/bash

echo "======"
virsh list --all | grep tpl | awk '{print $2}' | nl | sed 's/^   //g'
echo "======"
echo -e "Choose the template: \c"
#read template
read tpl_num

case $tpl_num in
    "1") template="a00-rhel65-tpl" ;;
    "2") template="a00-rhel67-tpl" ;;
    "3") template="a00-rhel72-atomic-tpl" ;;
    "4") template="a00-rhel72-tpl" ;;
    * )  echo "Please enter [1..4]."; exit;;
esac

echo -e "Enter the new vm name: \c"
read vm_name

/usr/bin/virt-clone -o $template -n $vm_name --auto
