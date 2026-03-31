cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.456"
  sha256 arm:    "bd3fc36a05cd7b00e084f7e8e75be11c4595984a96a22fe38b8e94c3e75e332c",
         x86_64: "c102afd634eaed1a5d35e5ca48fee6ac05ebb70a68b6aa859fb75fe55930b658"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.456/gal-#{version}-darwin-#{arch}.tar.gz"
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
