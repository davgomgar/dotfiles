
# function firmaJar() {
#   if (( $# == 1 ))
#   then
#       jarsigner -keystore http://obelix.avitech-ag.intra/maven/resources/avitech.keystore.2021 -storepass avitech $1 Avitech
#   else
#         echo "Please, pass a jar file to be signed"
#   fi
# }

# function changeEnvironment() {
#   if (( $# ==1 ))
#   then
#     sudo rm /etc/hosts
#     sudo ln -s /Users/david/Developer/dotfiles/avitech/hosts/"$1_hosts" /etc/hosts
#   else
#     echo "Please pass the environment name to use"
#   fi
# }
#
# function debugWebstart() {
#   if (($# == 1))
#   then
#     javaws -verbose -J-Xdebug -J-Xnoagent -J-Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8123 $1
#   else
#     echo "Please pass the URL to the JNLP to debug"
#   fi
# }
#

# Aliases
#Others
# alias -g fixSrvPermissions="sshpass -p 'avitech' ssh root@192.168.2.177 'chown -R mhsavs.avitech /mnt/u30/home/mhsavs/avs/srv/cfg/com'"
# alias -g fixSciPermissions="sshpass -p 'avitech' ssh root@192.168.2.177 'chown -R mhsavs.avitech /mnt/u30/home/mhsavs/avs/sci/cfg/com'"
# alias -g fixMcuSrvPermissions="sshpass -p 'avitech' ssh root@192.168.2.177 'chown -R mhsavs.avitech /mnt/u30/home/mhsavs/avs/mcu-srv/cfg/com'"
# alias -g fixAmrPermissions="sshpass -p 'avitech' ssh root@192.168.2.177 'chown -R pp.bin /mnt/u30/home/pp/avs/mcu-amr/cfg'"
# alias mcpnotestavi="mcp -Dskip.unit.tests=true -Dskip.integration.tests=true"
# alias deploySrv="mcpnotestavi && sshpass -p 'avitech' scp -rpO target/classes/com root@192.168.2.177:/mnt/u30/home/mhsavs/avs/srv/cfg && fixSrvPermissions"
#alias deploySci="mcpnotestavi && sshpass -p 'avitech' scp -rpO target/classes/com root@192.168.2.177:/mnt/u30/home/mhsavs/avs/sci/cfg && fixSciPermissions"
#alias deployMcuSrv="mcpnotestavi && sshpass -p 'avitech' scp -rpO target/classes/com root@192.168.2.177:/mnt/u30/home/mhsavs/avs/mcu-srv/cfg && fixMcuSrvPermissions"
#alias deployAmr="mcpnotestavi && sshpass -p 'avitech' scp -rpO target/classes/com root@192.168.2.177:/mnt/u30/home/pp/avs/mcu-amr/cfg && fixAmrPermissions"
#Untested alias deployMcuSrvWithRestart="deployMcuSrv && service avisyssrv_mcu stop && service avisyssrv_mcu start"
#alias clearDeploySrv="sshpass -p 'avitech' ssh root@192.168.2.177 'rm -rf /mnt/u30/home/mhsavs/avs/srv/cfg/com'"
#alias clearDeployMcuSrv="sshpass -p 'avitech' ssh root@192.168.2.177 'rm -rf /mnt/u30/home/mhsavs/avs/mcu-srv/cfg/com'"
#alias clearDeploySci="sshpass -p 'avitech' ssh root@192.168.2.177 'rm -rf /mnt/u30/home/mhsavs/avs/sci/cfg/com'"
#alias clearDeployAmr="sshpass -p 'avitech' ssh root@192.168.2.177 'rm -rf /mnt/u30/home/pp/avs/mcu-amr/cfg/com'"
#alias avaavm="sshpass -p 'avitech' ssh root@192.168.133.215"
#alias localvm="sshpass -p 'avitech' ssh root@vm-mhsgen6-dgg"
#alias localvmXWin="sshpass -p 'avitech' ssh -X root@192.168.2.177"
#alias localvmMhsUser="sshpass -p 'avitech' ssh -t root@192.168.2.177 'su - mhsavs'"
#alias rh7vm="sshpass -p 'avitech' ssh root@192.168.2.178"
#alias rh7vmXWin="sshpass -p 'avitech' ssh -X root@192.168.2.178"
#alias rh7vmMhsUser="sshpass -p 'avitech' ssh -t root@192.168.2.178 'su - mhsavs'"
# Java Mission Control 8 Sansphot
alias jmc8="open /Users/david/Tools/jmc8/JDK\ Mission\ Control.app"
#MHS Cluster tool
#alias mhscluster="java -jar /Users/david/bin/mhs_cluster/AviMhsCluClient-runner.jar"
