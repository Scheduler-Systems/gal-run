cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.492"
  sha256 arm:    "265d4a9906a66326264453474c388d1860d66fcee103552388ae393618f9bdb7",
         x86_64: "0d9aeb4f929731f96f4d8d26470673dab420d43e4dc98a650011fbddcf682978"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.492/gal-#{version}-darwin-#{arch}.tar.gz"
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
