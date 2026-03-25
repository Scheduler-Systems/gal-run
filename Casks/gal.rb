cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.325"
  sha256 arm:    "a569a92f2276cbb2235b727c1056fbd8836afa795adadc96a223a6dbae1c2162",
         x86_64: "ef27e7adfa9c0d9bbd64363435adffb1296ab7b41a00becdbc51c5d1ea48bce6"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.325/gal-#{version}-darwin-#{arch}.tar.gz"
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
