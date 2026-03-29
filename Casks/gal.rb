cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.399"
  sha256 arm:    "e6a7ebe9ef6a50d048bac81bb63f8f4b7da26892ce79d2fe93b077e9c10c09a2",
         x86_64: "c5507e79f200dd27aa5b7991f7610c4af1823fd5e7f97f36e284b67f448fc0a9"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.399/gal-#{version}-darwin-#{arch}.tar.gz"
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
