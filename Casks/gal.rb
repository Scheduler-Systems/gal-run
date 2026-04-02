cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.538"
  sha256 arm:    "2c0eeb9a3894ab9a601ba1b11d68ea7090a46bfaf80812d10685f7ab2366e0a5",
         x86_64: "53c843f062e1c208d8278beef4f34b9c1091e5b5c955c3cb007401b089ee8f92"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.538/gal-#{version}-darwin-#{arch}.tar.gz"
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
