# Post-clone initialization. Run once after creating a repo from this template.
$ErrorActionPreference = "Stop"

Write-Host "Initializing repo..." -ForegroundColor Cyan

# Configure git to use committed hooks
if (Test-Path ".githooks") {
    git config core.hooksPath .githooks
    Write-Host "Git hooks configured (.githooks/)." -ForegroundColor Green
} else {
    Write-Host "Warning: .githooks/ not found." -ForegroundColor Yellow
}

# Set up branch protection via GitHub CLI
if (Get-Command gh -ErrorAction SilentlyContinue) {
    Write-Host "Setting up branch protection on main..." -ForegroundColor Cyan
    $jsonPayload = @'
{
  "required_status_checks": {
    "strict": true,
    "contexts": ["lint"]
  },
  "enforce_admins": false,
  "required_pull_request_reviews": {
    "required_approving_review_count": 0
  },
  "restrictions": null
}
'@
    $jsonPayload | gh api -X PUT "repos/{owner}/{repo}/branches/main/protection" --input -
    Write-Host "Branch protection enabled." -ForegroundColor Green
} else {
    Write-Host "Warning: gh CLI not found. Set up branch protection manually." -ForegroundColor Yellow
}

Write-Host "Done." -ForegroundColor Green
