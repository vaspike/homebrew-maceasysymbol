#!/bin/bash

# MacEasySymbol Homebrew Formula 自动更新脚本
# 用法: ./update_formula.sh <版本号>
# 示例: ./update_formula.sh 1.1.3

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印带颜色的消息
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 检查参数
VERSION=$1
if [ -z "$VERSION" ]; then
    print_error "缺少版本号参数"
    echo "用法: $0 <版本号>"
    echo "示例: $0 1.1.3"
    exit 1
fi

# 验证版本号格式
if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    print_error "版本号格式不正确，应为 x.y.z 格式"
    exit 1
fi

print_info "开始更新 MacEasySymbol Homebrew Formula 到版本 v$VERSION"

# 配置
REPO_OWNER="vaspike"
REPO_NAME="MacEasySymbol"
DMG_FILE="MacEasySymbol-signed-${VERSION}.dmg"
DMG_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}/releases/download/v${VERSION}/${DMG_FILE}"
FORMULA_FILE="Formula/maceasysmbol.rb"
TEMP_DIR="temp_update"

# 创建临时目录
mkdir -p "$TEMP_DIR"

print_info "下载 DMG 文件: $DMG_FILE"
echo "从 URL: $DMG_URL"

# 下载 DMG 文件
if curl -L --fail -o "$TEMP_DIR/$DMG_FILE" "$DMG_URL"; then
    print_success "DMG 文件下载成功"
else
    print_error "下载 DMG 文件失败"
    print_error "请检查："
    echo "  1. 版本号是否正确"
    echo "  2. GitHub release 是否已发布"
    echo "  3. DMG 文件是否存在"
    echo "  4. 网络连接是否正常"
    rm -rf "$TEMP_DIR"
    exit 1
fi

# 计算 SHA256
print_info "计算 SHA256 哈希值..."
SHA256=$(shasum -a 256 "$TEMP_DIR/$DMG_FILE" | cut -d' ' -f1)
print_success "SHA256: $SHA256"

# 检查 formula 文件是否存在
if [ ! -f "$FORMULA_FILE" ]; then
    print_error "Formula 文件不存在: $FORMULA_FILE"
    rm -rf "$TEMP_DIR"
    exit 1
fi

# 备份原始 formula
cp "$FORMULA_FILE" "$TEMP_DIR/maceasysmbol.rb.backup"
print_info "已备份原始 formula 文件"

# 更新 formula
print_info "更新 formula 文件..."

# 更新版本号
if sed -i.tmp "s/version \".*\"/version \"$VERSION\"/" "$FORMULA_FILE"; then
    print_success "版本号更新成功"
else
    print_error "更新版本号失败"
    cp "$TEMP_DIR/maceasysmbol.rb.backup" "$FORMULA_FILE"
    rm -rf "$TEMP_DIR"
    exit 1
fi

# 更新 SHA256
if sed -i.tmp "s/sha256 \".*\"/sha256 \"$SHA256\"/" "$FORMULA_FILE"; then
    print_success "SHA256 更新成功"
else
    print_error "更新 SHA256 失败"
    cp "$TEMP_DIR/maceasysmbol.rb.backup" "$FORMULA_FILE"
    rm -rf "$TEMP_DIR"
    exit 1
fi

# 清理临时文件
rm -f "$FORMULA_FILE.tmp"

print_info "验证 formula 语法..."
if command -v brew >/dev/null 2>&1; then
    if brew audit --strict "$FORMULA_FILE" 2>/dev/null; then
        print_success "Formula 语法验证通过"
    else
        print_warning "Formula 语法验证失败，但这可能是正常的"
        print_info "请手动检查 formula 文件"
    fi
else
    print_warning "未检测到 Homebrew，跳过语法验证"
fi

# 显示更改摘要
print_info "更改摘要:"
echo "  版本: $VERSION"
echo "  SHA256: $SHA256"
echo "  文件: $FORMULA_FILE"

# 显示 Git 状态
if command -v git >/dev/null 2>&1 && [ -d ".git" ]; then
    print_info "Git 状态:"
    git diff --stat
    echo
    print_info "Git diff 预览:"
    git diff "$FORMULA_FILE" | head -20
    if [ $(git diff "$FORMULA_FILE" | wc -l) -gt 20 ]; then
        echo "... (更多更改)"
    fi
fi

# 清理
rm -rf "$TEMP_DIR"

print_success "Formula 更新完成!"
echo
print_info "下一步操作:"
echo "1. 检查更改内容:"
echo "   git diff $FORMULA_FILE"
echo
echo "2. 提交更改:"
echo "   git add $FORMULA_FILE"
echo "   git commit -m \"Update to v$VERSION\""
echo "   git push origin main"
echo
echo "3. 测试安装 (可选):"
echo "   brew install --cask $(basename $(pwd))/maceasysmbol"
echo
echo "4. 更新主项目 README 添加 Homebrew 安装方法"

print_success "所有操作完成!" 