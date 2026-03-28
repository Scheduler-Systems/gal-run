cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.392"
  sha256 arm:    "96c6edeb4aafb0ee3f17017366ffd4cb176142add92662ddf42fa04c84cd25a9",
         x86_64: "a7efb7384bd4a7db79765277076a8c2196c9d91879cd8b1adee536ae599333b8"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.392/gal-#{version}-darwin-#{arch}.tar.gz"
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
