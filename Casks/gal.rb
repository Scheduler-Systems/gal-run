cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.313"
  sha256 arm:    "6218108ffddbcfdd651f16e119c62a9d59c3bcb862a75605988636b9e69bdb1c",
         x86_64: "0d2eae0cf1b4f8775931307a9d3b2d6eb7e6d731d68e4fe8b896501e16318b0f"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.313/gal-#{version}-darwin-#{arch}.tar.gz"
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
