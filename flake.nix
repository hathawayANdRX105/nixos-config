{
  description = "nixos flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    # nixpkgs.url = "https://mirrors.ustc.edu.cn/nix-channels/nixos-23.11/nixexprs.tar.xz";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

   # nekoray = {
   #   url = "github:MatsuriDayo/nekoray";
   #   inputs.nixpkgs.follows = "nixpkgs";
   # };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs nixpkgs; };
      modules = [
        ./configuration.nix
        ./home
      ];

    };
  };

}
