#!/bin/bash
dt_add=$(($(qdbus org.kde.KWin /VirtualDesktopManager count)+1)) && qdbus org.kde.KWin /VirtualDesktopManager createDesktop $dt_add $dt_add
