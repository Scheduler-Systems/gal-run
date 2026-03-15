cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.278"
  sha256 arm:    "a643f8a642a1f0a57b193577f9e31757274c26097ceb1d8769b1b1da9f9470d2",
         x86_64: "8baa2897722b7fff03924968f4d990c7238c8a4488e7c73eaf22bd16eda58ffc"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v#{version}/gal-#{version}-darwin-#{arch}.tar.gz"
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
