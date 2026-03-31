cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.455"
  sha256 arm:    "698f3f7670b06b3270399e5ff38ff137f9ca69897ee7d61120536555bd9ab482",
         x86_64: "65a6fb39e02618801af2158edd876e15831770db4d8aff10d4a280d64d7a03a9"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.455/gal-#{version}-darwin-#{arch}.tar.gz"
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
