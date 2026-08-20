cask "hydra" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.3"
  sha256 arm:   "702d36d6d790bd5f2080d419587b6e0e1d4a4c2e9f0235d6a06fc98033eee8ec",
         intel: "a91ff7ee0f74199581dd5b4b9cee35ce016bd3f37cff9ad502cacfbbad11fb49"

  url "https://github.com/ja7ad/hydra/releases/download/v#{version}/Hydra-#{version}-#{arch}.dmg"
  name "Hydra"
  desc "Multi-source file retriever and download manager"
  homepage "https://github.com/ja7ad/hydra"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :big_sur

  app "Hydra Download Manager.app"
  binary "#{appdir}/Hydra Download Manager.app/Contents/MacOS/hydra"
  manpage "#{appdir}/Hydra Download Manager.app/Contents/Resources/man/man1/hydra.1"

  zap trash: [
    "~/.config/hydra",
    "~/Library/Application Support/Hydra",
    "~/Library/Preferences/io.github.ja7ad.hydra.plist",
    "~/Library/Saved Application State/io.github.ja7ad.hydra.savedState",
  ]
end
