class Wirekube < Formula
  desc "Connect Kubernetes nodes across networks with a WireGuard mesh"
  homepage "https://github.com/inerplat/wirekube"
  version "0.0.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/inerplat/wirekube/releases/download/v0.0.16/wirekubectl-darwin-arm64"
      sha256 "676c61b000592644d162193cf8d0b01e1d18922362561e8934a82c47a819e116"
    end
    on_intel do
      url "https://github.com/inerplat/wirekube/releases/download/v0.0.16/wirekubectl-darwin-amd64"
      sha256 "b571995fc06e8e9585054e27965b98b6c591911f93623205a2c2179041aa289b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/inerplat/wirekube/releases/download/v0.0.16/wirekubectl-linux-arm64"
      sha256 "0f5f9baebab88ea9c360a0f32559453567fafb62c58cb901bebaa71ccfd22272"
    end
    on_intel do
      url "https://github.com/inerplat/wirekube/releases/download/v0.0.16/wirekubectl-linux-amd64"
      sha256 "822ae613fdcce61298a82dd7920c31c908ad5e3327a22d48941e3938a5641fef"
    end
  end

  def install
    bin.install Dir["wirekubectl-*"].first => "wirekubectl"
  end

  def caveats
    <<~EOS
      The formula installs the wirekubectl client. It does not modify a cluster.
      Start with a dry run and review the relay topology before installation:

        wirekubectl install --dry-run --kubeconfig ~/.kube/config
        wirekubectl install --kubeconfig ~/.kube/config

      A managed relay may create public LoadBalancer Services depending on the
      selected installation plan.
    EOS
  end

  test do
    output = shell_output("#{bin}/wirekubectl version")
    assert_match "Version:", output
    assert_match "v#{version}", output
  end
end
