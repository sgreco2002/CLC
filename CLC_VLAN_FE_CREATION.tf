// "${}"
#Create FE Groups
# -----------------------------------------------------------------
resource "clc_group" "RGROUPFECACHE" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.FE.Cache"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}

resource "clc_group" "RGROUPFEMON" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.FE.Monitor"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}
# -----------------------------------------------------------------

# Create FRONTEND VM
# -----------------------------------------------------------------
resource "clc_server" "RCACHENODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["FE.CACHE"]}"
  source_server_id = "VA2OTT2CCACHE01"
  group_id = "${clc_group.RGROUPFECACHE.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Cache.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Cache.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["FE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}




# Create Monitoring VM
resource "clc_server" "RMONNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["FE.MON"]}"
  source_server_id = "VA2OTT2CMONIT01"                        //nome template da deployare
  group_id = "${clc_group.RGROUPFEMON.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Monitor.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Monitor.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["FE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

# Create Monitoring 2 VM
resource "clc_server" "RMONNODE2" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["FE.MON"]}"
  source_server_id = "VA2OTT2CMONIT02"                        //nome template da deployare
  group_id = "${clc_group.RGROUPFEMON.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Monitor.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Monitor.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["FE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

# Create Monitoring Bastion VM
resource "clc_server" "RMONBAS" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["FE.BAS"]}"
  source_server_id = "${var.VTEMPLATES.["RH.BLANKOS.Template"] }"                     //nome template da deployare
  group_id = "${clc_group.RGROUPFEMON.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Bas.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Bas.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["FE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}


# Create Monitoring DS VM
resource "clc_server" "RMONDS" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["FE.DS"]}"
  source_server_id = "VA2OTT2CDS0101"                        //nome template da deployare
  group_id = "${clc_group.RGROUPFEMON.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["DS.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["DS.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["FE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}


# Create Monitoring IDX VM
resource "clc_server" "RMONIDX" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["FE.IDX"]}"
  source_server_id = "VA2OTT2CIDX0101"                        //nome template da deployare
  group_id = "${clc_group.RGROUPFEMON.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["IDX.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["IDX.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["FE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

# -----------------------------------------------------------------