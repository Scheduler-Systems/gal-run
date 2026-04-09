cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.558"
  sha256 arm:    "0549d32aa23d4a4dc78dfb52c4d54dc6fff51335230219a86a08a47866e7df71",
         x86_64: "6a27fa69a5aaa562f41973b2df79c792e1fe7938d7297d28938e2dd6cd8143bb"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.558/gal-#{version}-darwin-#{arch}.tar.gz"
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
