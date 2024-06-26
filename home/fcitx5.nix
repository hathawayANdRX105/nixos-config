{ config, pkgs, ... }:
{
  i18n.defaultLocale = "zh_CN.UTF-8";

  i18n.inputMethod = {
    enabled = "fcitx5";

    fcitx.engines = with pkgs.fcitx-engines; [rime];
    fcitx5 = {
      addons = with pkgs; [
          fcitx5-rime
      ];

      enableRimeData = true;

      waylandFrontend = true;
    };
  };

 # home.sessionVariables = {
 #   GTK_IM_MODULE = "fcitx5";
 #   QT_IM_MODULE = "fcitx5";
 #   XMODIFIERS = "@im=fcitx5";
 # };
  
}
