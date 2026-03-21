cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.317"
  sha256 arm:    "8a68e587f5b348985ecaa3a10f4cf878a238a2f7b83dac5a9f36d137a633e561",
         x86_64: "44db957517fc7536eef635bb5cbde2dd92e262e35dfcea30ed11ad9f7ba00a93"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.317/gal-#{version}-darwin-#{arch}.tar.gz"
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
