cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.513"
  sha256 arm:    "bde8fd349673d8185ff20ad0395f4eec76d9e5409e5ff840321eea0761a0f6df",
         x86_64: "0949ab2fa408a812b9ab49b885f46b0b9e622a168314819caf8eb02a14964ca7"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.513/gal-#{version}-darwin-#{arch}.tar.gz"
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
