cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.387"
  sha256 arm:    "319057e8d01bcb62bb009a89a6b62d59b9c89a0e203c2c1261457fbe79973f7c",
         x86_64: "ccae1fc01eee613af2d2568d3c52ba1e415fe4983de37938f192b4fc9d588239"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.387/gal-#{version}-darwin-#{arch}.tar.gz"
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
