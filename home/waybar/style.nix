{ ... }:
let custom = {
    font = "JetBrainsMono Nerd Font";
    font_size = "16px";
    font_weight = "bold";
    text_color = "#cdd6f4";
    secondary_accent= "89b4fa";
    tertiary_accent = "f5f5f5";
    background = "#0B0B12";
    opacity = "0.9";
};
in 
{
  programs.waybar.style = ''

    * {
        border: none;
        border-radius: 0px;
        padding: 0;
        margin: 0;
        min-height: 0px;
        font-family: ${custom.font};
        font-weight: ${custom.font_weight};
        opacity: ${custom.opacity};
    }

    window#waybar {
        background: ${custom.background};
    }

    #workspaces {
        font-size: 20px;
        padding-left: 10px;
        
    }
    #workspaces button {
        color: ${custom.text_color};
        padding-left:  6px;
        padding-right: 6px;
    }
    #workspaces button.empty {
        color: #6c7086;
    }
    #workspaces button.active {
        color: #b4befe;
    }

    #tray, #pulseaudio, #network, #cpu, #memory, #disk, #clock, #battery {
        font-size: ${custom.font_size};
        color: ${custom.text_color};
    }
    #tray {
        padding: 0 20px;
        margin-left: 7px;
    }

    #clock {
        padding-left: 9px;
        padding-right: 15px;
    }

    #pulseaudio {
        padding-left: 9px;
        padding-right: 9px;
    }
    #cpu {
        padding-left: 9px;
        padding-right: 9px;
    }
    #memory {
        padding-left: 9px;
        padding-right: 9px;
    }
    #disk {
        padding-left: 9px;
        padding-right: 9px;
    }
    #battery {
        padding-left: 9px;
        padding-right: 9px;
    }
    #network {
        padding-left: 9px;
        padding-right: 9px;
    }
    

    #custom-launcher {
        font-size: 20px;
        color: #b4befe;
        font-weight: ${custom.font_weight};
        padding-left: 10px;
        padding-right: 10px;
    }
  '';
}
