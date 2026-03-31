cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.461"
  sha256 arm:    "4f558b0a22df41b53ab7830634dc9855140d52c7e198270d18a43e39f267f3ba",
         x86_64: "8e87338f91c531c936a0aa795f94457ded4943ef5ff5582de6b49f71f7152033"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.461/gal-#{version}-darwin-#{arch}.tar.gz"
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
