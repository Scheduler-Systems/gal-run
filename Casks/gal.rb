cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.383"
  sha256 arm:    "a4400b47bca16e873419b56eeba66370f911a5362e4cb3cc5c78835e5e0a53d7",
         x86_64: "119752550cac6ea8b0aca90bd817cc0eb39ed0e49ea257bd43103b14d8926438"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.383/gal-#{version}-darwin-#{arch}.tar.gz"
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
