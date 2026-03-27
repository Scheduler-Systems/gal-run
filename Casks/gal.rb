cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.371"
  sha256 arm:    "8be32dffc1e254958c9248dbaeef1b808bdbf9b07ad7e5a0a9a2650628a6687a",
         x86_64: "fde76447b0b604601798a4e03030df2239d5dada4bd79c6b3188b7f46e18ba13"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.371/gal-#{version}-darwin-#{arch}.tar.gz"
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
