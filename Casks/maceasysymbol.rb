cask "maceasysymbol" do
  desc "一个为使用中文输入的用户设计的 macOS 应用，能够让你在中文输入时使用英文标点"
  homepage "https://github.com/vaspike/MacEasySymbol"
  version "2.3.1"
  url "https://github.com/vaspike/MacEasySymbol/releases/download/#{version}/MacEasySymbol-#{version}.dmg"
  sha256 "aa9a59e1f1d5f08428aa5144849ba74ca3a116d256f1bb29de81ff594b5183d0"

  depends_on macos: ">= :big_sur"

  app "MacEasySymbol.app"

  caveats <<~EOS
    MacEasySymbol 已安装到 /Applications/MacEasySymbol.app

    首次使用时需要：
    1. 在 Applications 文件夹中启动 MacEasySymbol
    2. 授予辅助功能权限：系统偏好设置 > 安全性与隐私 > 隐私 > 辅助功能
    3. 重启应用(确保授予的`辅助功能`权限应用中生效)
    4. 通过状态栏图标控制应用状态

    功能特性：
    • 在中文输入时使用英文标点
    • 全局快捷键支持（默认 ⌘⌥S）
    • 状态栏控制界面
    • 支持 20+ 种符号转换
    • (新功能) 白名单应用自定义

    更多信息请访问：https://github.com/vaspike/MacEasySymbol
  EOS
end 
