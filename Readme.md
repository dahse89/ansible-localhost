# My ansible host setup 

## Requirements
- The `main` branch is currenly for Fedora
- `python` und `ansible` must be installed
  ```
  python -m pip install --user ansible==2.9.27
  ```
- There must be a user `pdahse` having sudo without password privileges

## Manually Setups
### oh-my-zsh
You need to make zsh as the default shell by your own
```
chsh -s $(which zsh)
```
