cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.602"
  sha256 arm:    "531655de5f750d68350e3a3c8e2fb9e124c0e69d93620ec9bc2ef3c607a9a6e7",
         x86_64: "58ca3aaabb7ee46690095c322eaf26de3618d96386bf87111c20d8c967b6942b"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.602/gal-#{version}-darwin-#{arch}.tar.gz"
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
