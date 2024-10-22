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

import os
import subprocess 
from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.log_utils import logger

mod = "mod4"
terminal = "alacritty"

# █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █▀
# █░█ ██▄ ░█░ █▄█ █ █░▀█y █▄▀ ▄█


keys = [
    #  D E F A U L T
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    
    Key([mod], "o", lazy.next_screen(), desc="Move window focus to next screen"),
    Key([mod], "u", lazy.prev_screen(), desc="Move window focus to previous screen"),
    
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "k", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "j", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    
    
    Key([mod, "shift"], "f", lazy.layout.flip()),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="Toggle between layouts"),
    
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod, "control"], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "shift"], "r", lazy.spawn("nitrogen --restore"), desc="feh background restore"),
    Key([mod], "r", lazy.spawn("sh -c ~/.config/rofi/scripts/launcher"), desc="Spawn a command using a prompt widget"),
    Key([mod], "q", lazy.spawn("sh -c ~/.config/rofi/scripts/power"), desc="powermenu"),
    Key([mod], "d", lazy.spawn("sh -c ~/.config/rofi/scripts/display_switcher"), desc="Display-mode switcher"),

    # C U S T O M
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 5"), desc="Volume Up"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 5"), desc="volume down"),
    Key([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute"), desc="Volume Mute"),
    Key([mod], "p", lazy.spawn("playerctl play-pause"), desc="playerctl"),
    Key([mod, "shift"], "p", lazy.spawn("playerctl previous"), desc="playerctl"),
    Key([mod, "control"], "p", lazy.spawn("playerctl next"), desc="playerctl"),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 10%+"), desc="brightness UP"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 10%-"), desc="brightness Down"),
    Key([mod], "f", lazy.spawn("thunar"), desc="file manager"),
    Key([mod], "c", lazy.spawn("roficlip"), desc="clipboard"),
    Key([mod], "s", lazy.spawn("flameshot gui"), desc="Screenshot"),
    Key([mod], "space", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next Keyboard Layout"),
]


# █▀▀ █▀█ █▀█ █░█ █▀█ █▀
# █▄█ █▀▄ █▄█ █▄█ █▀▀ ▄█


groups = [Group(f"{i+1}", label="") for i in range(8)]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            Key(
                [mod, "control"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Switch to & !move focused window to group {}".format(i.name),
            ),
        ]
    )


# L A Y O U T S


lay_config = {
    "border_width": 0,
    "margin": 5,
    "border_focus": "3b4252",
    "border_normal": "3b4252",
    "font": "FiraCode Nerd Font",
    "grow_amount": 2,
}

layouts = [
    layout.MonadTall(**lay_config),
    layout.MonadWide(**lay_config),
    layout.Columns(
        **lay_config,
        border_on_single=True,
        num_columns=2,
        split=False,
    ),
    layout.Bsp(**lay_config, fair=False, border_on_single=True),
    layout.Matrix(**lay_config, columns=3),
    layout.Floating(**lay_config),
    layout.Max(**lay_config),
    # Plasma(lay_config, border_normal_fixed='#3b4252', border_focus_fixed='#3b4252', border_width_single=3),
    # layout.RatioTile(**lay_config),
    # layout.VerticalTile(**lay_config),
    # layout.Zoomy(**lay_config),
    # layout.Slice(**lay_config, width=1920, fallback=layout.TreeTab(), match=Match(wm_class="joplin"), side="right"),
    # layout.Tile(shift_windows=True, **lay_config),
    # layout.Stack(num_stacks=2, **lay_config),
]


widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = [widget_defaults.copy()]


def search():
    qtile.cmd_spawn("sh -c ~/.config/rofi/scripts/launcher")


def power():
    qtile.cmd_spawn("sh -c ~/.config/rofi/scripts/power")


# █▄▄ ▄▀█ █▀█
# █▄█ █▀█ █▀▄


