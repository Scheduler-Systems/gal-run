cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.449"
  sha256 arm:    "5f47b8cf36345e7689a3e8ae5a93d2333028b97955a25483bdd82fd674823523",
         x86_64: "71a942956217d0d8cf7266fb9d2e88686ac05b83ab5473f3b0f59a647273bcee"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.449/gal-#{version}-darwin-#{arch}.tar.gz"
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
