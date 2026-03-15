cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.280"
  sha256 arm:    "20f379c59338bf3cd8131f3362a222499b0c368394ee67104c1afa5b53f53663",
         x86_64: "557182587d3267f09a7e79670bc570da6709357811ad9b31fa608a28d1b0ae68"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.280/gal-#{version}-darwin-#{arch}.tar.gz"
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
