cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.663"
  sha256 arm:    "9303c6340cab852edc766c057422880445fb3d08d216be1f007bd766e7b21835",
         x86_64: "83d0bb720881827a13b50a6b359f1a1eb2535afeaa640f2ec6b4d100332599db"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.663/gal-#{version}-darwin-#{arch}.tar.gz"
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
