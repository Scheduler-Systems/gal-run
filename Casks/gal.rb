cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.360"
  sha256 arm:    "19a9cd038b768d779c5ed725a5d9cfcdebec8ae1c3d21d68919e7326791617cc",
         x86_64: "bd3f7ddcf4bcc3f6db13cb96551708666e3a4f832b4510a5dc04a0ba340fb00d"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.360/gal-#{version}-darwin-#{arch}.tar.gz"
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
