cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.665"
  sha256 arm:    "2c23e59351a8e3d9c4a1ce1d6b83a5700e093b9527b5a32d93381f694c7c5290",
         x86_64: "ffec84f7ba1819141264a9f2bf9f541613bea69ac76afa8d92515e01ae3b4e53"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.665/gal-#{version}-darwin-#{arch}.tar.gz"
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
