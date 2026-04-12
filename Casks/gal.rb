cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.571"
  sha256 arm:    "f63ff850a5407d163f604a128f7190915621acf96150d0ec6d2adaf31ba8d35d",
         x86_64: "10a9565d8eb30185ade1c93df54885c2e410d6dc87fad4024f0f54953ff8e28a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.571/gal-#{version}-darwin-#{arch}.tar.gz"
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
