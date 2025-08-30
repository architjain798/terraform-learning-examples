#!/bin/bash

# Setup script for Git hooks in Terraform learning repository
# This script configures Git to use the custom hooks in .githooks/

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[⚠]${NC} $1"
}

echo ""
print_info "🔧 Setting up Git hooks for Terraform learning repository..."
echo ""

# Check if we're in a Git repository
if [ ! -d ".git" ]; then
    echo "Error: This script must be run from the root of a Git repository"
    exit 1
fi

# Check if .githooks directory exists
if [ ! -d ".githooks" ]; then
    echo "Error: .githooks directory not found"
    exit 1
fi

# Configure Git to use .githooks directory
print_info "Configuring Git to use .githooks directory..."
git config core.hooksPath .githooks

print_success "Git hooks configured successfully!"

# Make sure hooks are executable
print_info "Setting executable permissions on hooks..."
chmod +x .githooks/*

print_success "Hook permissions set!"

# Optional: Install additional tools
echo ""
print_info "📦 Checking optional development tools..."

check_tool() {
    local tool=$1
    local install_cmd=$2

    if command -v "$tool" &> /dev/null; then
        print_success "$tool is already installed"
    else
        print_warning "$tool not found. Install with: $install_cmd"
    fi
}

# Check for recommended tools
check_tool "terraform" "https://terraform.io/downloads"
check_tool "tflint" "brew install tflint"
check_tool "markdownlint" "npm install -g markdownlint-cli"
check_tool "shellcheck" "brew install shellcheck"

echo ""
print_info "🎯 Git Hooks Overview:"
echo "  • pre-commit: Validates code before each commit"
echo "    - Checks for secrets and sensitive data"
echo "    - Validates Terraform formatting and syntax"
echo "    - Checks documentation quality"
echo "    - Validates shell scripts"
echo "    - Ensures proper example structure"

echo ""
print_info "💡 Usage Tips:"
echo "  • Hooks run automatically before each commit"
echo "  • Fix any issues reported by the hooks"
echo "  • Use 'git commit --no-verify' to skip hooks (not recommended)"
echo "  • Run '.githooks/pre-commit' manually to test"

echo ""
print_success "🎉 Git hooks setup complete!"
print_info "Your repository now has automated quality checks before each commit."
echo ""
