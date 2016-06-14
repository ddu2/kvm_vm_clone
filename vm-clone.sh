#!/bin/bash

echo "======"
virsh list --all | grep tpl | awk '{print $2}' | nl | sed 's/^   //g'
echo "======"

echo -e "Choose the template: \c"
read tpl_num

template=`virsh list --all | grep tpl | nl | sed -n ${tpl_num}p | awk '{print $3}'`

echo -e "Enter the new vm name: \c"
read vm_name

#echo $template, $vm_name
/usr/bin/virt-clone -o $template -n $vm_name --auto
