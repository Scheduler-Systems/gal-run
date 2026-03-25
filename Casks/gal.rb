cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.339"
  sha256 arm:    "6beb423c1483aa76b40efc9e59c036ad152c318bf338d1d776bc3a07008b43c8",
         x86_64: "57560950859bd9433557eb1c7d7747843f97873fe0255173ab0cdce9d58ecf70"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.339/gal-#{version}-darwin-#{arch}.tar.gz"
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
