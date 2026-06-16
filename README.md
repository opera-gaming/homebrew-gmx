# opera-gaming/gmx

Homebrew tap for the GameMaker eXperimental CLI.

```
brew tap opera-gaming/gmx
brew install gmx
```

## VS Code extension (.vsix)

Each release also publishes the GameMakerX VS Code extension as a
`.vsix` asset. Install it with:

```
gh release download --repo opera-gaming/homebrew-gmx --pattern 'gmx-*.vsix' --clobber
code --install-extension gmx-*.vsix
```

Or grab a specific version directly from the
[releases page](https://github.com/opera-gaming/homebrew-gmx/releases)
and run `code --install-extension <file>.vsix`.
