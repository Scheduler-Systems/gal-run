cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.459"
  sha256 arm:    "fdb0115f6bf39e80a31965cffcec0b0af066dd37812d5397968afa837eb92c0c",
         x86_64: "3f1c8f0e44b84628c1f53c7eb8b9e3dec2ca826c66040c4eabd8563d93b5877f"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.459/gal-#{version}-darwin-#{arch}.tar.gz"
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
