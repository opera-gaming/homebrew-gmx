# opera-emoller/gmx

Homebrew tap for the GameMaker eXperimental CLI.

```
brew tap opera-emoller/gmx
brew install gmx
```

## VS Code extension (.vsix)

Each release also publishes the GameMakerX VS Code extension as a
`.vsix` asset. Install it with:

```
gh release download --repo opera-emoller/homebrew-gmx --pattern 'gamemakerx-*.vsix' --clobber
code --install-extension gamemakerx-*.vsix
```

Or grab a specific version directly from the
[releases page](https://github.com/opera-emoller/homebrew-gmx/releases)
and run `code --install-extension <file>.vsix`.
