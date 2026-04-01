cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.479"
  sha256 arm:    "2518bc2bf18bcb037eb41ee94a9e43eaec7fb44dbb6439026f9926d940219f28",
         x86_64: "53d5d518b216b2d605f5f0afc1d096eb06a682943457f33eb72798897ee0f7ae"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.479/gal-#{version}-darwin-#{arch}.tar.gz"
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
