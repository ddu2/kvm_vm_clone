#!/bin/bash
#
# Note: to use this script, all the templates must have string
#   'tpl' in their name, otherwise you need change 'tpl' to
#   the string that all templates have in common.
#
# created test vms can be deleted by following command:
#   # virsh undefine <domain name> --remove-all-storage
#
# date: 2016-06-14


echo "======"
virsh list --all | grep tpl | awk '{print $2}' | nl | sed 's/^   //g'
echo "======"

echo -e "Choose the template: \c"
read tpl_num

if [[ $tpl_num -lt 1 || $tpl_num -gt $(virsh list --all|grep tpl|wc -l) ]] ; then
    echo 'Please choose the right template'
    exit
fi


template=`virsh list --all | grep tpl | nl | sed -n ${tpl_num}p | awk '{print $3}'`

echo -e "Enter the new vm name: \c"
read vm_name

#echo $template, $vm_name
/usr/bin/virt-clone -o $template -n $vm_name --auto
