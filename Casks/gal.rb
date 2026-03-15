cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.279"
  sha256 arm:    "64e6b515abaa5f7a1b968b7abf73914c5b5e85e619bd4f9e6448e1c6fe893cd8",
         x86_64: "8d34282ef4805c9e25a29909170a7bc7495617f41ed846aa4f2f995391a00ba1"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.279/gal-#{version}-darwin-#{arch}.tar.gz"
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
