cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.500"
  sha256 arm:    "1cae07112b898009581cd4a419c947a212c9a911f20ba8b222fdb222fc0c66fd",
         x86_64: "875ab5b2e6ba7f252814c0965a5e343e7f24f8b4f1282d1fcc78993a5e11a1c8"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.500/gal-#{version}-darwin-#{arch}.tar.gz"
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
