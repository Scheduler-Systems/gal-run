cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.462"
  sha256 arm:    "19946c25971651481600ad5f970a3339b4d8a2fa3b653edb04666f0a155b17a7",
         x86_64: "7be10231c1ad75e72b36d9c734452c7308d0ebd94eef8b59fbbe2c7d0513383c"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.462/gal-#{version}-darwin-#{arch}.tar.gz"
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
