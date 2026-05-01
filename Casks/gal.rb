cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.666"
  sha256 arm:    "2d6c035364b22217f862234462f71fd0ac385f0a74a1937844b82358ab7460d3",
         x86_64: "9e8d335cc8e6cb9f76773dcb02597295f000ff54e848c0229c2f6a5e36a1eb50"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.666/gal-#{version}-darwin-#{arch}.tar.gz"
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
