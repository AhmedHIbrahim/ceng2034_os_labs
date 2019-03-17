#important libraries
import os,shutil
try:
   #Deleting the jailroot if exists 
   if os.path.isdir('./jailroot'):
       os.system('rm -r jailroot')
   #If not !!
   if not os.path.isdir('./jailroot'):
           #Creation of the inner script
  	   f = open("inner_script.sh","w+")
	   f.write('#!/bin/bash \n echo "Hello World"')
	   f.close()
	   
           #Accessing home directory and creating the jailroot
           os.environ.get('HOME')
	   os.mkdir('jailroot')
	   os.chdir('./jailroot')

           #Making important directories inside of the jailroot	   
           os.mkdir('bin')
	   os.makedirs('lib/')
	   os.mkdir('lib64')
           #Copy the inner script inside of the jailroot
           os.system('cp ../inner_script.sh .')
	   
           #Copying important files and libraries to jailroot	   
	   shutil.copytree('/etc/ssh' , './etc/')
	   shutil.copy('/bin/bash','./bin/')
	   shutil.copy('/bin/ls','./bin/')
	   shutil.copy('/bin/chmod','./bin/')
	   shutil.copy('/bin/sh','./bin/')
	   shutil.copy('/bin/sh.distrib','./bin/')
	   shutil.copytree('/lib/x86_64-linux-gnu/' , './lib/x86_64-linux-gnu/')
           shutil.copy('/lib64/ld-linux-x86-64.so.2','./lib64/')
            
           #os.system('chmod +x inner_script.sh')
           #os.system('bash inner_script.sh')
   
           #Changing the mode of inner_script to be executable then chroot the jailroot
           os.system(' chmod +x inner_script.sh  && sudo chroot .')
           
           #While being in the fake root mode, you can execute the inner_script manually 
           #By bash inner_script.sh or ./inner_script.sh
except Exception as e:
   print(e)
