#!/bin/bash
dt_remove=$(qdbus --literal org.kde.KWin /VirtualDesktopManager desktops | grep "[0-9a-z\-]\{36\}" -o | tail -1) && qdbus org.kde.KWin /VirtualDesktopManager removeDesktop $dt_remove
