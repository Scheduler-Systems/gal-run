cask "gal" do
  arch arm: "arm64", intel: "x64"

  version "0.0.566"
  sha256 arm:    "b94de50227a25b5c8c1494d0390f5663b710f02e6b3dd50d458d608a0cdaf4d5",
         x86_64: "e94bb16587b9a412916e978b3571d6982a172ebb8c488f364e6eafac2d94c098"

  url "https://github.com/Scheduler-Systems/gal-run/releases/download/v0.0.566/gal-#{version}-darwin-#{arch}.tar.gz"
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
