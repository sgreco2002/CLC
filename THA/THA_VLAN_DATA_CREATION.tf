// "${}"
resource "clc_server" "RCREDATAREP" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  //count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["THA.REP"]}"
  source_server_id = "VA2OTA2CREP0101"
  group_id = "${clc_group.GROUP1THADATA.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["DBS.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["DBS.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["THA.DATA.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

resource "clc_server" "RCREDATASQL" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["THA.SQL"]}"
  source_server_id = "VA2OTA2CSQL0101"
  group_id = "${clc_group.GROUP1THADATA.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["DBS.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["DBS.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["THA.DATA.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

# -----------------------------------------------------------------