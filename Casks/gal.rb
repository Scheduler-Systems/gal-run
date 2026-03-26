cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.349"
  sha256 arm:    "0f6324c0abc91427fc977f40d8680772bde0204b3d747c1a5b45db84e3a335da",
         x86_64: "c02fec6a3d30e346e2436b1343c0644d24b508de35097550f809b88dc24cc7fb"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.349/gal-#{version}-darwin-#{arch}.tar.gz"
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
