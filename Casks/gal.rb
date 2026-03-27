cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.373"
  sha256 arm:    "2889f0b4bd41d4ea152c5dee29135ac1103fd26d0debf029e6c4f07583af2aeb",
         x86_64: "9c46aca590a02595795348db6861e02a2e7d34eb02a984c143cd8434b7472ae8"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.373/gal-#{version}-darwin-#{arch}.tar.gz"
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
