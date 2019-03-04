#Imported libraries
import os
import time
from datetime import datetime
from os import listdir
from os.path import isfile, join
#Accessing our home directory
print(os.environ.get('HOME'))
try:
    #Creating os_lab_0 folder
    os.mkdir('os_lab_0')
except OSError:
    #If it is already exist !!
    print("This folder is already exist!")
except Exception as e:
    #If it raised other Exceptions
    print(e)
finally:
    #Entering os_lab_0 folder
    os.chdir('./os_lab_0')
    print(os.getcwd())
    #Function for creating files
    def touch(fname):
        try:
            os.utime(fname, None)
        except OSError:
            open(fname, 'a').close()
    #Creating different files
    touch('a.txt')
    touch('b.txt')
    touch('c.py')
    #Listing our current directory
          print(os.listdir('./'))
    #Printing last modified dates for all (files) not folders in os_lab_0
    files = [f for f in listdir('./') if isfile(join('./',f))]
    for file in files:
              print(" %s last modified at: %s" % (file , time.ctime(os.path.getmtime(file))))
    #Finding and printing only files ending with thsuffix .txt
    for file in os.listdir('./'):
         if file.endswith(".txt"):
             print(os.path.join("./", file))
