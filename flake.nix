{
  description = "nixos flake";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs.url =
      "https://mirrors.ustc.edu.cn/nix-channels/nixos-24.11/nixexprs.tar.xz";
    nixpkgs-unstable.url =
      "https://mirrors.ustc.edu.cn/nix-channels/nixpkgs-unstable/nixexprs.tar.xz";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nur-xddxdd = {
    #   url = "github:xddxdd/nur-packages";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "hathaway";
      version = "24.11";
    in {

      nixpkgs.overlays = [
        (final: _prev: {
          unstable = import inputs.nixpkgs-unstable { inherit system; };
        })
      ];

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs nixpkgs username version; };
        modules = [
          ./configuration
          ./home
          # inputs.nur-xddxdd.nixosModules.setupOverlay
        ];
      };
    };
}
