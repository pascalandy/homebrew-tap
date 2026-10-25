class Ncly < Formula
  desc "Curated multilingual CLI toolbox for humans and agents"
  homepage "https://github.com/pascalandy/nicely"
  url "https://github.com/pascalandy/nicely/releases/download/v0.23.1/ncly_0.23.1_source.tar.gz"
  sha256 "25d938c1b15c7873b54aeb5882d1edc123f1a8be1bcf417f62dece0fc6991235"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-buildvcs=false", "-ldflags=-s -w -X github.com/pascalandy/nicely/internal/cli.version=v0.23.1", "-o", bin/"ncly", "./cmd/ncly"
    generate_completions_from_executable(bin/"ncly", shells: [:bash, :zsh, :fish], shell_parameter_format: :cobra)
    (pkgshare/"licenses").install "LICENSE", "THIRD_PARTY_LICENSES"
  end

  test do
    assert_equal "ncly v0.23.1", shell_output("#{bin}/ncly --version").strip
  end
end
