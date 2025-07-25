{
  description = "Environment with named dev environments and inherited shell specs.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    
    nanonis-spm = pkgs.python3Packages.buildPythonPackage rec {
      pname = "nanonis-spm";
      version = "1.0.8";
      
      pyproject = true;
      
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/e8/58/3de2327cb6107a9662a4c7a38dda3c0b52b49614badbc777a0ef2d4c7936/nanonis_spm-${version}.tar.gz";
        sha256 = "sha256-cSRyhP8TILYUDRl6Iw1Mub+xISCe6ZFsr+IC9VOqPSU=";
      };
      
      build-system = with pkgs.python3Packages; [
        hatchling
      ];
      
      dependencies = with pkgs.python3Packages; [
        numpy
      ];
      
      meta = with pkgs.lib; {
        description = "Python package for controlling Nanonis SPM software through Python";
        homepage = "https://pypi.org/project/nanonis-spm/";
        license = licenses.mit;
      };
    };
  in
  {
    devShells.${system} = {
      default = pkgs.mkShell {
        buildInputs = [
          (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
            python-lsp-server
            nanonis-spm
            matplotlib
            numpy
            pip
          ]))
          pkgs.nushell
          pkgs.helix
        ];
        shellHook = ''
          exec nu --login
        '';
      };
      
      dev = pkgs.mkShell {
        buildInputs = [
          (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
            python-lsp-server
            nanonis-spm
            matplotlib
            numpy
            pip
          ]))
        ];
      };
    };
  };
}
