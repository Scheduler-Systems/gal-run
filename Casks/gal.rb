cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.408"
  sha256 arm:    "b4fb58170cdf384ed0b759da5569083b38319f370f55efd46e1c2a8cd755f46a",
         x86_64: "b09f06b6041ef45394d6f8f2a50d25fb0281204a12641e9fe5f553a49b65765b"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.408/gal-#{version}-darwin-#{arch}.tar.gz"
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
