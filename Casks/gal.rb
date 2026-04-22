cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.626"
  sha256 arm:    "d857e55256054269277befb0af59ef2e6851e07ed82798c77a83d4758634bb91",
         x86_64: "6f90b5637712b8accb25e6a7a2e09ae6817cfd5a371d9aa07397b9d41a82f4ea"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.626/gal-#{version}-darwin-#{arch}.tar.gz"
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
