cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.356"
  sha256 arm:    "03f1ac358717dc640a164e43efd7988435dc32fb143ca01b8bcd79dc77ecd8cd",
         x86_64: "28555c52ba3d0c50da2262ae226d3b03bfd4ea15330311022b389bee8e5e76ab"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.356/gal-#{version}-darwin-#{arch}.tar.gz"
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
