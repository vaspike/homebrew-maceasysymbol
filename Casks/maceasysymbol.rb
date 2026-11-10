# frozen_string_literal: true

cask "maceasysymbol" do
  version "2.6.0"
  sha256 "60d1a3c76c98caa4715c21dd5e9bb5664917e2355a70a561f40e948379cc6ca1"

  url "https://github.com/vaspike/MacEasySymbol/releases/download/#{version}/MacEasySymbol-#{version}.dmg"
  name "MacEasySymbol"
  desc "中文输入时使用英文标点"
  homepage "https://github.com/vaspike/MacEasySymbol"

  depends_on macos: :monterey

  app "MacEasySymbol.app"

  caveats <<~EOS
    MacEasySymbol 已安装到 /Applications/MacEasySymbol.app

    首次使用时需要：
    1. 在 Applications 文件夹中启动 MacEasySymbol
    2. 授予辅助功能权限：系统设置 > 隐私与安全性 > 辅助功能
    3. 重启应用，确保辅助功能权限生效
    4. 通过菜单栏图标控制应用状态

    功能特性：
    • 可自定义设置要转换的符号
    • 自定义白名单应用
    • 在中文输入时使用英文标点
    • 全局快捷键支持（默认 ⌘⌥S）
    • 可持久隐藏菜单栏图标
    • 可设置登录时自动启动
    • 支持 20+ 种符号转换

    更多信息请访问：https://github.com/vaspike/MacEasySymbol
  EOS
end
