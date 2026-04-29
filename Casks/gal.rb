cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.661"
  sha256 arm:    "50b677b97daebddef2eb0a1cd4567764837a0f187012c010669850b15bf73887",
         x86_64: "8c7f7f7e8950106e857e206c5b05b7aaf6146e89b37b8638f666ea31d8ca879e"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.661/gal-#{version}-darwin-#{arch}.tar.gz"
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
