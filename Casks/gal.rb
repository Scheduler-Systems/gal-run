cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.493"
  sha256 arm:    "89421e95c7dd32f07e5f47c5242bfe5c6078c16070d2d611e4ab887dd2bf0c5c",
         x86_64: "473a983e42a32c5254efdeb523888b0ef56f6375e7ed6b795ab8f22033c9ef76"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.493/gal-#{version}-darwin-#{arch}.tar.gz"
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
