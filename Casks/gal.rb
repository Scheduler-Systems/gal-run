cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.389"
  sha256 arm:    "227f305d0069526dd42ab4b81fd4019803b622e3dbc2dce70d7255bbe95a906e",
         x86_64: "80742d888538d77b421fa327b50a111c2c899c8d7be1a4ab905dc7a7355e2eac"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.389/gal-#{version}-darwin-#{arch}.tar.gz"
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
