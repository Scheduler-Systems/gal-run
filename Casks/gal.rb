cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.433"
  sha256 arm:    "622b2c753249bb493d7787afa2ba9ff132b801c0f6ae2e3b6582f3b148541d39",
         x86_64: "f925b2f3dad867394c7238e0cc22571194ba1e7b852f9a918bfdf23490283813"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.433/gal-#{version}-darwin-#{arch}.tar.gz"
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
