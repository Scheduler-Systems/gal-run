cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.445"
  sha256 arm:    "8aafb87df53aa66b4a5cf8e6c048c0d11d6f1ca286e81f9817cd5e47b0ab5811",
         x86_64: "2730ae0cf0c762aef9a8f8b58622f34b64377a5851d4c9af3f3b331bd0e247a8"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.445/gal-#{version}-darwin-#{arch}.tar.gz"
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
