cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.527"
  sha256 arm:    "d39d4b59072935eab3803274a1c2bc076aa735d2d14fc6460517f7f173925981",
         x86_64: "7d66debe1f8cc72ee29f54c679539faf93e595ba1126c1f262135bf565b6a98f"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.527/gal-#{version}-darwin-#{arch}.tar.gz"
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
