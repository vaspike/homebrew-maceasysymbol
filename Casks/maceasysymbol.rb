class Maceasysmbol < Formula
  desc "智能转换中文符号为英文符号的 macOS 应用"
  homepage "https://github.com/vaspike/MacEasySymbol"
  version "1.1.2"
  url "https://github.com/vaspike/MacEasySymbol/releases/download/v#{version}/MacEasySymbol-signed-#{version}.dmg"
  sha256 "56a84317eb924b43aea906f735568ddc5f3d668ad8cb2dfe2ed48535214e5ab8"
  license "MIT"

  depends_on macos: ">= :big_sur"

  app "MacEasySymbol.app"

  def install
    # DMG 挂载后直接复制应用到 Applications
    app.install Dir["MacEasySymbol.app"]
  end

  def caveats
    <<~EOS
      MacEasySymbol 已安装到 /Applications/MacEasySymbol.app

      首次使用时需要：
      1. 在 Applications 文件夹中启动 MacEasySymbol
      2. 授予辅助功能权限：系统偏好设置 > 安全性与隐私 > 隐私 > 辅助功能
      3. 通过状态栏图标控制应用状态

      功能特性：
      • 自动转换中文符号为英文符号
      • 全局快捷键支持（默认 ⌘⌥S）
      • 状态栏控制界面
      • 支持 20+ 种符号转换

      更多信息请访问：https://github.com/vaspike/MacEasySymbol
    EOS
  end

  test do
    assert_predicate testpath/"MacEasySymbol.app", :exist?
  end
end 