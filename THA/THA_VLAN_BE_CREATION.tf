// "${}"

# Create CRE APP VM
# -----------------------------------------------------------------
resource "clc_server" "RCREAPP" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["THA.CRE"]}"
  source_server_id = "VA2OTA2CCRE0101"
  group_id = "${clc_group.GROUP1THAAPP.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["APPS.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["APPS.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["THA.BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}

resource "clc_server" "RCRERPS" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  //count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["THA.RPS"]}"
  source_server_id = "VA2OTA2CRPS0101"
  group_id = "${clc_group.GROUP1THAAPP.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["APPS.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["APPS.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["THA.BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}
# -----------------------------------------------------------------