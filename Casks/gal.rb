cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.576"
  sha256 arm:    "4a20e97ff7205ba736fb727505fb71cceed6567003f4159750d9ee478d2e2ad8",
         x86_64: "2c3e313715b5bcc3a0d5b0827a3fed9774f560f6a135852331c910ef3ba91900"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.576/gal-#{version}-darwin-#{arch}.tar.gz"
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
