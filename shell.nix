# shell.nix

{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.clang # Include clang in the shell environment
    # Add any other dependencies you may need
  ];
}

