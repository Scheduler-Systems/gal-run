cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.350"
  sha256 arm:    "f8c2d9ab24b695a6136b0f8b30e764898771f1131b4285475bbdb0d3ab46a5ee",
         x86_64: "90301511a05ffd4be5998c94aa1a623749dda16d151b1a998afe3fc12b523051"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.350/gal-#{version}-darwin-#{arch}.tar.gz"
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
