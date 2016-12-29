#Configure the CLC Provider

# Create ENV Folder (lvl 0)
resource "clc_group" "GROUP0" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group0.FoldName"]}"
  parent = "${var.VMAINGROUPS.["Group0.Parent"]}"
}

# Create APP Folder (lvl 1 - AVS)
resource "clc_group" "GROUP1THAAPP" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group1.THA.FoldNameAPP"]}"
  parent = "${var.VMAINGROUPS.["Group1.ALL.Parent"]}"
}

# Create APP Folder (lvl 1 - AVS)
resource "clc_group" "GROUP1THADATA" {
  location_id = "${var.VMAINGROUPS.["Group0.LocationID"]}"
  name = "${var.VMAINGROUPS.["Group1.THA.FoldNameDATA"]}"
  parent = "${var.VMAINGROUPS.["Group1.ALL.Parent"]}"
}