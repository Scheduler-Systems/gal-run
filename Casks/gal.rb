cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.498"
  sha256 arm:    "b00b21ffb8ac51b567a066bbae3e8d8a32ae949f9628cb43d94db9f59dc64aca",
         x86_64: "8d0f8e81aebcd252a966ff02a73fa7980fdd1d1b423e92dc562bb4fb781fa0e6"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.498/gal-#{version}-darwin-#{arch}.tar.gz"
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
