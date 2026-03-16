cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.281"
  sha256 arm:    "54433f377a1b8c8807457361d6b136c99ba8ac74291ec471fdf8d652aa392136",
         x86_64: "08fc03bee6c107a061f25a74132b218a0f082bd65c1628e34cf5dced42fc032e"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.281/gal-#{version}-darwin-#{arch}.tar.gz"
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
