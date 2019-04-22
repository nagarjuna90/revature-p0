#!/bin/bash
username=$1
passcode=$2
userdisplayname=$3
userprincipalname=$userdispalyname@$domain
DOMAIN=pallepegasiangmail.onmicrosoft.com
random=${time}
usersubcription=$4
role=$5

admin=$(az role assignment list --include-classic-administrators --query "[?id=='NA(classic admins)'].principalName" | grep -E $username)
if ! [ -z $admin ]; then
        echo "cannot delete admin"
        exit 1
 fi
    
#create user if he doesn't exists

result=$(az ad user list --query [].userprincipalName | grep -E $userprincipalname)

 if [ -n result ]; then

 az ad user create --display-name $userdisplayname --user-principal-name  $userprincipalname --force-change-password-next-login  --password $random --subscription $usersubcription
 echo "user created"
 fi

 #Delete if he exists

 if [ -z $result ]; then
echo "the user does not currently exist"
fi
az ad user delete --upn-or-object-id $userprincipalname 
echo "user deleted"

#Assignment creation 
 
 if [ $role != "reader" ] && [ $role != "contributor" ]; then 
        echo "not valid role"
    fi

 az role assignment create --assignee $userprincipalname --role $role

exit 0