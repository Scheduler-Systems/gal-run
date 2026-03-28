cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.390"
  sha256 arm:    "cf0254e661657af96133ffd597a4e56c927e3333bbdaca651e1e89c9af81b798",
         x86_64: "c18ee9f91ccb1e922123713648f9c3481e2551715ab2f4cfe083de5df22bd941"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.390/gal-#{version}-darwin-#{arch}.tar.gz"
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
