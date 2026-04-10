cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.564"
  sha256 arm:    "98202c0d3a57fbea6e697df9caeab091805547988381e78a729545a6bea4bc29",
         x86_64: "993654769e8697acef45320e3ed5159ab8b13d5886c0564c2318837a35f695d1"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.564/gal-#{version}-darwin-#{arch}.tar.gz"
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
