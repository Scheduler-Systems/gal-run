cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.488"
  sha256 arm:    "ff04bf6a836af6a6a8910524a833386f554291b35ac48d1d4785d6071cecfd6d",
         x86_64: "28cb43267e5cb3ee274fc31f466ae0b9f2ef80d6a73f3bdbb47b9954587f6189"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.488/gal-#{version}-darwin-#{arch}.tar.gz"
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
