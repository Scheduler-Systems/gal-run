cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.450"
  sha256 arm:    "77ad17307cffecaa8ca7cf55e252051e24a6caa8b31281631cca69a3618ff1c0",
         x86_64: "7ad0c4b97cf630b8345e4500daf257a504add5f40e17aeb439b03eb5cff0461a"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.450/gal-#{version}-darwin-#{arch}.tar.gz"
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
