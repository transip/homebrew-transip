class Tipctl < Formula
  desc "Command-line interface for the TransIP API"
  homepage "https://www.transip.eu/"
  url "https://github.com/transip/tipctl/releases/download/v6.34.1/tipctl.phar"
  sha256 "10ac55d94253368f07cf572de041d731b4c530778322c6adb0648dbf599add59"
  license "Apache-2.0"

  depends_on "php"

  def install
    libexec.install "tipctl.phar"

    (bin/"tipctl").write <<~EOS
      #!#{Formula["php"].opt_bin}/php
      <?php require '#{libexec}/tipctl.phar';
    EOS
  end

  test do
    assert_match(/^Transip RestAPI CLI ([0-9]\d*.[0-9]\d*.[0-9]\d*)/,
          shell_output("#{bin}/tipctl"))
  end
end
