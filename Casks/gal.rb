cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.555"
  sha256 arm:    "a78b214a57622764f38ab8d5bdd720d85d80526bc9428644cb1fd1d82f9dde94",
         x86_64: "33754615e7ef801b59c8f32298d4d141b0631bf58077b7d5fa4bbf815bb489bc"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v#{version}/gal-#{version}-darwin-#{arch}.tar.gz"
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
