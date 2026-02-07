#!/bin/bash
# Script to push the merged master branch to GitHub

echo "================================================"
echo "Push Merged Master Branch Script"
echo "================================================"
echo ""

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not in a git repository"
    exit 1
fi

echo "Current branches:"
git branch -a | grep -E "(master|main)"
echo ""

echo "Checking out master branch..."
git checkout master

if [ $? -ne 0 ]; then
    echo "Error: Failed to checkout master branch"
    exit 1
fi

echo ""
echo "Master branch status:"
git --no-pager log --oneline --graph -5
echo ""

echo "Files in master branch:"
ls -lA | grep -v "^total"
echo ""

echo "Ready to push master branch to origin."
echo "Run the following command to push:"
echo ""
echo "    git push origin master"
echo ""
echo "Or run this script with the --push flag:"
echo ""
echo "    ./push_merged_master.sh --push"
echo ""

# If --push flag is provided, push the branch
if [ "$1" = "--push" ]; then
    echo "Pushing master branch to origin..."
    git push origin master
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "✓ Successfully pushed master branch to GitHub!"
    else
        echo ""
        echo "✗ Failed to push master branch. Please check your credentials."
        exit 1
    fi
fi
