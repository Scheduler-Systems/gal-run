cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.308"
  sha256 arm:    "0185ae40ad8b372c7984c9d21310df777ed0a3e15ab0c6f7a7135ccdaac8719f",
         x86_64: "1ba95f1885c403e5cbb2b991db104e48b30db3414d1537a2ffa83b68bdc08f4f"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.308/gal-#{version}-darwin-#{arch}.tar.gz"
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
