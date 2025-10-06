cask "aish" do
  version "0.0.2"

  on_arm do
    sha256 "04df55cb514b4daaaec67ef9b76640b2e403c4909da8609a45e6676f58526661"
    url "https://github.com/TonnyWong1052/aish/releases/download/v#{version}/aish_#{version}_1759764725_darwin_arm64.tar.gz"
  end

  on_intel do
    sha256 "0f65cb2781000aa09b49d02b177c9bfdce3da9c0b3a5d9970102e7a6a135875b"
    url "https://github.com/TonnyWong1052/aish/releases/download/v#{version}/aish_#{version}_1759764725_darwin_amd64.tar.gz"
  end

  name "AISH"
  desc "AI shell helper - AI-powered command-line assistant"
  homepage "https://github.com/TonnyWong1052/aish"

  binary "aish"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/aish"]
  end

  caveats <<~EOS
    Installation complete! To finish setup, run the following command:
      aish init
  EOS
end
