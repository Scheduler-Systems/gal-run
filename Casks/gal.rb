cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.464"
  sha256 arm:    "b2eff2f495142c192510e243cefb063805fbafd660465a1882cae427dbf2eb30",
         x86_64: "b995cfe5de5541dfd7a6627e4914d67d81c7305bd402e5d3ca6e30cd901785f4"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.464/gal-#{version}-darwin-#{arch}.tar.gz"
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
