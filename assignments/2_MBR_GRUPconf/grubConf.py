#This file must be called by sudo privilege to function
import os 
#Reading and writing MBR to myMBR
os.system("dd if=/dev/sda of=./myMBR bs=512 count=1 | hexdump -C")  


#Show content of myMBR
#-> os.system("file ./myMBR")


#Entering a new entery in GRUB with an iso file under my home directory
with open("/etc/grub.d/40_custom", "a") as editedGrubFile:
    editedGrubFile.write("menuentry \"Ubuntu Live ISO\" { \n")
    editedGrubFile.write("set UbuntuISOFile=\"/home/ahmed/ubuntu-18.04.2-desktop-amd64.iso\" \n")
    editedGrubFile.write("loopback loop (hd7,1)$UbuntuISOFile}")

os.system("update-grub")



#Runing the new Operating system on GRUB entirely on the ram
# https://wiki.ubuntu.com/BootToRAM


