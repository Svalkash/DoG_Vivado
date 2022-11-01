# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "HAV" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HBP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HFP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HPL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HSP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INT_REQ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VAV" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VBP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VFP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VPL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VSP" -parent ${Page_0}


}

proc update_PARAM_VALUE.HAV { PARAM_VALUE.HAV } {
	# Procedure called to update HAV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAV { PARAM_VALUE.HAV } {
	# Procedure called to validate HAV
	return true
}

proc update_PARAM_VALUE.HBP { PARAM_VALUE.HBP } {
	# Procedure called to update HBP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HBP { PARAM_VALUE.HBP } {
	# Procedure called to validate HBP
	return true
}

proc update_PARAM_VALUE.HFP { PARAM_VALUE.HFP } {
	# Procedure called to update HFP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HFP { PARAM_VALUE.HFP } {
	# Procedure called to validate HFP
	return true
}

proc update_PARAM_VALUE.HPL { PARAM_VALUE.HPL } {
	# Procedure called to update HPL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HPL { PARAM_VALUE.HPL } {
	# Procedure called to validate HPL
	return true
}

proc update_PARAM_VALUE.HSP { PARAM_VALUE.HSP } {
	# Procedure called to update HSP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HSP { PARAM_VALUE.HSP } {
	# Procedure called to validate HSP
	return true
}

proc update_PARAM_VALUE.INT_REQ { PARAM_VALUE.INT_REQ } {
	# Procedure called to update INT_REQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INT_REQ { PARAM_VALUE.INT_REQ } {
	# Procedure called to validate INT_REQ
	return true
}

proc update_PARAM_VALUE.VAV { PARAM_VALUE.VAV } {
	# Procedure called to update VAV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VAV { PARAM_VALUE.VAV } {
	# Procedure called to validate VAV
	return true
}

proc update_PARAM_VALUE.VBP { PARAM_VALUE.VBP } {
	# Procedure called to update VBP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VBP { PARAM_VALUE.VBP } {
	# Procedure called to validate VBP
	return true
}

proc update_PARAM_VALUE.VFP { PARAM_VALUE.VFP } {
	# Procedure called to update VFP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VFP { PARAM_VALUE.VFP } {
	# Procedure called to validate VFP
	return true
}

proc update_PARAM_VALUE.VPL { PARAM_VALUE.VPL } {
	# Procedure called to update VPL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VPL { PARAM_VALUE.VPL } {
	# Procedure called to validate VPL
	return true
}

proc update_PARAM_VALUE.VSP { PARAM_VALUE.VSP } {
	# Procedure called to update VSP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VSP { PARAM_VALUE.VSP } {
	# Procedure called to validate VSP
	return true
}


proc update_MODELPARAM_VALUE.HAV { MODELPARAM_VALUE.HAV PARAM_VALUE.HAV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAV}] ${MODELPARAM_VALUE.HAV}
}

proc update_MODELPARAM_VALUE.HFP { MODELPARAM_VALUE.HFP PARAM_VALUE.HFP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HFP}] ${MODELPARAM_VALUE.HFP}
}

proc update_MODELPARAM_VALUE.HSP { MODELPARAM_VALUE.HSP PARAM_VALUE.HSP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HSP}] ${MODELPARAM_VALUE.HSP}
}

proc update_MODELPARAM_VALUE.HBP { MODELPARAM_VALUE.HBP PARAM_VALUE.HBP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HBP}] ${MODELPARAM_VALUE.HBP}
}

proc update_MODELPARAM_VALUE.VAV { MODELPARAM_VALUE.VAV PARAM_VALUE.VAV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VAV}] ${MODELPARAM_VALUE.VAV}
}

proc update_MODELPARAM_VALUE.VFP { MODELPARAM_VALUE.VFP PARAM_VALUE.VFP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VFP}] ${MODELPARAM_VALUE.VFP}
}

proc update_MODELPARAM_VALUE.VSP { MODELPARAM_VALUE.VSP PARAM_VALUE.VSP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VSP}] ${MODELPARAM_VALUE.VSP}
}

proc update_MODELPARAM_VALUE.VBP { MODELPARAM_VALUE.VBP PARAM_VALUE.VBP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VBP}] ${MODELPARAM_VALUE.VBP}
}

proc update_MODELPARAM_VALUE.HPL { MODELPARAM_VALUE.HPL PARAM_VALUE.HPL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HPL}] ${MODELPARAM_VALUE.HPL}
}

proc update_MODELPARAM_VALUE.VPL { MODELPARAM_VALUE.VPL PARAM_VALUE.VPL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VPL}] ${MODELPARAM_VALUE.VPL}
}

proc update_MODELPARAM_VALUE.INT_REQ { MODELPARAM_VALUE.INT_REQ PARAM_VALUE.INT_REQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INT_REQ}] ${MODELPARAM_VALUE.INT_REQ}
}

