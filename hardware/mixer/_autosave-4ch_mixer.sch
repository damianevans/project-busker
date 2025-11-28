(kicad_sch
	(version 20250114)
	(generator "eeschema")
	(generator_version "9.0")
	(uuid "6b0dd91b-4cb4-45c5-9b77-779b58f615d5")
	(paper "A4")
	(lib_symbols
		(symbol "Amplifier_Operational:NE5532"
			(pin_names
				(offset 0.127)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "U"
				(at 0 5.08 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Value" "NE5532"
				(at 0 -5.08 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "http://www.ti.com/lit/ds/symlink/ne5532.pdf"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Dual Low-Noise Operational Amplifiers, DIP-8/SOIC-8"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_locked" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "ki_keywords" "dual opamp"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "SOIC*3.9x4.9mm*P1.27mm* DIP*W7.62mm* TO*99* OnSemi*Micro8* TSSOP*3x3mm*P0.65mm* TSSOP*4.4x3mm*P0.65mm* MSOP*3x3mm*P0.65mm* SSOP*3.9x4.9mm*P0.635mm* LFCSP*2x2mm*P0.5mm* *SIP* SOIC*5.3x6.2mm*P1.27mm*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "NE5532_1_1"
				(polyline
					(pts
						(xy -5.08 5.08) (xy 5.08 0) (xy -5.08 -5.08) (xy -5.08 5.08)
					)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type background)
					)
				)
				(pin input line
					(at -7.62 2.54 0)
					(length 2.54)
					(name "+"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at -7.62 -2.54 0)
					(length 2.54)
					(name "-"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at 7.62 0 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(symbol "NE5532_2_1"
				(polyline
					(pts
						(xy -5.08 5.08) (xy 5.08 0) (xy -5.08 -5.08) (xy -5.08 5.08)
					)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type background)
					)
				)
				(pin input line
					(at -7.62 2.54 0)
					(length 2.54)
					(name "+"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at -7.62 -2.54 0)
					(length 2.54)
					(name "-"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at 7.62 0 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(symbol "NE5532_3_1"
				(pin power_in line
					(at -2.54 7.62 270)
					(length 3.81)
					(name "V+"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -2.54 -7.62 90)
					(length 3.81)
					(name "V-"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "Connector:Conn_01x02_Pin"
			(pin_names
				(offset 1.016)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "J"
				(at 0 2.54 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "Conn_01x02_Pin"
				(at 0 -5.08 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "~"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Generic connector, single row, 01x02, script generated"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_locked" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "ki_keywords" "connector"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "Connector*:*_1x??_*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "Conn_01x02_Pin_1_1"
				(rectangle
					(start 0.8636 0.127)
					(end 0 -0.127)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type outline)
					)
				)
				(rectangle
					(start 0.8636 -2.413)
					(end 0 -2.667)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 1.27 0) (xy 0.8636 0)
					)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.27 -2.54) (xy 0.8636 -2.54)
					)
					(stroke
						(width 0.1524)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(pin passive line
					(at 5.08 0 180)
					(length 3.81)
					(name "Pin_1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 -2.54 180)
					(length 3.81)
					(name "Pin_2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "Device:C_Polarized"
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0.254)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "C"
				(at 0.635 2.54 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Value" "C_Polarized"
				(at 0.635 -2.54 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Footprint" ""
				(at 0.9652 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "~"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Polarized capacitor"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "cap capacitor"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "CP_*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "C_Polarized_0_1"
				(rectangle
					(start -2.286 0.508)
					(end 2.286 1.016)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.778 2.286) (xy -0.762 2.286)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.27 2.794) (xy -1.27 1.778)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 2.286 -0.508)
					(end -2.286 -1.016)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type outline)
					)
				)
			)
			(symbol "C_Polarized_1_1"
				(pin passive line
					(at 0 3.81 270)
					(length 2.794)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 0 -3.81 90)
					(length 2.794)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "Device:R"
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "R"
				(at 2.032 0 90)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "R"
				(at 0 0 90)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at -1.778 0 90)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "~"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Resistor"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "R res resistor"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "R_*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "R_0_1"
				(rectangle
					(start -1.016 -2.54)
					(end 1.016 2.54)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "R_1_1"
				(pin passive line
					(at 0 3.81 270)
					(length 1.27)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 0 -3.81 90)
					(length 1.27)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "Device:R_Potentiometer"
			(pin_names
				(offset 1.016)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "RV"
				(at -4.445 0 90)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "R_Potentiometer"
				(at -2.54 0 90)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" "~"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Potentiometer"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "resistor variable"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "Potentiometer*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "R_Potentiometer_0_1"
				(rectangle
					(start 1.016 2.54)
					(end -1.016 -2.54)
					(stroke
						(width 0.254)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.143 0) (xy 2.286 0.508) (xy 2.286 -0.508) (xy 1.143 0)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 2.54 0) (xy 1.524 0)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "R_Potentiometer_1_1"
				(pin passive line
					(at 0 3.81 270)
					(length 1.27)
					(name "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 0 -3.81 90)
					(length 1.27)
					(name "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 3.81 0 180)
					(length 1.27)
					(name "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "power:+12V"
			(power)
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "+12V"
				(at 0 3.556 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Power symbol creates a global label with name \"+12V\""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "global power"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "+12V_0_1"
				(polyline
					(pts
						(xy -0.762 1.27) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 2.54) (xy 0.762 1.27)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "+12V_1_1"
				(pin power_in line
					(at 0 0 90)
					(length 0)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "power:-12V"
			(power)
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "-12V"
				(at 0 3.556 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Power symbol creates a global label with name \"-12V\""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "global power"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "-12V_0_0"
				(pin power_in line
					(at 0 0 90)
					(length 0)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(symbol "-12V_0_1"
				(polyline
					(pts
						(xy 0 0) (xy 0 1.27) (xy 0.762 1.27) (xy 0 2.54) (xy -0.762 1.27) (xy 0 1.27)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type outline)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "power:GND"
			(power)
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -6.35 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "GND"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" "Power symbol creates a global label with name \"GND\" , ground"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_keywords" "global power"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "GND_0_1"
				(polyline
					(pts
						(xy 0 0) (xy 0 -1.27) (xy 1.27 -1.27) (xy 0 -2.54) (xy -1.27 -1.27) (xy 0 -1.27)
					)
					(stroke
						(width 0)
						(type default)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "GND_1_1"
				(pin power_in line
					(at 0 0 270)
					(length 0)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
	)
	(junction
		(at 72.39 69.85)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "6a12214b-8217-47f3-928f-11ce9cda0541")
	)
	(junction
		(at 72.39 95.25)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "f768225c-296a-4d64-b5c7-8e4f545bf59c")
	)
	(junction
		(at 72.39 82.55)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "fb3c3982-4cbc-45ff-9cd9-abaee468740f")
	)
	(wire
		(pts
			(xy 83.82 83.82) (xy 83.82 80.01)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "03136a90-46c5-4a01-b7b2-917b573916fb")
	)
	(wire
		(pts
			(xy 83.82 92.71) (xy 66.04 92.71)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0944f83e-be2f-4f4b-a2ba-f485c802bfe7")
	)
	(wire
		(pts
			(xy 102.87 67.31) (xy 107.95 67.31)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "18d3b25c-202b-4899-9a2d-b6f297959c79")
	)
	(wire
		(pts
			(xy 72.39 82.55) (xy 72.39 69.85)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1a6fd872-52b3-4c01-896d-dd523ab84f9b")
	)
	(wire
		(pts
			(xy 83.82 80.01) (xy 66.04 80.01)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1c76a577-6ed5-4ab7-ba90-a859aee946ef")
	)
	(wire
		(pts
			(xy 72.39 95.25) (xy 72.39 82.55)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1e7b77aa-f81f-495f-8f33-e6c18ce22c9f")
	)
	(wire
		(pts
			(xy 102.87 50.8) (xy 107.95 50.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2d52e9e6-9643-4888-b915-f202e551c021")
	)
	(wire
		(pts
			(xy 92.71 83.82) (xy 99.06 83.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "35a1264d-6d3b-4d58-b706-caa776e23c48")
	)
	(wire
		(pts
			(xy 92.71 101.6) (xy 99.06 101.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3a6c9180-9b7d-4a37-a158-fa240f3489bf")
	)
	(wire
		(pts
			(xy 102.87 87.63) (xy 107.95 87.63)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "455d910f-8738-4bba-8b4f-57e924e1da7f")
	)
	(wire
		(pts
			(xy 92.71 63.5) (xy 99.06 63.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "47fdf98d-0f48-485c-865f-35f0a9978339")
	)
	(wire
		(pts
			(xy 72.39 82.55) (xy 66.04 82.55)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4d5eff1d-6d43-4a9c-8444-9693e3e2ea78")
	)
	(wire
		(pts
			(xy 72.39 102.87) (xy 72.39 95.25)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "56b6c9c0-918f-493e-a661-e6ff77594c90")
	)
	(wire
		(pts
			(xy 172.72 35.56) (xy 172.72 38.1)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "60b2e24e-14fc-4f41-97fa-10c56318f4af")
	)
	(wire
		(pts
			(xy 83.82 83.82) (xy 85.09 83.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6fa86d10-d44a-4555-ba3f-0533aae16e24")
	)
	(wire
		(pts
			(xy 72.39 69.85) (xy 72.39 58.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "752897c0-ed8f-4653-b7e5-8cd7fee9545b")
	)
	(wire
		(pts
			(xy 72.39 58.42) (xy 66.04 58.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "776785f1-087b-4d61-b840-5acb0ffb8ae1")
	)
	(wire
		(pts
			(xy 83.82 101.6) (xy 85.09 101.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7f5fff0a-4ed3-4970-bcc4-f8c81a189826")
	)
	(wire
		(pts
			(xy 172.72 57.15) (xy 172.72 53.34)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8b40686b-98fe-486c-b9a7-aa2e6ee489d4")
	)
	(wire
		(pts
			(xy 72.39 69.85) (xy 66.04 69.85)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8bd4bf50-60c8-4e5d-bcd9-146b295b067e")
	)
	(wire
		(pts
			(xy 83.82 101.6) (xy 83.82 92.71)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9e1e9b20-80ae-4e0d-a67b-835cc15f1d5d")
	)
	(wire
		(pts
			(xy 83.82 67.31) (xy 66.04 67.31)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c5216268-e180-4bb7-8d6c-1844ff41b71c")
	)
	(wire
		(pts
			(xy 82.55 46.99) (xy 82.55 55.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "de5bacd3-c4f5-4100-ae46-01a346e3a8c6")
	)
	(wire
		(pts
			(xy 93.98 46.99) (xy 99.06 46.99)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e11b8463-f0be-4b1e-91ea-97f47f40bd32")
	)
	(wire
		(pts
			(xy 83.82 63.5) (xy 85.09 63.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e2c24a4a-6a1d-4a09-8373-a4ce0b26d684")
	)
	(wire
		(pts
			(xy 83.82 63.5) (xy 83.82 67.31)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e3c3c475-ccdc-43f7-aa02-bf084f59a28d")
	)
	(wire
		(pts
			(xy 82.55 55.88) (xy 66.04 55.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f52baf84-b03e-410d-9f29-33328a7dd57a")
	)
	(wire
		(pts
			(xy 102.87 105.41) (xy 107.95 105.41)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f568b1a7-0faf-4672-a93c-353e4b8ccbec")
	)
	(wire
		(pts
			(xy 86.36 46.99) (xy 82.55 46.99)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f7ba42d9-fce8-4d1c-a179-43eb670467f1")
	)
	(wire
		(pts
			(xy 72.39 95.25) (xy 66.04 95.25)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fec13aba-b045-4908-bed6-3141d6a7cb9f")
	)
	(symbol
		(lib_id "Amplifier_Operational:NE5532")
		(at 175.26 45.72 0)
		(unit 3)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "001aae1c-b79d-4fe3-8f74-2cfe74be9ba2")
		(property "Reference" "U1"
			(at 173.99 44.4499 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "NE5532"
			(at 173.99 46.9899 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "Package_DIP:DIP-8_W7.62mm_Socket_LongPads"
			(at 175.26 45.72 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "http://www.ti.com/lit/ds/symlink/ne5532.pdf"
			(at 175.26 45.72 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Dual Low-Noise Operational Amplifiers, DIP-8/SOIC-8"
			(at 175.26 45.72 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "3"
			(uuid "e5ed9963-34a0-4ad9-9914-c8074c195f17")
		)
		(pin "2"
			(uuid "a2dea3d7-52f2-4ca2-b5c5-ceb0141b7f80")
		)
		(pin "5"
			(uuid "636c1959-b98f-4313-91de-b75ee427aa5e")
		)
		(pin "6"
			(uuid "18431aa3-2993-4be1-8747-b29fb520f24e")
		)
		(pin "1"
			(uuid "16512768-5bb1-42c2-80a6-4845973472c0")
		)
		(pin "8"
			(uuid "0f027416-8482-49c5-877f-a455c928b95f")
		)
		(pin "4"
			(uuid "a2e8573c-2389-4647-8081-7df630b9004c")
		)
		(pin "7"
			(uuid "84f92d16-aec0-4392-a781-ff4c88502e21")
		)
		(instances
			(project ""
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "U1")
					(unit 3)
				)
			)
		)
	)
	(symbol
		(lib_id "power:GND")
		(at 99.06 91.44 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "039aaafd-c635-4981-a942-fe07a7d112ae")
		(property "Reference" "#PWR06"
			(at 99.06 97.79 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 99.06 96.52 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 99.06 91.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 99.06 91.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Power symbol creates a global label with name \"GND\" , ground"
			(at 99.06 91.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "e0ed998b-1b3a-4823-9932-1fcbe2ab35b7")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "#PWR06")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:C_Polarized")
		(at 88.9 83.82 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "0a165001-9508-48d7-8f03-4a9383de04e2")
		(property "Reference" "C3"
			(at 89.789 76.2 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10u"
			(at 89.789 78.74 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Capacitor_THT:C_Radial_D5.0mm_H11.0mm_P2.00mm"
			(at 85.09 84.7852 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 88.9 83.82 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Polarized capacitor"
			(at 88.9 83.82 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "fb33cefe-8136-4907-a7e0-90f817d3b541")
		)
		(pin "2"
			(uuid "2d3d7f5f-c0f9-40f8-b2b7-a6984ec7995d")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "C3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Amplifier_Operational:NE5532")
		(at 148.59 77.47 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "24cde4f1-3709-4e91-b70c-866861c34d0a")
		(property "Reference" "U1"
			(at 148.59 67.31 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "NE5532"
			(at 148.59 69.85 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Package_DIP:DIP-8_W7.62mm_Socket_LongPads"
			(at 148.59 77.47 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "http://www.ti.com/lit/ds/symlink/ne5532.pdf"
			(at 148.59 77.47 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Dual Low-Noise Operational Amplifiers, DIP-8/SOIC-8"
			(at 148.59 77.47 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "8"
			(uuid "54687956-f2a5-4324-95e8-b4e74720ed49")
		)
		(pin "4"
			(uuid "11b89092-b616-4d75-a5d3-65cf52f3570d")
		)
		(pin "7"
			(uuid "88ac1aa3-01b2-4be9-9cf1-1f183454b7a4")
		)
		(pin "6"
			(uuid "d99d47f3-80c8-49b9-8d25-83c45db1bcc0")
		)
		(pin "3"
			(uuid "b635eb09-0d60-4270-9c62-b8d2b1a05a80")
		)
		(pin "2"
			(uuid "03789361-df1e-4ab1-a467-e18a1078881f")
		)
		(pin "1"
			(uuid "2d23d8ce-c29b-4ff3-b00a-dce6ce5dfec0")
		)
		(pin "5"
			(uuid "e88e278a-2d99-478d-bed5-2862a6b50ce0")
		)
		(instances
			(project ""
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "U1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:GND")
		(at 99.06 54.61 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "24e60373-47ef-4ea9-a96b-8abb41dff0e2")
		(property "Reference" "#PWR04"
			(at 99.06 60.96 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 99.06 59.69 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 99.06 54.61 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 99.06 54.61 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Power symbol creates a global label with name \"GND\" , ground"
			(at 99.06 54.61 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "54b7f2d2-f002-4e9a-b165-ad0939d041b4")
		)
		(instances
			(project ""
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "#PWR04")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:C_Polarized")
		(at 88.9 63.5 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "2ce6438c-1de8-4b61-8df0-e96103e47787")
		(property "Reference" "C2"
			(at 89.789 55.88 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10u"
			(at 89.789 58.42 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Capacitor_THT:C_Radial_D5.0mm_H11.0mm_P2.00mm"
			(at 85.09 64.4652 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 88.9 63.5 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Polarized capacitor"
			(at 88.9 63.5 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "d419761c-c7e3-49fd-b982-bd41c5d2cf44")
		)
		(pin "2"
			(uuid "6ab2c823-df31-460c-80d5-c3b61e1d452b")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "C2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:C_Polarized")
		(at 88.9 101.6 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "311a0c42-41e4-4c38-818d-7e2da9aa3f57")
		(property "Reference" "C4"
			(at 89.789 93.98 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10u"
			(at 89.789 96.52 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Capacitor_THT:C_Radial_D5.0mm_H11.0mm_P2.00mm"
			(at 85.09 102.5652 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 88.9 101.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Polarized capacitor"
			(at 88.9 101.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "52981d62-e3ea-4230-90e3-c4193234be36")
		)
		(pin "2"
			(uuid "d0413503-1e67-4203-a133-3945de61faa3")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "C4")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:C_Polarized")
		(at 90.17 46.99 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "31f259e9-c62f-4f88-ae92-231861dc422a")
		(property "Reference" "C1"
			(at 91.059 39.37 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10u"
			(at 91.059 41.91 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Capacitor_THT:C_Radial_D5.0mm_H11.0mm_P2.00mm"
			(at 86.36 47.9552 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 90.17 46.99 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Polarized capacitor"
			(at 90.17 46.99 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "da11bb8d-f5ea-4488-9c01-2fc940deb38a")
		)
		(pin "2"
			(uuid "1b614239-9c06-48db-9843-dd6f14868bdd")
		)
		(instances
			(project ""
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "C1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:R")
		(at 111.76 50.8 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "36a4eb34-8bfe-40cb-995d-0b843ab8d45d")
		(property "Reference" "R1"
			(at 111.76 44.45 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10K"
			(at 111.76 46.99 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal"
			(at 111.76 49.022 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 111.76 50.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Resistor"
			(at 111.76 50.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "efbf9796-cee2-4753-af91-ace550e1767b")
		)
		(pin "2"
			(uuid "ca3cfdcf-9ce1-4de9-b871-f0da883a0aa6")
		)
		(instances
			(project ""
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "R1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:GND")
		(at 72.39 102.87 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "558cdec1-9a49-4ffd-b822-317210c2fd53")
		(property "Reference" "#PWR03"
			(at 72.39 109.22 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 72.39 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 72.39 102.87 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 72.39 102.87 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Power symbol creates a global label with name \"GND\" , ground"
			(at 72.39 102.87 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "75514209-72a1-49c6-93c3-8cba07106484")
		)
		(instances
			(project ""
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "#PWR03")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Connector:Conn_01x02_Pin")
		(at 60.96 55.88 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "63162a42-5d55-4437-9578-29b9a361b1ac")
		(property "Reference" "J1"
			(at 61.595 50.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "Mic1"
			(at 61.595 53.34 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical"
			(at 60.96 55.88 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 60.96 55.88 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Generic connector, single row, 01x02, script generated"
			(at 60.96 55.88 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "2"
			(uuid "51cb8186-c589-4475-aee8-a08cb2df167c")
		)
		(pin "1"
			(uuid "7ef1c664-56aa-4fdc-be16-232bf91b380e")
		)
		(instances
			(project ""
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "J1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:GND")
		(at 99.06 71.12 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "66eea324-ad11-4b2a-a889-69ca52d4ab21")
		(property "Reference" "#PWR05"
			(at 99.06 77.47 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 99.06 76.2 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 99.06 71.12 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 99.06 71.12 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Power symbol creates a global label with name \"GND\" , ground"
			(at 99.06 71.12 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "edd5a51a-69c6-4c63-97cd-bd79bedd803f")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "#PWR05")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:R_Potentiometer")
		(at 99.06 50.8 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "7039f052-7a71-4934-a4eb-3dc825b86635")
		(property "Reference" "RV1"
			(at 96.52 49.5299 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "10K"
			(at 96.52 52.0699 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" "Potentiometer_THT:Potentiometer_Bourns_3386W_Horizontal"
			(at 99.06 50.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 99.06 50.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Potentiometer"
			(at 99.06 50.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "2"
			(uuid "daa3a8de-9f2a-4f1e-b93d-a3a2bfaa3c63")
		)
		(pin "3"
			(uuid "bbd88ea2-a7a8-4538-a700-d31d44410405")
		)
		(pin "1"
			(uuid "11737db6-3bc1-4231-936c-ae47ebb25d2e")
		)
		(instances
			(project ""
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "RV1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:R")
		(at 111.76 105.41 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "76668492-31aa-4fb8-80ca-f2f0a099eb1d")
		(property "Reference" "R4"
			(at 111.76 99.06 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10K"
			(at 111.76 101.6 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal"
			(at 111.76 103.632 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 111.76 105.41 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Resistor"
			(at 111.76 105.41 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "144d4103-b0ba-4363-9332-29e5914e04aa")
		)
		(pin "2"
			(uuid "7bda5076-aebe-48a5-9aa9-d9c352b550f6")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "R4")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:+12V")
		(at 172.72 35.56 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "7d1f4f63-5262-487c-8b7c-b5a9b0f2b3e9")
		(property "Reference" "#PWR01"
			(at 172.72 39.37 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+12V"
			(at 172.72 30.48 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 172.72 35.56 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 172.72 35.56 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Power symbol creates a global label with name \"+12V\""
			(at 172.72 35.56 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "0aaf73fb-5c26-44e6-a660-6da7ecb4f39f")
		)
		(instances
			(project ""
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "#PWR01")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Connector:Conn_01x02_Pin")
		(at 60.96 67.31 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "85cf78fc-f3f0-4b0c-9a8f-6418be7455c6")
		(property "Reference" "J2"
			(at 61.595 62.23 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "Mic2"
			(at 61.595 64.77 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical"
			(at 60.96 67.31 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 60.96 67.31 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Generic connector, single row, 01x02, script generated"
			(at 60.96 67.31 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "2"
			(uuid "911b8aa8-3bb2-4682-af4a-15aa69a6039a")
		)
		(pin "1"
			(uuid "a386a935-d4cf-47d4-a9d5-8959b1d00e12")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "J2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Connector:Conn_01x02_Pin")
		(at 60.96 92.71 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "8a763865-fefb-4593-bacc-39bce597f8cd")
		(property "Reference" "J4"
			(at 61.595 87.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "Line In"
			(at 61.595 90.17 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical"
			(at 60.96 92.71 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 60.96 92.71 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Generic connector, single row, 01x02, script generated"
			(at 60.96 92.71 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "2"
			(uuid "e7beeea4-95c8-43e9-8a0e-5f4413faf115")
		)
		(pin "1"
			(uuid "fd64f7fe-681c-4a22-ac8a-302871bd2546")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "J4")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Connector:Conn_01x02_Pin")
		(at 60.96 80.01 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "8f035194-7af2-4359-bb8e-f1722815878c")
		(property "Reference" "J3"
			(at 61.595 74.93 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "Guitar"
			(at 61.595 77.47 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical"
			(at 60.96 80.01 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 60.96 80.01 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Generic connector, single row, 01x02, script generated"
			(at 60.96 80.01 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "2"
			(uuid "9994eac0-5d59-4947-b509-6d920b0bcd73")
		)
		(pin "1"
			(uuid "e375cc3a-1cdc-45e4-9a8e-2a506be8a621")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "J3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:R_Potentiometer")
		(at 99.06 105.41 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "91284dfb-bd28-4181-9972-f40dc678b808")
		(property "Reference" "RV4"
			(at 96.52 104.1399 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "10K"
			(at 96.52 106.6799 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" "Potentiometer_THT:Potentiometer_Bourns_3386W_Horizontal"
			(at 99.06 105.41 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 99.06 105.41 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Potentiometer"
			(at 99.06 105.41 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "2"
			(uuid "8a9be432-425b-41e9-9263-662370c0e7b9")
		)
		(pin "3"
			(uuid "93c7af4d-19a2-42b3-bc2d-b3387e71e025")
		)
		(pin "1"
			(uuid "4d479b69-544d-4888-8d96-db46335c90f0")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "RV4")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Amplifier_Operational:NE5532")
		(at 172.72 99.06 0)
		(unit 2)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "a5f8f6b7-d05f-4bc1-af75-1b3970e1bc07")
		(property "Reference" "U1"
			(at 172.72 88.9 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "NE5532"
			(at 172.72 91.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Package_DIP:DIP-8_W7.62mm_Socket_LongPads"
			(at 172.72 99.06 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "http://www.ti.com/lit/ds/symlink/ne5532.pdf"
			(at 172.72 99.06 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Dual Low-Noise Operational Amplifiers, DIP-8/SOIC-8"
			(at 172.72 99.06 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "8"
			(uuid "54687956-f2a5-4324-95e8-b4e74720ed49")
		)
		(pin "4"
			(uuid "11b89092-b616-4d75-a5d3-65cf52f3570d")
		)
		(pin "7"
			(uuid "88ac1aa3-01b2-4be9-9cf1-1f183454b7a4")
		)
		(pin "6"
			(uuid "d99d47f3-80c8-49b9-8d25-83c45db1bcc0")
		)
		(pin "3"
			(uuid "b635eb09-0d60-4270-9c62-b8d2b1a05a80")
		)
		(pin "2"
			(uuid "03789361-df1e-4ab1-a467-e18a1078881f")
		)
		(pin "1"
			(uuid "2d23d8ce-c29b-4ff3-b00a-dce6ce5dfec0")
		)
		(pin "5"
			(uuid "e88e278a-2d99-478d-bed5-2862a6b50ce0")
		)
		(instances
			(project ""
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "U1")
					(unit 2)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:R_Potentiometer")
		(at 99.06 67.31 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "b4689fe5-dff6-4097-b60f-5ef5abe47463")
		(property "Reference" "RV2"
			(at 96.52 66.0399 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "10K"
			(at 96.52 68.5799 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" "Potentiometer_THT:Potentiometer_Bourns_3386W_Horizontal"
			(at 99.06 67.31 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 99.06 67.31 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Potentiometer"
			(at 99.06 67.31 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "2"
			(uuid "b7fb6292-dc7e-479f-b77b-009450926822")
		)
		(pin "3"
			(uuid "ddda9b66-0ea4-4858-b6a4-b278321f5872")
		)
		(pin "1"
			(uuid "6be8bb95-73fd-4b79-a49d-7225e7d32ead")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "RV2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:R")
		(at 111.76 67.31 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "c03a2d8a-6ae8-474b-9517-44ecf95e5e0d")
		(property "Reference" "R2"
			(at 111.76 60.96 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10K"
			(at 111.76 63.5 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal"
			(at 111.76 65.532 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 111.76 67.31 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Resistor"
			(at 111.76 67.31 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "1a150a29-9855-4c32-b5b7-e6c9405d20df")
		)
		(pin "2"
			(uuid "d9a65d98-387e-4ff5-8339-fc3b7e88d509")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "R2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:-12V")
		(at 172.72 57.15 180)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "c46fc206-d31c-488d-b273-2a031ec2b494")
		(property "Reference" "#PWR02"
			(at 172.72 53.34 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "-12V"
			(at 172.72 62.23 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 172.72 57.15 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 172.72 57.15 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Power symbol creates a global label with name \"-12V\""
			(at 172.72 57.15 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "fb28af88-967f-4db2-a2a9-95c712836e0d")
		)
		(instances
			(project ""
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "#PWR02")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:R_Potentiometer")
		(at 99.06 87.63 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "cfa1f0d6-2566-4521-b708-dfbd91096515")
		(property "Reference" "RV3"
			(at 96.52 86.3599 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "10K"
			(at 96.52 88.8999 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" "Potentiometer_THT:Potentiometer_Bourns_3386W_Horizontal"
			(at 99.06 87.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 99.06 87.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Potentiometer"
			(at 99.06 87.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "2"
			(uuid "51f45744-2863-4107-a8bb-5cb3c9fa2fcc")
		)
		(pin "3"
			(uuid "7c2d6fed-c41e-4adb-b3e2-f1c1db4a9e85")
		)
		(pin "1"
			(uuid "9023aa6f-746c-4e3f-bcc9-5890f72e9417")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "RV3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "Device:R")
		(at 111.76 87.63 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "d0706a4d-0f8e-4dcb-9471-c82e8c12dc46")
		(property "Reference" "R3"
			(at 111.76 81.28 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10K"
			(at 111.76 83.82 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal"
			(at 111.76 85.852 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "~"
			(at 111.76 87.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Resistor"
			(at 111.76 87.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "aa1e5277-817c-436b-89aa-363df545ca86")
		)
		(pin "2"
			(uuid "2900359f-d24b-4cf4-863f-2f4192e534b1")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "R3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "power:GND")
		(at 99.06 109.22 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(fields_autoplaced yes)
		(uuid "f9338a22-9773-4195-8c47-794ad313589a")
		(property "Reference" "#PWR07"
			(at 99.06 115.57 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 99.06 114.3 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 99.06 109.22 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 99.06 109.22 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" "Power symbol creates a global label with name \"GND\" , ground"
			(at 99.06 109.22 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "df232056-0477-4b03-9254-1cb92693d654")
		)
		(instances
			(project "4ch_mixer"
				(path "/6b0dd91b-4cb4-45c5-9b77-779b58f615d5"
					(reference "#PWR07")
					(unit 1)
				)
			)
		)
	)
	(sheet_instances
		(path "/"
			(page "1")
		)
	)
	(embedded_fonts no)
)
