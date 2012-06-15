rem Super USB Remote Shoot script
rem Usage: Select "Enable Remote" in "Remote parameters" and start this script.
@title Super remote
@param c Number of shots
@default c 1
@param b Start shot delay
@default b 0

while 1
    wait_click 1000
    if is_key "shoot_half" then gosub "set_focus"
    if is_key "left" then gosub "focus_mode"
    if is_key "right" then gosub "wb"
    if is_key "up" then gosub "zoom_in"
    if is_key "down" then gosub "zoom_out"
    if is_key "set" then gosub "faster"
    if is_key "menu" then gosub "slower"
    if is_key "remote" then gosub "shoot_nao"
wend

:shoot_nao
    sleep (b * 100)
    for d = 1 to c 
        shoot_full
        sleep 100
    next d
    return

:set_focus
    press "shoot_half"
    sleep 2500
    release "shoot_half"
    return

:focus_mode
    click "left"
    click "left"
    sleep 750
    click "set"
    return

:flash_mode
    click "right"
    click "right"
    sleep 750
    click "set"
    return

:zoom_in
    get_zoom a
    a = a + 1
    if a > 6 then b = 6
    set_zoom a
    print "Zoom set to", a
    sleep 500
    return

:zoom_out
    set_zoom 0
    print "Zoom set to 0"
    sleep 500
    return

:wb
    click "set"
    sleep 100
    click "down"
    sleep 100
    click "down"
    sleep 100
    click "down"
    sleep 100
    click "right"
    sleep 500
    click "up"
    sleep 100
    click "up"
    sleep 100
    click "up"
    sleep 100
    click "set"
    return

rem By default this changes the EV
rem In "night mode" this changes the shutter speed
:slower
    click "set"
    sleep 100
    click "down"
    sleep 100
    click "left"
    sleep 750
    click "up"
    sleep 100
    click "set"
    return

:faster
    click "set"
    sleep 100
    click "down"
    sleep 100
    click "right"
    sleep 750
    click "up"
    sleep 100
    click "set"
    return
    
end

