class Ncly < Formula
  desc "Curated multilingual CLI toolbox for humans and agents"
  homepage "https://github.com/pascalandy/nicely"
  url "https://github.com/pascalandy/nicely/releases/download/v0.23.4/ncly_0.23.4_source.tar.gz"
  sha256 "fdf7c457d2b5f132b8cf9787659c33b049cec21bd8d3e4fc93d2c05a928d2072"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-buildvcs=false", "-ldflags=-s -w -X github.com/pascalandy/nicely/internal/cli.version=v0.23.4", "-o", bin/"ncly", "./cmd/ncly"
    generate_completions_from_executable(bin/"ncly", shells: [:bash, :zsh, :fish], shell_parameter_format: :cobra)
    (pkgshare/"licenses").install "LICENSE", "THIRD_PARTY_LICENSES"
  end

  test do
    assert_equal "ncly v0.23.4", shell_output("#{bin}/ncly --version").strip
  end
end
