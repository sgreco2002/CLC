// "${}"
#Create DATA Groups
# -----------------------------------------------------------------
resource "clc_group" "RGROUPDATADB" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.DATA.MySql"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}

# -----------------------------------------------------------------

# Create BATCH VM
# -----------------------------------------------------------------
resource "clc_server" "RMYSQLNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MaxInstances"]}"
  name_template = "${var.VHOSTNAME.["DATA.MYSQL"]}"
  source_server_id = "VA2OTT1CMYSQL01"
  group_id = "${clc_group.RGROUPDATADB.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Sql.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Sql.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
}
# -----------------------------------------------------------------