cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.424"
  sha256 arm:    "aa4f788344fcdaccc82872247ed5149dcaea8b888d1604ae9f0ba4bb839c595a",
         x86_64: "8f360c67c22cbeeb004e0cbf5851d454344ed5e7f9b988ec0d4a50a79b849a2b"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.424/gal-#{version}-darwin-#{arch}.tar.gz"
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
