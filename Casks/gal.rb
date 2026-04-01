cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.495"
  sha256 arm:    "1f637d66c45081bf4b1c2388b33ea8e33ab49914357bc8a057de0a551bad6bb1",
         x86_64: "68acfefe82f9625ba0907f2702186aee138d343254298cbb8abd6877085e9813"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.495/gal-#{version}-darwin-#{arch}.tar.gz"
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
