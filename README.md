# FOR MY ARCH

Обновить СПИСОК пакетов
```
sudo pacman -Sy
```
Обновить все пакеты
```
sudo pacman -Syyu
```
Обновить все пакеты (+AUR)
```
yay -Syu
```
Установить пакет
```
sudo pacman -S foo
yay -S foo
```
Удалить пакет и зависимости
```
sudo pacman -Rns foo
yay -Rns foo
```
Найти пакеты AUR
```
sudo pacman -Qm
```
найти ненужные зависимости
```
yay -Yc
```
_____________________________________________________________________

# FOR MY UBUNTU

### Update
```
sudo apt update && sudo apt upgrade
```
--------------------------------------------------------------------
### Kodecs+Gcc+Nvidia
```
sudo apt install ubuntu-restricted-extras libavcodec-extra
sudo apt -y install build-essential
sudo ubuntu-drivers autoinstall
```
--------------------------------------------------------------------
### Git
```
sudo apt install git
```
--------------------------------------------------------------------
### Python
```
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.11 python3.11-venv
```
--------------------------------------------------------------------
### Ansible + molecule + pip
```
sudo apt install python3-pip
pip3 install "ansible-lint"
python3.11 -m pip install ansible molecule
python3 -m pip install --upgrade --user ansible
python3.11 -m pip uninstall ansible molecule
```
--------------------------------------------------------------------
```
ansible --version
molecule --version
python3.11 -V
yes | sudo bash ubuntu.sh
sudo nano ~/.bashrc
alias upg="sudo apt update && sudo apt upgrade"
```
