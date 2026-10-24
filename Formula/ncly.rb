class Ncly < Formula
  desc "Curated multilingual CLI toolbox for humans and agents"
  homepage "https://github.com/pascalandy/nicely"
  url "https://github.com/pascalandy/nicely/releases/download/v0.23.0/ncly_0.23.0_source.tar.gz"
  sha256 "b430c5570cc99066a55181cdfac9ceeb818fa0aaebe6fc587352e9c36e1ba737"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-buildvcs=false", "-ldflags=-s -w -X github.com/pascalandy/nicely/internal/cli.version=v0.23.0", "-o", bin/"ncly", "./cmd/ncly"
    generate_completions_from_executable(bin/"ncly", shells: [:bash, :zsh, :fish], shell_parameter_format: :cobra)
    (pkgshare/"licenses").install "LICENSE", "THIRD_PARTY_LICENSES"
  end

  test do
    assert_equal "ncly v0.23.0", shell_output("#{bin}/ncly --version").strip
  end
end
