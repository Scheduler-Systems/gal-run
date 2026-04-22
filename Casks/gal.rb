cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.621"
  sha256 arm:    "c69e6cf14abf0fadfa196c5e5ebdde54d851e138c2e4537164365df6cd952f19",
         x86_64: "650e49511db4785daaa352c496beed892f9a3103d721f1c969350a77db95c21f"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.621/gal-#{version}-darwin-#{arch}.tar.gz"
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
