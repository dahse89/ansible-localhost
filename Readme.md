# Ansible für meinen Host
## Vorraussetzungen
- dieses Setup funktioniert nur für Debian bases Systeme
- python3 und ansible müssen installiert sein
  ```
  sudo apt install python3 python-is-python3
  ```
- es muss ein User `pdahse` existieren

## Ungereimtheiten
### oh-my-zsh
Aktuell muss man hier die default shell manuell hinzufügen
```
chsh -s $(which zsh)
```
Hier muss das PW eingegeben werden, welches sich ja unterscheiden kann, deshalb erstmal übersprungen
