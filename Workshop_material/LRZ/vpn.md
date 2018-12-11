# Configuring the VPN for connecting to the LRZ  
**NOTE:** Instructions translated from the LRZ [webpage](https://www.lrz.de/services/netz/mobil/vpn/).(In German)    
## Mac Installation  
VPN with Mac OS X
Cisco VPN Client for Mac OS
System requirements:
- OS X 10.11 (El Capitan)  

If there are any problems with the AnyConnect client, use the built-in client. A profile for this client is available on the [download](https://www.lrz.de/services/netz/mobil/vpnclient) page.

- OS X 10.10 (Yosemite) , OS X 10.9 (Mavericks) , OS X 10.8 (Mountain Lion) OS X 10.7 (Lion)    

Please use the AnyConnect client ( http://www.lrz.de/services/netz/mobil/vpn/anyconnect/).

- Mac OS X 10.6 (Snow Leopard).    

Mac OS X 10.6 (Snow Leopard) has a built-in Cisco IPsec client. A profile for this client is available on the [download](https://www.lrz.de/services/netz/mobil/vpnclient) page.

- Mac OS X 10.5 (Leopard) and older:    

The Cisco VPN client only runs on the operating system version of Mac OS X 10.1.5. Under the apple there is the menu item About this Mac , with which one can query the version of Mac OS X. For users who still only use Mac OS 9, there is no more client (There was a client of Netlock for $ 114 (as of 08-2003)  

**How do I get the VPN client?**    
The Cisco VPN client and the required lrz.pcf profile can be downloaded from the Leibniz Data Center web server at the following URL: [https://www.lrz.de/services/netz/mobil/vpnclient/] . On this page you have to authenticate yourself with a valid identifier (eg LRZ, MyTUM, CamusLMU) and then get to the download page. Since the installation program is about 14 megabytes in size, we recommend a fast internet connection (estimated download times 56k: 30 min, ISDN: 15 min, DSL: 2 min).  

**Installation of the VPN client:**       
![](https://i.imgur.com/6RMI5CL.png)

Double-clicking the mwn-vpnclient-macosx-4.9.01.0180-universal.dmg file (4.9.01.0180 refers to the version number) creates the CiscoVPNClient drive on the Finder Desktop.    

![](https://i.imgur.com/05DqAg6.png)

A double-click opens a window containing the installation program (Cisco VPN Client.mpkg) and two folders. Double-clicking Cisco VPN Client.mpkg starts the installation. After installation, the disk image can be ejected and the .dmg file deleted. "    

After authentication to the system, the installation can be started.    

**Use of the VPN client**      
![](https://i.imgur.com/9wypxRR.png)  

After installation, the Cisco VPN client is in the Applications folder. Double-click to start the VPN client. If there is not the entry lrz, then Profli lrz.pcf , which can be downloaded on the same page as the client can still be installed. To do this extends the window of the VPN client by pressing the keyboard shortcut Command + M . Now you can click the icon Impor t click and lrz.pcf import the file. After pressing Command + M again , the window looks like shown below.    
![](https://i.imgur.com/ikx6FOU.png)  

With the installed profile "LRZ" a secure connection to the VPN server of the Leibniz data center can be established. Click on the profile and choose "Connect".  

![](https://i.imgur.com/ryBgBJv.png)  
 
After a short negotiation phase, the login mask appears, in which the Internet ID and password must be entered.   
![](https://i.imgur.com/nohzIbt.png)  

The connection is terminated by clicking on "Disconnect".  

 

**Command line**    
The client can also be started from the command line

```bash
vpnclient connect lrz
```

Internet ID and password are required. The call without parameters provides a short help:

[macclient: ~] vpnclient 
Cisco Systems VPN Client Release 4.9.01 (0030) 
Copyright (C) 1998-2006 Cisco Systems, Inc. All Rights Reserved. 
Client Type (s): Mac OS X 
Running on: Darwin 8.11.0 
Config file directory: / etc / opt / cisco-vpnclient 

Usage: 
```bash
vpnclient connect <profile> [user <username>] [eraseuserpwd | pwd <password>] [nocertpwd] 
vpnclient disconnect 
vpnclient stat [reset] [traffic] [tunnel] [route] [repeat] 
vpnclient notify 
vpnclient verify [autoinitconfig] 
vpnclient autoinit
```
Remove the client

You can remove the client by calling the sudo vpn_uninstall command on the command line.  


## Windows Installation    
**VPN (IPsec) under Windows**  
The Cisco VPN client program for Windows can be installed on the Windows 98, 98SE, ME, NT4 (SP6a), 2000, XP, Vista, and Windows 7 (32-bit) systems only. For 64-bit systems, only the [Anyconnect client](https://www.lrz.de/services/netz/mobil/vpn/anyconnect/) can be used. For systems with less than 256 MB of main memory, please use version 4.0.5C.

**Download the client software**  
Enter your user ID and password on the https://www.lrz.de/services/netz/mobil/vpnclient page and then click on the download page . Click on the button Windows on the appearing page . Select a directory, eg C: \ tmp and click Save . Then download the LRZ profile for an existing client from the same page (penultimate link on the page), eg save the file lrz.pcf to C: \ tmp.

**Installation**    
Close (really) all other running applications, the installation of the client goes deeper into the system than other program installations. Disruptions are pretty easy here.    

Start the Windows Explorer and unpack the file vpnclient-win-msi-5.0.03.0530-k9.exe (name different for other versions) by double-clicking on the file name. Administrator rights are required for the installation. After unpacking the installation starts automatically.    

**Attention: Leave the default installation directory, a change can lead to a faulty installation.**    
  
Confirm the next windows with Next or Yes . After the appearance and disappearance of some other windows finally comes the request to restart the computer.  

**Import profile**  
After the restart, start the client  

*Start*-> *Programs*-> *LRZ VPN Client*-> *VPN Client*. In the program window  

![](https://i.imgur.com/7KCQjOx.png)  

select Import from the Connection Entries menu and set the location of the previously downloaded lrz.pcf file.    

**Conection**  
![](https://i.imgur.com/4qZLcpr.png)  
 
To connect, click on the Connect button.      

The window for entering the user ID and the password appears.     


![](https://i.imgur.com/hMrFIlK.png)


Enter your ID (7-digit LRZ identifier, name@tum.de , name@campus.lmu.de or radius identifier @ otherzone ) and click OK . 
After a few seconds, the window should disappear, then the VPN connection is ready. However, a small yellow icon (padlock) remains  visible in the tray area of the status bar (bottom right of the screen). By double-clicking on this icon, the client window can be opened again at any time.  

To end the VPN connection, right-click on the tray icon and select disconnect.    

![](https://i.imgur.com/Q7qG9lu.png)  

For more information, see the help documentation included with the program (Help menu, English) and the LRZ FAQs at http://www.lrz.de/fragen/faq/#vpn.   







