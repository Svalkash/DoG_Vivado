# ----------------------------------------------------------------------------
# VGA Output - Bank 33
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN Y21 [get_ports {vga_blue_0[0]}]
set_property PACKAGE_PIN Y20 [get_ports {vga_blue_0[1]}]
set_property PACKAGE_PIN AB20 [get_ports {vga_blue_0[2]}]
set_property PACKAGE_PIN AB19 [get_ports {vga_blue_0[3]}]
set_property PACKAGE_PIN AB22 [get_ports {vga_green_0[0]}]
set_property PACKAGE_PIN AA22 [get_ports {vga_green_0[1]}]
set_property PACKAGE_PIN AB21 [get_ports {vga_green_0[2]}]
set_property PACKAGE_PIN AA21 [get_ports {vga_green_0[3]}]
set_property PACKAGE_PIN V20 [get_ports {vga_red_0[0]}]
set_property PACKAGE_PIN U20 [get_ports {vga_red_0[1]}]
set_property PACKAGE_PIN V19 [get_ports {vga_red_0[2]}]
set_property PACKAGE_PIN V18 [get_ports {vga_red_0[3]}]

set_property PACKAGE_PIN AA19 [get_ports vga_hsync_0]
set_property PACKAGE_PIN Y19 [get_ports vga_vsync_0]

# Note that the bank voltage for IO Bank 33 is fixed to 3.3V on ZedBoard.
# This shit stays AFTER all pins to avoid errors
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]]


