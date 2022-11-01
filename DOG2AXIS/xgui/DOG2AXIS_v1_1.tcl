# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BSZ_P2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HAV" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INT_REQ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VAV" -parent ${Page_0}


}

proc update_PARAM_VALUE.BSZ_P2 { PARAM_VALUE.BSZ_P2 } {
	# Procedure called to update BSZ_P2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BSZ_P2 { PARAM_VALUE.BSZ_P2 } {
	# Procedure called to validate BSZ_P2
	return true
}

proc update_PARAM_VALUE.HAV { PARAM_VALUE.HAV } {
	# Procedure called to update HAV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAV { PARAM_VALUE.HAV } {
	# Procedure called to validate HAV
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


proc update_MODELPARAM_VALUE.HAV { MODELPARAM_VALUE.HAV PARAM_VALUE.HAV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAV}] ${MODELPARAM_VALUE.HAV}
}

proc update_MODELPARAM_VALUE.VAV { MODELPARAM_VALUE.VAV PARAM_VALUE.VAV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VAV}] ${MODELPARAM_VALUE.VAV}
}

proc update_MODELPARAM_VALUE.BSZ_P2 { MODELPARAM_VALUE.BSZ_P2 PARAM_VALUE.BSZ_P2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BSZ_P2}] ${MODELPARAM_VALUE.BSZ_P2}
}

proc update_MODELPARAM_VALUE.INT_REQ { MODELPARAM_VALUE.INT_REQ PARAM_VALUE.INT_REQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INT_REQ}] ${MODELPARAM_VALUE.INT_REQ}
}

