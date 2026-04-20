cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.608"
  sha256 arm:    "8fbba376109eecfae0c511a49bb6178c61ee466b3af709537c728da5d230bd5c",
         x86_64: "61d85998e479bc581bdc39f75eae45579b584fce0f26b39048e637f63278cc70"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.608/gal-#{version}-darwin-#{arch}.tar.gz"
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
