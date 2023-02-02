@echo off
set /p message=Commit message:
git add --all
git commit -m %message%
git push BetterPong