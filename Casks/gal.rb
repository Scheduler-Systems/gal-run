cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.559"
  sha256 arm:    "c934dccf181535f21cd827da8a42f7085e51188b3d81b2004983f6fba33ada76",
         x86_64: "2ee59fbc6d4b2d9f9ce9a84b748668c616e1d0abf1adc7ae74e88691dab2cfc8"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.559/gal-#{version}-darwin-#{arch}.tar.gz"
  name "GAL"
  desc "CLI for GAL — AI agent configuration governance"
  homepage "https://gal.run"

  livecheck do
    url :stable
    strategy :github_latest
  end

  binary "gal"

  zap trash: [
    "~/.gal",
    "~/.config/gal",
  ]
end
