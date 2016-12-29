// "${}"
#Create BE Groups
# -----------------------------------------------------------------
resource "clc_group" "RGROUPBEBATCH" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.BE.Batch"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}

resource "clc_group" "RGROUPBENTP" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.BE.NTP"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}

resource "clc_group" "RGROUPBEPGW" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.BE.PGW"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}

resource "clc_group" "RGROUPBEPINBOARD" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.BE.Pinboard"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}

resource "clc_group" "RGROUPBESDP" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.BE.SDP"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}

resource "clc_group" "RGROUPBESEARCH" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.BE.SOL"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}

resource "clc_group" "RGROUPBEBACKEND" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.BE.BackEnds"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}

resource "clc_group" "RGROUPFEFRONTEND" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.BE.FE"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}
# -----------------------------------------------------------------

# Create BATCH VM
# -----------------------------------------------------------------
resource "clc_server" "RBATCHNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["BE.BATC"]}"
  source_server_id = "VA2OTT2CBATCH04"
  group_id = "${clc_group.RGROUPBEBATCH.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Batch.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Batch.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

# Create PaymentGateway VM
resource "clc_server" "RPGWNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["BE.PGW"]}"
  source_server_id = "VA2OTT2CPGW02"                        //nome template da deployare
  group_id = "${clc_group.RGROUPBEPGW.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Pgw.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Pgw.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}
/*
# Create NTP VM
resource "clc_server" "RNTPNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["BE.NTP"]}"
  source_server_id = "${var.VTEMPLATES.["RH.BLANKOS.Template"]}"                       //nome template da deployare
  group_id = "${clc_group.RGROUPBENTP.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Ntp.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Ntp.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}
*/
# Create Pinboard VM
resource "clc_server" "RPINBOARDNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["BE.PINB"]}"
  source_server_id = "VA2OTT2CPINBO01"                        //nome template da deployare
  group_id = "${clc_group.RGROUPBEPINBOARD.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Pinboard.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Pinboard.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

# Create SDP VM
resource "clc_server" "RSDPDNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["BE.SDP"]}"
  source_server_id = "VA2OTT2CSDP01"                        //nome template da deployare
  group_id = "${clc_group.RGROUPBESDP.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Sdp.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Sdp.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

# Create SEARCH VM
resource "clc_server" "RSEARCHDNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["BE.SEAR"]}"
  source_server_id = "VA2OTT2CSEARC01"                        //nome template da deployare
  group_id = "${clc_group.RGROUPBESEARCH.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Search.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Search.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

# Create BE VM
resource "clc_server" "RBENODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["BE.BE"]}"
  source_server_id = "VA2OTT2CBE02"                        //nome template da deployare
  group_id = "${clc_group.RGROUPBEBACKEND.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Be.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Be.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

# Create FE VM
resource "clc_server" "RFENODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["BE.FE"]}"
  source_server_id = "VA2OTT2CFE02"                        //nome template da deployare
  group_id = "${clc_group.RGROUPFEFRONTEND.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Fe.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Fe.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}
# -----------------------------------------------------------------