i3-msg 'workspace 1:term; exec urxvt; exec urxvt; exec urxvt'
#i3-msg 'exec urxvt'
#i3-msg 'exec urxvt'
#i3-msg 'exec urxvt'
sleep 1
#i3-msg 'workspace 3:www'
#i3-msg 'exec firefox'
i3-msg 'workspace 9:logs; exec urxvt -e journalctl -ef; exec urxvt -e journalctl --user -ef'
# i3-msg 'exec urxvt -e journalctl -ef'
# i3-msg 'exec urxvt -e journalctl --user -ef'

i3-msg 'workspace 1:term'
