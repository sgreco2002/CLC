#Global Variable for CenturyLink - Terraform Integration
#new comment ciao
# comment dario2
provider "clc" {
	username = "sergio.greco.pp"					// *** clc account
	password = "Raffaello00"						// *** clc password
}
# NETWORKS ---------------------------------------------------------------------------
variable "VNETID" {  // *** to be retreived from clc gui
	type = "map"
	description = "Network configured to be catch using ctl API"
	default = {
		FE.VLANID = "77facca935e047b9985d1ae867829194"
		BE.VLANID = "9087e7b43e7e400c894be278e81b9228"
		DATA.VLANID = "af01ae5992fa455c9f188c6c4aaf6c1b"
		//add vlan id -> done
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
		Group1.AVS.FoldName = "AVS Group"
		Group1.CMS.FoldName = "CMS Group"
		Group1.THA.FoldName = "THA Group"
		Group1.ALL.Parent = "PREPROD"
		Group2.AVS.FE.DRM = "DRMLicenser"
		Group2.AVS.FE.Cache = "WebPortalCache"
		Group2.AVS.FE.Monitor = "Monitoring"
		Group2.AVS.BE.Analytics = "Analytics"
		Group2.AVS.BE.Batch = "Batch"
		Group2.AVS.BE.NTP = "NTPdate"
		Group2.AVS.BE.PGW = "PayemntGateway"
		Group2.AVS.BE.SOL = "Search"
		Group2.AVS.BE.BackEnds = "WebPortalBackEnd"
		Group2.AVS.BE.Pinboard = "PinBoard"
		Group2.AVS.BE.SDP = "SDP"
		Group2.AVS.DATA.MySql = "BEDatabase"
		Group2.AVS.Parent = "AVS Group"
	}
}

# -----------------------------------------------------------------------------------

# VM DEFAULTS ------------------------------------------------------------------
variable "VGLOBALVM" {
	type = "map"
	description = "Global setting for any VM"
	default = {
		VM.MinInstances = 2							// *** n of instance for each server
		RH.Admin.name  = "root"
		WIN.Admin.name = "administrator"
		RH-WIN.Admin.Passwd = "Qj445MKBwb9f"		// *** root \ administrator passwd
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
		Cache.CPU = 2
		Cache.RAM = 4096
		Drm.CPU = 2
		Drm.RAM = 4096
		Monitor.CPU = 2
		Monitor.RAM = 4096
		Fe.CPU = 2
		Fe.RAM = 4096
		Be.CPU = 4
		Be.RAM = 8192
		Batch.CPU = 2
		Batch.RAM = 16384
		Pgw.CPU = 4
		Pgw.RAM = 8192
		Pinboard.CPU = 2
		Pinboard.RAM = 4096
		Sdp.CPU = 2
		Sdp.RAM = 4096
		Search.CPU = 2
		Search.RAM = 4096
		Mysql.CPU = 8
		Mysql.RAM = 15360
		// add other machine resources
	}
}
# -----------------------------------------------------------------------------------

# VM HOSTNAMES -----------------------------------------------------------------------------------
variable "VHOSTNAME" {
	type = "map"
	description = "Hostnames for Machine Role"
	default = {
		FE.CACHE = "PPCACH"
		FE.DRM = "PPDRML"
		FE.MON = "PPMONI"
		BE.FE = "PPFE"
		BE.PINB = "PPPINB"
		BE.BE = "PPBE"
		BE.BATC = "PPBATC"
		BE.SDP = "PPSDP"
		BE.SEAR = "PPSRCH"
		BE.PGW = "PPPGW"
		DATA.MYSQL = "PPMSQL"
		// add other machine names
	}
}

# -----------------------------------------------------------------------------------

variable "VTEMPLATES" {
	type = "map"
	description = "Temaplte names to be used"
	default {
		RH.BLANKOS.Template = "RHEL-6-64-TEMPLATE"
		WIN.BLANKOS.Template = "WIN2012R2DTC-64"
		// add windows blank template
	}
}

