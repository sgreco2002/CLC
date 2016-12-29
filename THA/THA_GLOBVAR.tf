#Global Variable for CenturyLink - Terraform Integration
#new comment ciao
# comment dario2
provider "clc" {
	username = "dario.segatori.pp"					// *** clc account
	password = "Akitiple1988"						// *** clc password
	account = "OTA2"

}
# NETWORKS ---------------------------------------------------------------------------
variable "VNETID" {  // *** to be retreived from clc gui
	type = "map"
	description = "Network configured to be catch using ctl API"
	default = {
		THA.BE.VLANID = "eb61de85ac794f1487cf151c90b84c09"
		THA.DATA.VLANID = "00b5d17a6bd04f41a3ee3e898d2c0957"
		//add vlan id ->
	}
}

// -----------------------------------------------------------------------------------

# GROUPS -----------------------------------------------------------------------------
variable "VMAINGROUPS" {
	type = "map"
	description = "Folder that contain the APP Group"
	default = {
		Group0.LocationID = "VA2"
		Group0.FoldName = "PREPROD"		// *** group for environment
		Group0.Parent = "VA2 Hardware"
		Group1.THA.FoldNameAPP = "THA APP Group"		// *da inserire negli script a parte di THA
		Group1.THA.FoldNameDATA = "THA Data Group"		// *da inserire negli script a parte di THA
		Group1.ALL.Parent = "PREPROD"
	}
}

# -----------------------------------------------------------------------------------

# VM DEFAULTS ------------------------------------------------------------------
variable "VGLOBALVM" {
	type = "map"
	description = "Global setting for any VM"
	default = {
		VM.MinInstances = 2							// *** n of instance for each server
		VM.MaxInstances = 3
		RH.Admin.name  = "root"
		WIN.Admin.name = "administrator"
		RH-WIN.Admin.Passwd = "Qj445MKBwb9f"		// *** root \ administrator passwd
		CMS-WIN.Admin.Passwd = "_Accenture_1"		// ** administrator passwd CMS
		RH.Disk.Path = "/product"
		RH.Disk.SizeGb = 15
		RH.Disk.Type = "partitioned"
	}
}
# -----------------------------------------------------------------------------------

# VM RESOURCES
# -----------------------------------------------------------------------------------
variable "VGLOBRESOURCE" {
	type = "map"
	description = "Global resource setting for any VM"
	default = {
		APPS.CPU = 8
		APPS.RAM = 9632
		DBS.CPU = 8
		DBS.RAM = 38528
		// add other machine resources
	}
}
# -----------------------------------------------------------------------------------

# VM HOSTNAMES -----------------------------------------------------------------------------------
variable "VHOSTNAME" {
	type = "map"
	description = "Hostnames for Machine Role"
	default = {
		THA.CRE= "PP-CRE"
		THA.RPS = "PP-RPS"
		THA.REP = "PP-REP"
		THA.SQL = "PP-SQL"
	}
}

# -----------------------------------------------------------------------------------

variable "VTEMPLATES" {
	type = "map"
	description = "Template names to be used"
	default {
		RH.BLANKOS.Template = "RHEL-6-64-TEMPLATE"
		WIN.BLANKOS.Template = "WIN2012R2DTC-64"
		// add windows blank template
	}
}

