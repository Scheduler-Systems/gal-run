cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.511"
  sha256 arm:    "30b6b4af92bf874a2b0a9440340408fb1dc80ac7d0db8422f1f358981712cc28",
         x86_64: "b6c52a30d2a7e09c36b0d601d419484f356d2a97d566af461534f639897170f7"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.511/gal-#{version}-darwin-#{arch}.tar.gz"
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
