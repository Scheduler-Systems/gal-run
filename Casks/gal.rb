cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.337"
  sha256 arm:    "496ae3d3d2540b069c3f9b9f14678b34952a018516889b73d3e1df842cfa9bc6",
         x86_64: "cdda115f1295a5b5796f58a75143deefeb420e44c4af5539b81c03990ba97a2d"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.337/gal-#{version}-darwin-#{arch}.tar.gz"
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
