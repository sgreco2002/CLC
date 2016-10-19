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
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
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
count = "${var.VGLOBALVM.["VM.MinInstances"]}"
name_template = "${var.VHOSTNAME.["CMS.APP"]}"
source_server_id = "${var.VTEMPLATES.["WIN.BLANKOS.Template"]}"   //nome template da deployare
group_id = "${clc_group.RGROUPCMS.id}"                            //variabile nome folder dove posizionare la macchina
cpu = "${var.VGLOBRESOURCE.["App.CPU"]}"                        //variabile CPU CACHE VM
memory_mb = "${var.VGLOBRESOURCE.["App.RAM"]}"                  //variabile RAM CACHE VM
password = "${var.VGLOBALVM.["CMS-WIN.Admin.Passwd"]}"             //variabile password AVS VM
network_id = "${var.VNETID.["CMS.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}
