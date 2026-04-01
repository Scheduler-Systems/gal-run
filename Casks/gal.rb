cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.510"
  sha256 arm:    "28f7aac5584b79532789e1e1aebc73bf22b3ca62200dddf34d2e03b9b61ebcec",
         x86_64: "01677a1c65149c662cce8d2fec74e64cb63f1cb27e4c69f295524d586cb244cc"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.510/gal-#{version}-darwin-#{arch}.tar.gz"
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
