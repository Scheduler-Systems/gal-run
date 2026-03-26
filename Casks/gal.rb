cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.357"
  sha256 arm:    "0629efb279fc205dbc175f1611b01013131b628f0790f46e135aa9766837b28c",
         x86_64: "d6b13a82f11a49ff1525fc82554eb7c1fe62a47d295472d2d1031ebae612c70d"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.357/gal-#{version}-darwin-#{arch}.tar.gz"
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
