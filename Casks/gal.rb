cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.553"
  sha256 arm:    "5ddf88a4b1f8f18a3bc5abbc518b8ec36dcca4c14f7d4c9830a1752c020ae89a",
         x86_64: "8d0cc160fca0e68e3254d25707d80b90fb1eeaabe658bf176e8e883378d7c53d"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.553/gal-#{version}-darwin-#{arch}.tar.gz"
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
