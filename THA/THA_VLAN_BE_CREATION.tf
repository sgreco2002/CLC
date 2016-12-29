// "${}"

# Create CRE APP VM
# -----------------------------------------------------------------
resource "clc_server" "RCREAPP" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["THA.CRE"]}"
  source_server_id = "XX"
  group_id = "${clc_group.GROUP1THAAPP.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["APPS.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["APPS.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["THA.BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

resource "clc_server" "RCRERPS" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  //count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["THA.RPS"]}"
  source_server_id = "XX"
  group_id = "${clc_group.GROUP1THAAPP.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["APPS.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["APPS.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["THA.BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
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
*/
# -----------------------------------------------------------------