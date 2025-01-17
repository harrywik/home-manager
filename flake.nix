{
  description = "Home Manager configuration of harry";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { nixpkgs, home-manager, nvf, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = system; config = { allowUnfree = true; }; };
    in {
      homeConfigurations."harry" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
		nvf.homeManagerModules.default
		./home.nix 
	];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
