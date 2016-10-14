#Global Variable for CenturyLink - Terraform Integration
#new comment ciao
# comment dario 2
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
		BE.VLANID = ""
		DATA.VLANID = ""
		//add vlan id
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
		// add other machine resources
	}
}
# -----------------------------------------------------------------------------------

# VM HOSTNAMES -----------------------------------------------------------------------------------
variable "VHOSTNAME" {
	type = "map"
	description = "Hostnames for Machine Role"
	default = {
		FE.CACHE = "PCACHE"
		FE.DRM = "PDRMLI"
		FE.MON = "PMONIT"
		// add other machine names
	}
}

# -----------------------------------------------------------------------------------

variable "VTEMPLATES" {
	type = "map"
	description = "Temaplte names to be used"
	default {
		RH.BLANKOS.Template = "RHEL-6-64-TEMPLATE"
		// add windows blank template
	}
}