primary_widgets = [
    widget.Spacer(
        length=15,
        background="#282738",
    ),
    widget.Image(
        filename="~/.config/qtile/Assets/launch_Icon.png",
        margin=2,
        background="#282738",
        mouse_callbacks={"Button1": power},
    ),
    widget.Image(
        filename="~/.config/qtile/Assets/6.png",
    ),
    widget.GroupBox(
        font="UbuntuMono Nerd Font Mono",
        fontsize=13,
        borderwidth=3,
        highlight_method="text",
        active="#6272a4",
        block_highlight_text_color="#8be9fd",
        highlight_color="#353446",
        inactive="#282738",
        foreground="#4B427E",
        background="#353446",
        this_current_screen_border="#8be9fd",
        this_screen_border="#353446",
        other_current_screen_border="#353446",
        other_screen_border="#353446",
        urgent_border="#353446",
        rounded=True,
        disable_drag=True,
    ),
    widget.Spacer(
        length=8,
        background="#353446",
    ),
    widget.Image(
        filename="~/.config/qtile/Assets/1.png",
    ),
    widget.CurrentLayoutIcon(
        custom_icon_paths=["~/.config/qtile/Assets/layout"],
        background="#353446",
        scale=0.50,
    ),
    widget.KeyboardLayout(
        configured_keyboards=["us", "es"],
        font="UbuntuMono Nerd Font Bold",
        foreground="#50fa7b",
        background="#353446"
    ),
    widget.Image(
        filename="~/.config/qtile/Assets/5.png",
    ),
    widget.TextBox(
        text=" ",
        font="Font Awesome 6 Free Solid",
        fontsize=13,
        background="#282738",
        foreground="#50fa7b",
        mouse_callbacks={"Button1": search},
    ),
    widget.TextBox(
        fmt="Search",
        background="#282738",
        font="UbuntuMono Nerd Font Mono Bold",
        fontsize=13,
        foreground="#50fa7b",
        mouse_callbacks={"Button1": search},
    ),
    widget.Image(
        filename="~/.config/qtile/Assets/4.png",
    ),
    widget.WindowName(
        background="#353446",
        font="UbuntuMono Nerd Font Mono Bold",
        fontsize=13,
        empty_group_string="Desktop",
        max_chars=130,
        foreground="#ffb86c",
    ),
    widget.Image(
        filename="~/.config/qtile/Assets/3.png",
    ),
    widget.Systray(
        background="#282738",
        fontsize=2,
    ),
    widget.TextBox(
        text=" ",
        background="#282738",
    ),
    widget.Image(
        filename="~/.config/qtile/Assets/6.png",
        background="#353446",
    ),
    widget.CPU(
        background="#353446",
        format="{freq_current: .1f} Ghz",
        foreground="#ff5555",
        font="UbuntuMono Nerd Font Mono Bold",
        fontsize=13,
        update_interval=5,
    ),
    widget.TextBox(
        text="󰍛",
        font="Font Awesome 6 Free Solid",
        fontsize=13,
        background="#353446",
        foreground="#ff5555",
    ),
    widget.Memory(
        background="#353446",
        format="{MemUsed: .0f}{mm}",
        foreground="#f1fa8c",
        font="UbuntuMono Nerd Font Mono Bold",
        fontsize=13,
        update_interval=5,
    ),
    widget.TextBox(
        text="",
        font="UbuntuMono Nerd Font Mono Bold",
        fontsize=24,
        background="#353446",
        foreground="#f1fa8c",
    ),
    widget.Image(
        filename="~/.config/qtile/Assets/2.png",
    ),
    widget.Spacer(
        length=8,
        background="#353446",
    ),
    widget.TextBox(
        text=" ",
        font="Font Awesome 6 Free Solid",
        fontsize=13,
        background="#353446",
        foreground="#50fa7b",
    ),
    widget.Battery(
        font="UbuntuMono Nerd Font Mono Bold",
        fontsize=13,
        background="#353446",
        foreground="#50fa7b",
        format="{percent:2.0%}",
    ),
    widget.Image(
        filename="~/.config/qtile/Assets/2.png",
    ),
    widget.Spacer(
        length=8,
        background="#353446",
    ),
    widget.TextBox(
        text="",
        font="Font Awesome 6 Free Solid",
        fontsize=13,
        background="#353446",
        foreground="#ff79c6",
    ),
    widget.Volume(
        font="UbuntuMono Nerd Font Mono Bold",
        fontsize=13,
        background="#353446",
        foreground="#ff79c6",
    ),
    widget.TextBox(
        text=" 󰃠",
        font="Font Awesome 6 Free Solid",
        fontsize=13,
        background="#353446",
        foreground="#bd93f9",
    ),
    widget.Backlight(
        font="UbuntuMono Nerd Font Mono Bold",
        fontsize=13,
        brightness_file="/sys/class/backlight/intel_backlight/brightness",
        max_brightness_file="/sys/class/backlight/intel_backlight/max_brightness",
        background="#353446",
        foreground="#bd93f9",
    ),
    widget.Image(
        filename="~/.config/qtile/Assets/5.png",
        background="#353446",
    ),
    widget.TextBox(
        text=" ",
        font="Font Awesome 6 Free Solid",
        fontsize=13,
        background="#282738",
        foreground="#8be9fd",
    ),
    widget.Clock(
        format="%H:%M",
        background="#282738",
        foreground="#8be9fd",
        font="UbuntuMono Nerd Font Mono Bold",
        fontsize=13,
    ),
    widget.Spacer(
        length=18,
        background="#282738",
    ),
]
secondary_widgets = [
    widget.GroupBox(
        visible_groups=["1", "2", "3", "4"],
        font="UbuntuMono Nerd Font Mono",
        fontsize=13,
        borderwidth=3,
        highlight_method="text",
        active="#6272a4",
        block_highlight_text_color="#8be9fd",
        highlight_color="#353446",
        inactive="#14131d",
        foreground="#4B427E",
        background="#282738",
        this_current_screen_border="#8be9fd",
        this_screen_border="#353446",
        other_current_screen_border="#353446",
        other_screen_border="#353446",
        urgent_border="#353446",
        rounded=True,
        disable_drag=True,
    ),
    widget.Image(
        filename="~/.config/qtile/Assets/4.png",
    ),
    widget.WindowName(
        background="#353446",
        font="UbuntuMono Nerd Font Mono Bold",
        fontsize=13,
        empty_group_string="Desktop",
        scroll = True,
        foreground="#ffb86c",
    ),
    widget.Image(
        filename="~/.config/qtile/Assets/3.png",
    ),
    widget.GroupBox(
        visible_groups=["5", "6", "7", "8"],
        font="UbuntuMono Nerd Font Mono",
        fontsize=13,
        borderwidth=3,
        highlight_method="text",
        active="#6272a4",
        block_highlight_text_color="#8be9fd",
        highlight_color="#353446",
        inactive="#14131d",
        foreground="#4B427E",
        background="#282738",
        this_current_screen_border="#8be9fd",
        this_screen_border="#353446",
        other_current_screen_border="#353446",
        other_screen_border="#353446",
        urgent_border="#353446",
        rounded=True,
        disable_drag=True,
    ),
]


# Bar definition
def status_bar(widgets):
    return bar.Bar(widgets, 20, margin=[10, 20, 5, 20], opacity=0.92)
def secondary_status_bar(widgets):
    return bar.Bar(widgets, 20,margin=[15, 660, 0, 660], opacity=0.92, reserve = False)
# SCREENS

screens = [Screen(top=status_bar(primary_widgets))]

xrandr = "xrandr | grep -w 'connected' | cut -d ' ' -f 2 | wc -l"

command = subprocess.run(
    xrandr,
    shell=True,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
)

if command.returncode != 0:
    error = command.stderr.decode("UTF-8")
    logger.error(f"Failed counting monitors using {xrandr}:\n{error}")
    connected_monitors = 1
else:
    connected_monitors = int(command.stdout.decode("UTF-8"))

if connected_monitors > 1:
    for _ in range(1, connected_monitors):
        screens.append(Screen(top=secondary_status_bar(secondary_widgets)))


# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = True
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24


@hook.subscribe.startup_once
def autostart():
    subprocess.call([os.path.expanduser(".config/qtile/autostart.sh")])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
