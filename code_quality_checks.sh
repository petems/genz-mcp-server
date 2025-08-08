#!/bin/bash

# GenZ MCP Server - Code Quality Checks
# This script runs all required linting and testing checks before committing changes.
# ALL checks must pass 100% for CI/CD to succeed.

set -e  # Exit on any error

echo "🔍 Running Code Quality Checks for GenZ MCP Server"
echo "================================================="

# Determine Python command
if [[ -f ".genz_venv/bin/python" ]]; then
    PYTHON_CMD=".genz_venv/bin/python"
    PIP_CMD=".genz_venv/bin/pip"
    echo "✅ Using venv"
elif [[ -n "$VIRTUAL_ENV" ]]; then
    PYTHON_CMD="python"
    PIP_CMD="pip"
    echo "✅ Using activated virtual environment: $VIRTUAL_ENV"
else
    echo "❌ No virtual environment found!"
    echo "Please run: ./run-server.sh first to set up the environment"
    exit 1
fi
echo ""

# Check and install dev dependencies if needed
echo "🔍 Checking development dependencies..."
DEV_DEPS_NEEDED=false

# Check each dev dependency
for tool in ruff black isort pytest; do
    # Check if tool exists in venv or in PATH
    if [[ -f ".genz_venv/bin/$tool" ]] || command -v $tool &> /dev/null; then
        continue
    else
        DEV_DEPS_NEEDED=true
        break
    fi
done

if [ "$DEV_DEPS_NEEDED" = true ]; then
    echo "📦 Installing development dependencies..."
    $PIP_CMD install -q -r requirements-dev.txt
    echo "✅ Development dependencies installed"
else
    echo "✅ Development dependencies already installed"
fi

# Set tool paths
if [[ -f ".genz_venv/bin/ruff" ]]; then
    RUFF=".genz_venv/bin/ruff"
    BLACK=".genz_venv/bin/black"
    ISORT=".genz_venv/bin/isort"
    PYTEST=".genz_venv/bin/pytest"
else
    RUFF="ruff"
    BLACK="black"
    ISORT="isort"
    PYTEST="pytest"
fi
echo ""

# Step 1: Linting and Formatting
echo "📋 Step 1: Running Linting and Formatting Checks"
echo "--------------------------------------------------"

echo "🔧 Running ruff linting with auto-fix..."
$RUFF check --fix --exclude test_simulation_files --exclude .genz_venv

echo "🎨 Running black code formatting..."
$BLACK . --exclude="test_simulation_files/" --exclude=".genz_venv/"

echo "📦 Running import sorting with isort..."
$ISORT . --skip-glob=".genz_venv/*" --skip-glob="test_simulation_files/*"

echo "✅ Verifying all linting passes..."
$RUFF check --exclude test_simulation_files --exclude .genz_venv

echo "✅ Step 1 Complete: All linting and formatting checks passed!"
echo ""

# Step 2: Unit Tests
echo "🧪 Step 2: Running Complete Unit Test Suite"
echo "---------------------------------------------"

echo "🏃 Running unit tests (excluding integration tests)..."
$PYTHON_CMD -m pytest tests/ -v -x -m "not integration"

echo "✅ Step 2 Complete: All unit tests passed!"
echo ""

# Step 3: Final Summary
echo "🎉 All Code Quality Checks Passed!"
echo "=================================="
echo "✅ Linting (ruff): PASSED"
echo "✅ Formatting (black): PASSED" 
echo "✅ Import sorting (isort): PASSED"
echo "✅ Unit tests: PASSED"
echo ""
echo "🚀 Your code is ready for commit and GitHub Actions!"
echo "💡 Remember to add simulator tests if you modified tools"