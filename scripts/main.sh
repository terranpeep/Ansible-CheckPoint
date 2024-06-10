
source /etc/profile.d/CP.sh # load checkpoint env vars

CURRENT_VERSION=$($CPDIR/bin/cpprod_util CPPROD_GetVerText CPshared | sed "s/ //g") # returns "R81", "R80.30" etc.
RELEASE_VERSION=$($CPDIR/bin/cpprod_util CPPROD_GetValue FW1 CurrentMgmtReleaseVersion 1 2>/dev/null) # returns whether GA or not
DEVICE_HOSTNAME=$(hostname)

ADDITIONAL_FILES=(
    $FWDIR/boot/modules/fwkern.conf 
    $FWDIR/boot/modules/vpnkern.conf 
    $PPKDIR/boot/modules/simkern.conf
    $PPKDIR/conf/simkern.conf
    $PPKDIR/boot/modules/sim_aff.conf 
    $FWDIR/conf/fwaffinity.conf 
    $FWDIR/conf/fwauthd.conf 
    $FWDIR/conf/local.arp
    $FWDIR/conf/discntd.if
    $FWDIR/conf/cpha_bond_ls_config.conf 
    $FWDIR/conf/cpha_specific_vlan_data.conf
    $FWDIR/conf/resctrl
    $FWDIR/conf/vsaffinity_exception.conf 
    $FWDIR/database/qos_policy.C
    $FWDIR/lib/implied_rules.def
    $FWDIR/conf/trac_client_1.ttm
    $FWDIR/conf/ipassignments.conf
    /etc/ssh/sshd_config
    $FWDIR/conf/rad_conf.C
    $FWDIR/lib/table.def
    $FWDIR/lib/crypt.def
    $FWDIR/conf/user.def*
    $FWDIR/conf/trac_client_1.ttm
    $FWDIR/conf/vpn_route.conf
    $FWDIR/bin/cpisp_update
    /etc/dhcpd.conf
    /var/ace/*
    /var/ace2/*
    /etc/ssh/ssh_config
    $PPKDIR/conf/sim_aff.conf
    $CPDIR/tmp/.CPprofile.sh
    $CPDIR/tmp/.CPprofile.csh
    /var/ace/sdconf.rec
    /var/ace/sdopts.rec
    /var/ace/sdstatus.12
    /var/ace/securid
)


mkdir /tmp/backups/
mkdir /tmp/backups/additional_files/

for file in ${ADDITIONAL_FILES[@]}; do
    cp $file /tmp/backups/additional_files/
done
FILE_EXPORT_NAME=/tmp/backups/$(date +'%Y-%m-%d')_${DEVICE_HOSTNAME}_additional_files.tgz
tar -czvf $FILE_EXPORT_NAME /tmp/backups/additional_files/
