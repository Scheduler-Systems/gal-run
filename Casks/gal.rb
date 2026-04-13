cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.578"
  sha256 arm:    "943169937095f8b16fe9f0804f2d48c149179b78bf6f6ba5bc6e8217140c7c7e",
         x86_64: "4cb9296d68080204ef7288688071fbc972183e69bcf3894d87af0818aeb3e5d7"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.578/gal-#{version}-darwin-#{arch}.tar.gz"
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
