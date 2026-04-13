cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.577"
  sha256 arm:    "2bd1b7c284ccbe95193582dd2570bfa0e5d63dd13d47622e88374309f1d92161",
         x86_64: "c899c43e2afbbc4e502aaa9605d569453a4673b2e5c04e3d60dc49765045f31b"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.577/gal-#{version}-darwin-#{arch}.tar.gz"
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
