from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

bg      = "#1E1E2E"
bg_alt  = "#3A3D4F"
fg      = "#CDD6F4"
fg_alt  = "#A6ADC8"
accent  = "#89B4F4"
red     = "#F38BA8"
yellow  = "#F9E2AF"
green   = "#A6E3A1"

class Scheme(ColorScheme):
    progress_bar_color = accent

    def use(self, context):
        fg, bg = default_colors

        if context.reset:
            return default_colors

        if context.in_browser:
            if context.selected:
                return fg, accent
            if context.directory:
                return accent, bg
            if context.executable:
                return green, bg
            if context.error:
                return red, bg

        if context.in_titlebar:
            return fg, bg

        if context.in_statusbar:
            return fg, bg_alt

        return fg, bg

