cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.380"
  sha256 arm:    "bc5f3f485f056fef9a6789190917a71fa100762bca7e85b2da6846503304731a",
         x86_64: "50e2872e5943274f863213c6fde7d85866c99f6d8fff0daa2ef57fb2fb2d80b7"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.380/gal-#{version}-darwin-#{arch}.tar.gz"
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
