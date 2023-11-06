# GTK-ROFI

> Theme your Rofi CSS using GTK. <br>
> ***GTK 4.0/[adw-gtk3](https://github.com/lassekongo83/adw-gtk3) style context colors is supported!***

## Installing

Execute this into your terminal. This will create a backup of your Rofi installation so take precautions.

```shell
mv $HOME/.config/rofi $HOME/.config/rofi.bak
git clone https://github.com/Rikiub/gtk-rofi $HOME/.config/rofi
cd $HOME/.config/rofi
chmod +x ./scripts/gtk-launcher.sh
```

## Usage

Go to "scripts" folder and execute "gtk-launcher.sh".

If you are using the adw-gtk3 execute "drun.sh" for a fast launch. "emoji.sh" is optional and you need [rofi-emoji](https://github.com/Mange/rofi-emoji) installed for use.

```shell
./gtk-launcher.sh (Rofi arguments) (Your theme without .rasi extension)
```

**Example:**

```shell
./gtk-launcher.sh -show drun gtk-runner
```

**Reset command (fork):**

*Use this for recreate templates manually*

```shell
./gtk-launcher.sh reset
```

## Theming

The script uses the ``templates`` folder to use the theme as a template, then it replaces ``{@CONTEXT}`` valid tags and turn it onto a proper GTK style context color, then it outputs it into the ``themes`` folder.

[List of style context colors](https://github.com/Rikiub/gtk-rofi/blob/ead60f170fdb05352b67a6401a6804fa0d92d361/scripts/file_gtk_style.py#L31C10-L31C10)

[Heres some themes that works](https://github.com/Rikiub/gtk-rofi/tree/ead60f170fdb05352b67a6401a6804fa0d92d361/templates)

## Tips

### Default Theme

Per default [runner.rasi](https://github.com/Rikiub/gtk-rofi/blob/7085faea3a90e411a8e3dd944ec7e704c1e3822f/templates/runner.rasi) uses [GTK 4.0](https://github.com/lassekongo83/adw-gtk3/blob/099f364c7b938ab1defd39e2cce0b47cfcb198d8/gtk/src/adw-gtk3/gtk-4.0/gtk.css) style context colors. 

If you aren't using **adw-gtk3** don't use it and adapt it to your liking (Adapt it to *GTK 3.0*)

### adw-gtk3 Theme Customization

If you are using a normal **GTK 3.0** theme it's done, use a theme/template that uses *GTK 3.0 style* and it will work normally.

But if you are using **adw-gtk3** you can customize theme colors with [Gradience](https://github.com/GradienceTeam/Gradience).
