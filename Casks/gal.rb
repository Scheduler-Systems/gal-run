cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.501"
  sha256 arm:    "fbe6912983457804d92d2de14713e9c4cfc4f7821a6979d6d6c8a6f10625d28f",
         x86_64: "2bdf47dced7ccbc7eeefedb173b0929a2b79c57a46966a2b1bbe99a8310663ea"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.501/gal-#{version}-darwin-#{arch}.tar.gz"
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
