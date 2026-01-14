{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-25.05";
    };
    ghostty = {
      type = "github";
      owner = "ghostty-org";
      repo = "ghostty";
      ref = "ec2912dbafe50cc32b786d2327dcd0213c83ecc6";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:YaLTeR/niri";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vicinae = {
      url = "github:vicinaehq/vicinae";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = {
      laeeqlaptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          system = "x86_64-linux";
        };
        modules = [
          ./hosts/laeeqlaptop/configuration.nix
          ./modules/home-manager/default.nix

          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
