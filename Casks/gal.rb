cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.465"
  sha256 arm:    "8702721397afc449870ad2b70ede4986c35af5e467257014b3e14e2424c48387",
         x86_64: "d67ed6c98de9a0c101e3c80e9aaf640871f084b85d1a857ea18d5ca2bb09d9a6"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.465/gal-#{version}-darwin-#{arch}.tar.gz"
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
