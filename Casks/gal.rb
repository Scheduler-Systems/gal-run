cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.432"
  sha256 arm:    "363258289717c814eeee1dee5ad40e40dffc843a39c555e96b32966fa3c542ab",
         x86_64: "74be5e73740beb622663052b25dcc3ca019b880952a5cac6748c0e53fd415aee"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.432/gal-#{version}-darwin-#{arch}.tar.gz"
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
