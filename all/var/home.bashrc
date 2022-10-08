clear
echo -e "---> To see the default welcome screen type \n     \"showWelcScr\""
echo -e "---> To exit type \n     \"exit\""
echo -e "---> To update UPK contents (downloading from \n     github.com) type \n     \"cd ~/Repositories/upK; git pull\"" 
figlet UPK	

showWelcScr () {
clear
cat << welc
Welcome to Termux!

Community forum: https://termux.com/community
Gitter chat:     https://gitter.im/termux/termux
IRC channel:     #termux on libera.chat

Working with packages:

 * Search packages:   pkg search <query>
 * Install a package: pkg install <package>
 * Upgrade packages:  pkg upgrade

Subscribing to additional repositories:

 * Root:     pkg install root-repo
 * X11:      pkg install x11-repo

Report issues at https://termux.com/issues
welc
}
