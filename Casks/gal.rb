cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.393"
  sha256 arm:    "2f7d0ff60caa70c4d6afec8075b8cf3541bfac20c825706eb903e2d0f75e6806",
         x86_64: "307927ff28fa97e6c4d175e17a5cd98a26a1d1fd5b3b7a21bc2361320bfbd8fc"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.393/gal-#{version}-darwin-#{arch}.tar.gz"
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
