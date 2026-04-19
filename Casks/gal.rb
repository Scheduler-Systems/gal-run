cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.606"
  sha256 arm:    "d2a48038219aecee7b36216e273d3a397a9e7194d7c03261c691c5a42db41bb7",
         x86_64: "4f13c7e9126a70c109a03c0afdc30c7ab43606644d4ab20776d93bc14f369ba5"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.606/gal-#{version}-darwin-#{arch}.tar.gz"
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
