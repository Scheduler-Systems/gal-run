cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.664"
  sha256 arm:    "a9be16971c9a95c5ca44a31130536ec90b47f138c35af3a28d96a4b947a3a335",
         x86_64: "ed771cc0203d0ba12733dbb22614a107e654fee5628c0ce60aa8752855eacad2"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.664/gal-#{version}-darwin-#{arch}.tar.gz"
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
