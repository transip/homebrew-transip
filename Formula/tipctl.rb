class Tipctl < Formula
  desc "Command-line interface for the TransIP API"
  homepage "https://www.transip.eu/"
  url "https://github.com/transip/tipctl/releases/download/6.34.0/tipctl.phar"
  sha256 "0bfc593e534ce70cb11905315b93b821a58db44be9cec90a21a0a10fab2e3613"
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
