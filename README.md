# Homebrew MacEasySymbol Tap

这是 [MacEasySymbol](https://github.com/vaspike/MacEasySymbol) 的 Homebrew 第三方 tap 仓库。

## 什么是 MacEasySymbol？

MacEasySymbol 是一个为使用原生中文输入法用户设计的 macOS 应用，能够智能自动转换中文符号为英文符号。

## 安装

### 添加 tap

```bash
brew tap vaspike/maceasysymbol
```

### 安装应用

```bash
brew install --cask MacEasySymbol
```

### 一键安装（推荐）

```bash
brew install --cask vaspike/maceasysymbol/maceasysymbol
```

## 卸载

```bash
brew uninstall --cask maceasysymbol
```

## 功能特性

- 🔄 **自动符号转换**: 将中文符号自动转换为英文符号
- 🎯 **智能识别**: 支持多种中文符号的识别和转换  
- 🖱️ **状态栏控制**: 通过状态栏图标轻松控制开关
- 🔒 **权限管理**: 自动处理辅助功能权限申请
- ✨ **全局快捷键**: 支持自定义快捷键快速启用/禁用（默认 ⌘⌥S）

## 支持的符号转换

| 中文符号 | 英文符号 | 说明 |
|---------|---------|------|
| ， | , | 逗号 |
| 。 | . | 句号 |
| ； | ; | 分号 |
| ： | : | 冒号 |
| ？ | ? | 问号 |
| ！ | ! | 感叹号 |
| "" | "" | 双引号 |
| '' | '' | 单引号 |
| （） | () | 括号 |
| 【】 | [] | 方括号 |
| 、 | / | 顿号→斜杠 |
| —— | _ | 长破折号→下划线 |
| · | ` | 间隔号 |
| ¥ | $ | 人民币符号 |
| …… | ^ | 省略号 |
| 《》 | <> | 尖括号 |
| ｜ | \| | 竖线 |
| ～ | ~ | 波浪号 |
| 「」 | {} | 大括号 |

## 使用说明

1. **启动应用**: 安装后在 Applications 文件夹中启动 MacEasySymbol
2. **授予权限**: 首次运行时会提示授予辅助功能权限
3. **状态栏控制**: 在状态栏中可以看到应用图标
   - ⚡ 图标表示介入模式已启用
   - ○ 图标表示不介入模式
4. **切换模式**: 点击状态栏图标或菜单项来切换模式
5. **全局快捷键**: 默认使用 ⌘⌥S 来切换介入模式

## 系统要求

- macOS 11.5 (Big Sur) 或更高版本
- 需要授予辅助功能权限

## 许可证

MIT License

## 相关链接

- [MacEasySymbol 源码仓库](https://github.com/vaspike/MacEasySymbol)
- [GitHub Releases](https://github.com/vaspike/MacEasySymbol/releases)
- [问题反馈](https://github.com/vaspike/MacEasySymbol/issues)

## 贡献

欢迎提交 Issue 和 Pull Request! 