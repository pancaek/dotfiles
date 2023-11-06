#!/usr/bin/env python3

# Taken from MATE-HUD github.com/ubuntu-mate/mate-hud
# Used for rofi css

# Usage
# ./file_gtk_style.py [input file] > [output file]

# examples
# background-color: {@theme_bg_color}

# see the array below for list of style context to use

import sys

if len(sys.argv) < 2:
	sys.exit(1)

import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gio, GLib, Gtk

#Converts from rgba <GTK R, G, B> to hex #RRGGBB
def rgba_to_hex(color):
	return "#{0:02x}{1:02x}{2:02x}".format(int(color.red * 255), int(color.green * 255), int(color.blue * 255))

window = Gtk.Window()
style_context = window.get_style_context()

#List of style contexts
lists = [
	# gtk-3.0 Default
	'theme_bg_color', 'theme_fg_color',
	'theme_selected_bg_color', 'theme_selected_fg_color',
	'theme_unfocused_fg_color', 'theme_text_color',
	'warning_bg_color', 'warning_fg_color',
	'info_bg_color', 'info_fg_color',
	'error_bg_color',

	# gtk-4.0 | Supported by adw-gtk3 theme and Gradience.
	"accent_color", "accent_bg_color",
	"window_bg_color", "window_fg_color",
	"view_bg_color", "view_fg_color",
	"headerbar_bg_color", "headerbar_fg_color",
	"card_bg_color", "card_fg_color",
	"dialog_bg_color", "dialog_fg_color",
	"popover_bg_color", "popover_fg_color",
	"shade_color"
]

with open(sys.argv[1]) as f:
	file=f.read()
	for style in lists:
		file=file.replace("{@" + style + "}", rgba_to_hex(style_context.lookup_color(style)[1]))
	print(file)
