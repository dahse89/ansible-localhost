# Ansible für meinen Host
## Vorraussetzungen
- dieses Setup funktioniert nur für Debian bases Systeme
- python3 und ansible müssen installiert sein
  ```
  sudo apt install python3 python-is-python3 ansible
  ```
- es muss ein User `pdahse` existieren 
- user muss sudo ohne pw haben

## Ungereimtheiten
### oh-my-zsh
Aktuell muss man hier die default shell manuell hinzufügen
```
chsh -s $(which zsh)
```
Hier muss das PW eingegeben werden, welches sich ja unterscheiden kann, deshalb erstmal übersprungen

### Notable
not apt use deb pkg etc