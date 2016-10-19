// "${}"
#Create CMS Groups
# -----------------------------------------------------------------
resource "clc_group" "RGROUPCMS" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group1.CMS.FoldName"]}"
  parent = "${var.VMAINGROUPS.["Group1.ALL.Parent"]}"
}


# -----------------------------------------------------------------

# Create CMS VM ADDNS
# -----------------------------------------------------------------
resource "clc_server" "RADDNSNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["CMS.ADDNS"]}"
  source_server_id = "${var.VTEMPLATES.["WIN.BLANKOS.Template"]}"   //nome template da deployare
  group_id = "${clc_group.RGROUPCMS.id}"                            //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Addns.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Addns.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["CMS-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["CMS.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
  }


# -----------------------------------------------------------------

# Create CMS VM APP
# -----------------------------------------------------------------
resource "clc_server" "RAPPNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
name_template = "${var.VHOSTNAME.["CMS.APP"]}"
source_server_id = "${var.VTEMPLATES.["WIN.BLANKOS.Template"]}"   //nome template da deployare
group_id = "${clc_group.RGROUPCMS.id}"                            //variabile nome folder dove posizionare la macchina
cpu = "${var.VGLOBRESOURCE.["App.CPU"]}"                        //variabile CPU CACHE VM
memory_mb = "${var.VGLOBRESOURCE.["App.RAM"]}"                  //variabile RAM CACHE VM
password = "${var.VGLOBALVM.["CMS-WIN.Admin.Passwd"]}"             //variabile password AVS VM
network_id = "${var.VNETID.["CMS.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

# Create CMS VM FILE
# -----------------------------------------------------------------
resource "clc_server" "RFILENODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["CMS.FILE"]}"
  source_server_id = "${var.VTEMPLATES.["WIN.BLANKOS.Template"]}"   //nome template da deployare
  group_id = "${clc_group.RGROUPCMS.id}"                            //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["File.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["File.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["CMS-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["CMS.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}


# Create CMS VM FTP
# -----------------------------------------------------------------
resource "clc_server" "RFTPNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["CMS.FTP"]}"
  source_server_id = "${var.VTEMPLATES.["WIN.BLANKOS.Template"]}"   //nome template da deployare
  group_id = "${clc_group.RGROUPCMS.id}"                            //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Ftp.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Ftp.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["CMS-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["CMS.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

# Create CMS VM LOCK
# -----------------------------------------------------------------
resource "clc_server" "RLOCKNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["CMS.LOCK"]}"
  source_server_id = "${var.VTEMPLATES.["WIN.BLANKOS.Template"]}"   //nome template da deployare
  group_id = "${clc_group.RGROUPCMS.id}"                            //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Lock.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Lock.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["CMS-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["CMS.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}


# Create CMS VM MSMQ
# -----------------------------------------------------------------
resource "clc_server" "RMSMQNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["CMS.MSMQ"]}"
  source_server_id = "${var.VTEMPLATES.["WIN.BLANKOS.Template"]}"   //nome template da deployare
  group_id = "${clc_group.RGROUPCMS.id}"                            //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Msmq.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Msmq.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["CMS-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["CMS.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}


# Create CMS VM PROXY
# -----------------------------------------------------------------
resource "clc_server" "RPROXYNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["CMS.PROXY"]}"
  source_server_id = "${var.VTEMPLATES.["WIN.BLANKOS.Template"]}"   //nome template da deployare
  group_id = "${clc_group.RGROUPCMS.id}"                            //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Proxy.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Proxy.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["CMS-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["CMS.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}


# Create CMS VM SQL
# -----------------------------------------------------------------
resource "clc_server" "RSQLNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["CMS.SQL"]}"
  source_server_id = "${var.VTEMPLATES.["WIN.BLANKOS.Template"]}"   //nome template da deployare
  group_id = "${clc_group.RGROUPCMS.id}"                            //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Sql.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Sql.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["CMS-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["CMS.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

# Create CMS VM WEN
# -----------------------------------------------------------------
resource "clc_server" "RWEBNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["CMS.WEB"]}"
  source_server_id = "${var.VTEMPLATES.["WIN.BLANKOS.Template"]}"   //nome template da deployare
  group_id = "${clc_group.RGROUPCMS.id}"                            //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Web.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Web.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["CMS-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["CMS.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

