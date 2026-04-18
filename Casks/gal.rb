cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.598"
  sha256 arm:    "412e5c3b133ba7b65af5002ff31b4cabb39bc9f488a05ded456d18ee5f282ab9",
         x86_64: "7007b049ff0d266ca1fb7398cca5bafb2383954cb97d209cff612765817ddba1"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.598/gal-#{version}-darwin-#{arch}.tar.gz"
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
