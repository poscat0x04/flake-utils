{
  description = "Nix flake utility library";
  outputs = { ... }: rec {
    systems = [
      "x86_64-linux"
      "i686-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "armv6l-linux"
      "armv7l-linux"
    ];

    forAllSystems =
      let
        genAttrs = names: f: builtins.listToAttrs (map (n: { name = n; value = f n; }) names);
      in
        f: genAttrs systems (system: f system);
  };
}
