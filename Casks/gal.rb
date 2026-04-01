cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.494"
  sha256 arm:    "7ef64598729d5ef22b76ffbdd17108dff0771169ccbd2e453b63c2e338b313ff",
         x86_64: "f6221b1e2aa3b26e40f352220ccf772e4d81ea0fa746936d91fd9562863421fc"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.494/gal-#{version}-darwin-#{arch}.tar.gz"
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
