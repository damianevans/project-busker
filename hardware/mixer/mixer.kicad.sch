(kicad_sch (version 20230121) (generator grok)

  (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f)

  (paper "A4")

  (lib_symbols
    (symbol "Device:R" (pin passive line (at 0 2.54 270) (length 1.27) (name "1" (effects (font (size 1.27 1.27)))) (number "1" (effects (font (size 1.27 1.27)))))
      (pin passive line (at 0 -2.54 90) (length 1.27) (name "2" (effects (font (size 1.27 1.27)))) (number "2" (effects (font (size 1.27 1.27)))))
      (polyline (pts (xy -2.54 -1.27) (xy 0 -1.27) (xy 0.508 -0.762) (xy -0.508 -0.254) (xy 0.508 0.254) (xy -0.508 0.762) (xy 0.508 1.27) (xy -2.54 1.27)) (stroke (width 0) (type default)) (fill (type none)))
      (property "Reference" "R" (at 0 3.81 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
      (property "Value" "R" (at 0 -3.81 0) (effects (font (size 1.27 1.27)) (justify left top)))
    )
    (symbol "Device:C" (pin passive line (at 0 2.54 270) (length 1.27) (name "1" (effects (font (size 1.27 1.27)))) (number "1" (effects (font (size 1.27 1.27)))))
      (pin passive line (at 0 -2.54 90) (length 1.27) (name "2" (effects (font (size 1.27 1.27)))) (number "2" (effects (font (size 1.27 1.27)))))
      (rectangle (start -1.27 -2.286) (end 1.27 -1.778) (stroke (width 0) (type default)) (fill (type none)))
      (rectangle (start -1.27 1.778) (end 1.27 2.286) (stroke (width 0) (type default)) (fill (type none)))
      (property "Reference" "C" (at 0 3.81 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
      (property "Value" "C" (at 0 -3.81 0) (effects (font (size 1.27 1.27)) (justify left top)))
    )
    (symbol "Device:Pot" (pin passive line (at -2.54 0 0) (length 1.27) (name "1" (effects (font (size 1.27 1.27)))) (number "1" (effects (font (size 1.27 1.27)))))
      (pin passive line (at 0 2.54 270) (length 1.27) (name "2" (effects (font (size 1.27 1.27)))) (number "2" (effects (font (size 1.27 1.27)))))
      (pin passive line (at 2.54 0 180) (length 1.27) (name "3" (effects (font (size 1.27 1.27)))) (number "3" (effects (font (size 1.27 1.27)))))
      (polyline (pts (xy -1.27 -1.27) (xy 1.27 -1.27) (xy 0 1.27)) (stroke (width 0) (type default)) (fill (type none)))
      (property "Reference" "RV" (at 0 3.81 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
      (property "Value" "Pot" (at 0 -3.81 0) (effects (font (size 1.27 1.27)) (justify left top)))
    )
    (symbol "Amplifier:NE5532" (in_bom yes) (on_board yes)
      (property "Reference" "U" (at 0 5.08 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
      (property "Value" "NE5532" (at 0 -5.08 0) (effects (font (size 1.27 1.27)) (justify left top)))
      (symbol "NE5532_1_1"
        (polyline (pts (xy -5.08 2.54) (xy 5.08 0) (xy -5.08 -2.54) (xy -5.08 2.54)) (stroke (width 0) (type default)) (fill (type none)))
        (pin input line (at -7.62 1.27 0) (length 2.54) (name "IN1-" (effects (font (size 1.27 1.27)))) (number "2" (effects (font (size 1.27 1.27)))))
        (pin input line (at -7.62 -1.27 0) (length 2.54) (name "IN1+" (effects (font (size 1.27 1.27)))) (number "3" (effects (font (size 1.27 1.27)))))
        (pin output line (at 7.62 0 180) (length 2.54) (name "OUT1" (effects (font (size 1.27 1.27)))) (number "1" (effects (font (size 1.27 1.27)))))
      )
      (symbol "NE5532_2_1"
        (polyline (pts (xy -5.08 -2.54) (xy 5.08 0) (xy -5.08 2.54) (xy -5.08 -2.54)) (stroke (width 0) (type default)) (fill (type none)))
        (pin input line (at -7.62 -1.27 0) (length 2.54) (name "IN2+" (effects (font (size 1.27 1.27)))) (number "5" (effects (font (size 1.27 1.27)))))
        (pin input line (at -7.62 1.27 0) (length 2.54) (name "IN2-" (effects (font (size 1.27 1.27)))) (number "6" (effects (font (size 1.27 1.27)))))
        (pin output line (at 7.62 0 180) (length 2.54) (name "OUT2" (effects (font (size 1.27 1.27)))) (number "7" (effects (font (size 1.27 1.27)))))
      )
      (symbol "NE5532_0_0"
        (pin power_in line (at 0 7.62 270) (length 2.54) (name "V+" (effects (font (size 1.27 1.27)))) (number "8" (effects (font (size 1.27 1.27)))))
        (pin power_in line (at 0 -7.62 90) (length 2.54) (name "V-" (effects (font (size 1.27 1.27)))) (number "4" (effects (font (size 1.27 1.27)))))
      )
    )
    (symbol "power:+12V" (power) (pin power_in stack (at 0 0 0) (length 0) (name "+12V" (effects (font (size 1.27 1.27)))) (number "1" (effects (font (size 1.27 1.27)))))
      (property "Reference" "#PWR" (at 0 -2.54 0) (effects (font (size 1.27 1.27)) (hide yes)))
      (property "Value" "+12V" (at 0 3.81 0) (effects (font (size 1.27 1.27))))
    )
    (symbol "power:-12V" (power) (pin power_in stack (at 0 0 0) (length 0) (name "-12V" (effects (font (size 1.27 1.27)))) (number "1" (effects (font (size 1.27 1.27)))))
      (property "Reference" "#PWR" (at 0 -2.54 0) (effects (font (size 1.27 1.27)) (hide yes)))
      (property "Value" "-12V" (at 0 3.81 0) (effects (font (size 1.27 1.27))))
    )
    (symbol "power:GND" (power) (pin power_in stack (at 0 0 0) (length 0) (name "GND" (effects (font (size 1.27 1.27)))) (number "1" (effects (font (size 1.27 1.27)))))
      (property "Reference" "#PWR" (at 0 -2.54 0) (effects (font (size 1.27 1.27)) (hide yes)))
      (property "Value" "GND" (at 0 3.81 0) (effects (font (size 1.27 1.27))))
    )
  )

  (symbol (lib_id "Amplifier:NE5532") (at 100 100 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e70)
    (property "Reference" "IC1" (at 100 105 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "NE5532" (at 100 110 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "IC1") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Amplifier:NE5532") (at 200 100 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e71)
    (property "Reference" "IC2" (at 200 105 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "NE5532" (at 200 110 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "IC2") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:C") (at 50 50 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e72)
    (property "Reference" "C1" (at 50 55 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "1uF" (at 50 60 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "C1") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:C") (at 50 70 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e73)
    (property "Reference" "C2" (at 50 75 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "1uF" (at 50 80 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "C2") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:C") (at 50 90 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e74)
    (property "Reference" "C3" (at 50 95 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "1uF" (at 50 100 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "C3") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:C") (at 50 110 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e75)
    (property "Reference" "C4" (at 50 115 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "1uF" (at 50 120 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "C4") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:C") (at 150 150 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e76)
    (property "Reference" "Cline" (at 150 155 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "1uF" (at 150 160 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "Cline") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:C" ) (at 170 150 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e77)
    (property "Reference" "Chp" (at 170 155 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "1uF" (at 170 160 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "Chp") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:C") (at 50 130 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e78)
    (property "Reference" "C+" (at 50 135 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "100uF electrolytic (+ to +12V)" (at 50 140 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "C+") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:C") (at 50 150 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e79)
    (property "Reference" "C-" (at 50 155 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "100uF electrolytic (+ to GND)" (at 50 160 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "C-") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:C") (at 60 130 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e7a)
    (property "Reference" "Cp+" (at 60 135 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "0.1uF" (at 60 140 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "Cp+") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:C") (at 60 150 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e7b)
    (property "Reference" "Cp-" (at 60 155 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "0.1uF" (at 60 160 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "Cp-") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:Pot") (at 70 50 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e7c)
    (property "Reference" "Pot1" (at 70 55 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "100k log" (at 70 60 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "Pot1") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:Pot") (at 70 70 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e7d)
    (property "Reference" "Pot2" (at 70 75 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "100k log" (at 70 80 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "Pot2") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:Pot") (at 70 90 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e7e)
    (property "Reference" "Pot3" (at 70 95 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "100k log" (at 70 100 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "Pot3") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:Pot") (at 70 110 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e7f)
    (property "Reference" "Pot4" (at 70 115 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "100k log" (at 70 120 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "Pot4") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:Pot") (at 180 150 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e80)
    (property "Reference" "PotHP" (at 180 155 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "10k log" (at 180 160 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "PotHP") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:R") (at 80 50 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e81)
    (property "Reference" "R1" (at 80 55 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "100k" (at 80 60 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "R1") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:R") (at 80 70 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e82)
    (property "Reference" "R2" (at 80 75 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "100k" (at 80 80 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "R2") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:R") (at 80 90 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e83)
    (property "Reference" "R3" (at 80 95 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "100k" (at 80 100 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "R3") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:R") (at 80 110 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e84)
    (property "Reference" "R4" (at 80 115 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "100k" (at 80 120 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "R4") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:R") (at 110 90 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e85)
    (property "Reference" "Rf" (at 110 95 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "100k" (at 110 100 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "Rf") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:R") (at 210 90 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e86)
    (property "Reference" "RiL" (at 210 95 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "10k" (at 210 100 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "RiL") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:R") (at 210 110 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e87)
    (property "Reference" "RiR" (at 210 115 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "10k" (at 210 120 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "RiR") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:R") (at 220 90 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e88)
    (property "Reference" "RfL" (at 220 95 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "10k" (at 220 100 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "RfL") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:R") (at 220 110 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e89)
    (property "Reference" "RfR" (at 220 115 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "10k" (at 220 120 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "RfR") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:R") (at 230 90 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e8a)
    (property "Reference" "RhpL" (at 230 95 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "47R" (at 230 100 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "RhpL") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "Device:R") (at 230 110 0) (unit 1)
    (in_bom yes) (on_board yes)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e8b)
    (property "Reference" "RhpR" (at 230 115 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (property "Value" "47R" (at 230 120 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "RhpR") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "power:+12V") (at 100 80 0) (unit 1)
    (in_bom no) (on_board no)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e8c)
    (property "Reference" "#PWR01" (at 0 -2.54 0) (effects (font (size 1.27 1.27)) (hide yes)))
    (property "Value" "+12V" (at 0 3.81 0) (effects (font (size 1.27 1.27))))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "#PWR01") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "power:-12V") (at 100 120 0) (unit 1)
    (in_bom no) (on_board no)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e8d)
    (property "Reference" "#PWR02" (at 0 -2.54 0) (effects (font (size 1.27 1.27)) (hide yes)))
    (property "Value" "-12V" (at 0 3.81 0) (effects (font (size 1.27 1.27))))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "#PWR02") (unit 1)
        )
      )
    )
  )

  (symbol (lib_id "power:GND") (at 100 110 0) (unit 1)
    (in_bom no) (on_board no)
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e8e)
    (property "Reference" "#PWR03" (at 0 -2.54 0) (effects (font (size 1.27 1.27)) (hide yes)))
    (property "Value" "GND" (at 0 3.81 0) (effects (font (size 1.27 1.27))))
    (instances
      (project "mixer"
        (path "/8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e6f"
          (reference "#PWR03") (unit 1)
        )
      )
    )
  )

  (label "Input1" (at 40 50 0) (effects (font (size 1.27 1.27)))
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e8f)
  )

  (label "Input2" (at 40 70 0) (effects (font (size 1.27 1.27)))
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e90)
  )

  (label "Input3" (at 40 90 0) (effects (font (size 1.27 1.27)))
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e91)
  )

  (label "Input4" (at 40 110 0) (effects (font (size 1.27 1.27)))
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e92)
  )

  (label "Line Out" (at 160 150 0) (effects (font (size 1.27 1.27)))
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e93)
  )

  (label "HP Left" (at 240 90 0) (effects (font (size 1.27 1.27)))
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e94)
  )

  (label "HP Right" (at 240 110 0) (effects (font (size 1.27 1.27)))
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e95)
  )

  (label "HP GND" (at 240 100 0) (effects (font (size 1.27 1.27)))
    (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e96)
  )

  (wire (pts (xy 40 50) (xy 50 50)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e97))
  (wire (pts (xy 50 50) (xy 70 50)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e98))
  (wire (pts (xy 70 50) (xy 80 50)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e99))
  (wire (pts (xy 80 50) (xy 92.38 100)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e9a))  ; To summing point IC1 Pin6

  (wire (pts (xy 40 70) (xy 50 70)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e9b))
  (wire (pts (xy 50 70) (xy 70 70)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e9c))
  (wire (pts (xy 70 70) (xy 80 70)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e9d))
  (wire (pts (xy 80 70) (xy 92.38 100)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e9e))  ; To summing

  (wire (pts (xy 40 90) (xy 50 90)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5e9f))
  (wire (pts (xy 50 90) (xy 70 90)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ea0))
  (wire (pts (xy 70 90) (xy 80 90)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ea1))
  (wire (pts (xy 80 90) (xy 92.38 100)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ea2))  ; To summing

  (wire (pts (xy 40 110) (xy 50 110)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ea3))
  (wire (pts (xy 50 110) (xy 92.38 98.73)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ea4))  ; To IC1 Pin3 (buffer in+)
  (wire (pts (xy 107.62 100) (xy 70 110)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ea5))  ; Buffer out to Pot4
  (wire (pts (xy 70 110) (xy 80 110)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ea6))
  (wire (pts (xy 80 110) (xy 92.38 100)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ea7))  ; To summing

  (wire (pts (xy 92.38 100) (xy 92.38 100)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ea8))  ; Summing point to IC1 Pin6

  (wire (pts (xy 92.38 98.73) (xy 92.38 101.27)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ea9))  ; GND to IC1 Pin5

  (wire (pts (xy 107.62 100) (xy 110 90)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eaa))  ; IC1 Pin7 (mix out) to Rf

  (wire (pts (xy 110 90) (xy 92.38 100)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eab))  ; Rf to summing (feedback)

  (wire (pts (xy 107.62 100) (xy 150 150)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eac))  ; Mix out to Cline

  (wire (pts (xy 150 150) (xy 160 150)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ead))  ; Cline to line out

  (wire (xy 107.62 100) (xy 170 150) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eae))  ; Mix out to Chp

  (wire (pts (xy 170 150) (xy 180 150)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eaf))  ; Chp to PotHP

  (wire (pts (xy 180 150) (xy 210 90)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eb0))  ; PotHP wiper to RiL

  (wire (pts (xy 180 150) (xy 210 110)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eb1))  ; PotHP wiper to RiR

  (wire (pts (xy 210 90) (xy 192.38 100)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eb2))  ; RiL to IC2 Pin2

  (wire (pts (xy 210 110) (xy 192.38 98.73)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eb3))  ; RiR to IC2 Pin6

  (wire (pts (xy 192.38 101.27) (xy 192.38 100)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eb4))  ; GND to IC2 Pin3

  (wire (pts (xy 192.38 98.73) (xy 192.38 98.73)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eb5))  ; GND to IC2 Pin5

  (wire (pts (xy 207.62 100) (xy 220 90)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eb6))  ; IC2 Pin1 to RfL

  (wire (pts (xy 220 90) (xy 192.38 100)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eb7))  ; RfL to IC2 Pin2

  (wire (pts (xy 207.62 98.73) (xy 220 110)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eb8))  ; IC2 Pin7 to RfR

  (wire (pts (xy 220 110) (xy 192.38 98.73)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eb9))  ; RfR to IC2 Pin6

  (wire (pts (xy 207.62 100) (xy 230 90)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eba))  ; IC2 Pin1 to RhpL

  (wire (pts (xy 230 90) (xy 240 90)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ebb))  ; RhpL to HP Left

  (wire (pts (xy 207.62 98.73) (xy 230 110)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ebc))  ; IC2 Pin7 to RhpR

  (wire (pts (xy 230 110) (xy 240 110)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ebd))  ; RhpR to HP Right

  (wire (pts (xy 100 80) (xy 100 92.38)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ebe))  ; +12V to IC1 Pin8

  (wire (pts (xy 100 107.62) (xy 100 120)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ebf))  ; IC1 Pin4 to -12V

  (wire (pts (xy 200 80) (xy 200 92.38)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ec0))  ; +12V to IC2 Pin8

  (wire (pts (xy 200 107.62) (xy 200 120)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ec1))  ; IC2 Pin4 to -12V

  (wire (pts (xy 100 110) (xy 92.38 98.73)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ec2))  ; GND to IC1 Pin5

  (wire (pts (xy 100 110) (xy 192.38 101.27)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ec3))  ; GND to IC2 Pin3

  (wire (xy 100 110) (xy 192.38 98.73) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ec4))  ; GND to IC2 Pin5

  (wire (pts (xy 100 110) (xy 70 52.54)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ec5))  ; GND to Pot1 bottom

  (wire (pts (xy 100 110) (xy 70 72.54)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ec6))  ; GND to Pot2 bottom

  (wire (pts (xy 100 110) (xy 70 92.54)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ec7))  ; GND to Pot3 bottom

  (wire (pts (xy 100 110) (xy 70 112.54)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ec8))  ; GND to Pot4 bottom

  (wire (pts (xy 100 110) (xy 180 152.54)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ec9))  ; GND to PotHP bottom

  (wire (pts (xy 50 130) (xy 100 80)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5eca))  ; C+ to +12V

  (wire (pts (xy 50 130) (xy 60 130)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ecb))  ; C+ to Cp+

  (wire (pts (xy 60 130) (xy 100 110)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ecc))  ; Cp+ to GND

  (wire (pts (xy 50 150) (xy 100 110)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ecd))  ; C- to GND

  (wire (pts (xy 50 150) (xy 60 150)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ece))  ; C- to Cp-

  (wire (pts (xy 60 150) (xy 100 120)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ecf))  ; Cp- to -12V

  (wire (pts (xy 100 110) (xy 240 100)) (stroke (width 0) (type solid) (color 0 0 0 0)) (uuid 8a5b4d3e-4a6b-4b1f-a8e8-1a2b3c4d5ed0))  ; GND to HP GND

)
