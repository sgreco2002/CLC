// "${}"
#Create FE Groups
# -----------------------------------------------------------------
resource "clc_group" "RGROUPFECACHE" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.FE.Cache"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}

resource "clc_group" "RGROUPFEDRM" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group2.AVS.FE.DRM"]}"
  parent = "${var.VMAINGROUPS.["Group2.AVS.Parent"]}"
}
# -----------------------------------------------------------------

# Create FRONTEND VM
# -----------------------------------------------------------------
resource "clc_server" "RCACHENODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["FE.CACHE"]}"
  source_server_id = "RHEL-6-64-TEMPLATE"                           //nome template da deployare
  group_id = "${clc_group.RGROUPFECACHE.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Cache.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Cache.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "77facca935e047b9985d1ae867829194"	                //variabile NETWORK FE VA2 Pre-Prod
  additional_disks = {
      path = "${var.VGLOBALVM.["RH.Disk.Path"]}"
      size_gb = "${var.VGLOBALVM.["RH.Disk.SizeGb"]}"
      type = "${var.VGLOBALVM.["RH.Disk.Type"]}"
  }
}

# Create DRM VM
resource "clc_server" "RDRMNODE" {                                //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
  count = "${var.VGLOBALVM.["VM.MinInstances"]}"
  name_template = "${var.VHOSTNAME.["FE.DRM"]}"
  source_server_id = "RHEL-6-64-TEMPLATE"                           //nome template da deployare
  group_id = "${clc_group.RGROUPFEDRM.id}"                        //variabile nome folder dove posizionare la macchina
  cpu = "${var.VGLOBRESOURCE.["Drm.CPU"]}"                        //variabile CPU CACHE VM
  memory_mb = "${var.VGLOBRESOURCE.["Drm.RAM"]}"                  //variabile RAM CACHE VM
  password = "${var.VGLOBALVM.["RH-WIN.Admin.Passwd"]}"             //variabile password AVS VM
  network_id = "${var.VNETID.["BE.VLANID"]}"	                //variabile NETWORK FE VA2 Pre-Prod
  additional_disks = {
    path = "${var.VGLOBALVM.["RH.Disk.Path"]}"
    size_gb = "${var.VGLOBALVM.["RH.Disk.SizeGb"]}"
    type = "${var.VGLOBALVM.["RH.Disk.Type"]}"
  }
}
# -----------------------------------------------------------------
/*

  resource "clc_server" "RMONODE" {                      //variabile nome macchina es FE -> sul cloud diventa FE01 / 02 etc
     name_template = "Moni02"                             //variabile nometemplare per richiamare questo "script"
     source_server_id = "RHEL-6-64-TEMPLATE"            //nome template da deployare
     group_id = "${clc_group.FEPROD.id}"                //variabile nome folder dove posizionare la macchina
     cpu = 2                                            //variabile CPU MONIT VM
     memory_mb = 4096                                   //variabile RAM MONIT VM
     password = "Qj445MKBwb9f"                          //variabile password AVS VM
     network_id = "77facca935e047b9985d1ae867829194"	//variabile NETWORK FE VA2 Pre-Prod
     private_ip_address = "10.166.132.18"				//possiamo fare anche qui una variabile contando che ogni nuova VLAN parte del x.x.x.12 / x.x.x.13 etc
   }

*/