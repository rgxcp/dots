# |=============================|
# | ▒█▀▀█ ▀▀█▀▀ ▀█▀ ▒█░░░ ▒█▀▀▀ |
# | ▒█░▒█ ░▒█░░ ▒█░ ▒█░░░ ▒█▀▀▀ |
# | ░▀▀█▄ ░▒█░░ ▄█▄ ▒█▄▄█ ▒█▄▄▄ |
# |=============================|

# |====================|
# | COPYRIGHTS SECTION |
# |====================|
# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# |=================|
# | IMPORTS SECTION |
# |=================|
import os
import subprocess
from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List # noqa: F401

# |===============================|
# | MOD KEY & TERMINAL DEFINITION |
# |===============================|
mod = "mod4"
terminal = guess_terminal()

# |==============|
# | KEY BINDINGS |
# |==============|
keys = [
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and un split sides of stacUp"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer set Master 5%+"), desc="Raise 5% volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer set Master 5%-"), desc="Lower 5% volume"),
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 10"), desc="Raise 10% brightness"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 10"), desc="Lower 10% brightness"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.screen.togglegroup(), desc="Switch window back and forth"),
    Key([mod], "0", lazy.spawn("./.config/polybar/colorblocks/scripts/powermenu.sh"), desc="Launch power menu"),
    Key([mod], "c", lazy.spawn("./.config/rofi/edit_config.sh"), desc="Launch edit config launcher"),
    Key([mod], "d", lazy.spawn("./.config/rofi/launchers/colorful/launcher.sh"), desc="Launch menu launcher"),
    Key([mod, "shift"], "b", lazy.spawn("firefox"), desc="Launch browser"),
    Key([mod, "shift"], "v", lazy.spawn("code"), desc="Launch text editor"),
    Key([mod, "shift"], "f", lazy.spawn("pcmanfm"), desc="Launch file manager"),
    Key([mod, "shift"], "s", lazy.spawn("spotify"), desc="Launch music streamer"),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.Columns(
        border_focus="#81C784",
        border_normal="#1B5E20",
        border_on_single=True,
        border_width=5,
        margin=5
    ),
    layout.Floating(
        border_focus="#81C784",
        border_normal="#1B5E20",
        border_width=5
    ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Gap(5),
        right=bar.Gap(5),
        bottom=bar.Gap(5),
        left=bar.Gap(5),
        #bottom=bar.Bar(
        #    [
        #        widget.CurrentLayout(),
        #        widget.GroupBox(),
        #        widget.Prompt(),
        #        widget.WindowName(),
        #        widget.Chord(
        #            chords_colors={
        #                'launch': ("#ff0000", "#ffffff"),
        #            },
        #            name_transform=lambda name: name.upper(),
        #        ),
        #        widget.TextBox("default config", name="default"),
        #        widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
        #        widget.Systray(),
        #        widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
        #        widget.QuickExit(),
        #    ],
        #    24,
        #),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# Autostart
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
