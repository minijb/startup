sudo apt update
sudo apt install curl build-essential gcc make
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "source $HOME/.cargo/env" >> ~/.bashrc
source ~/.bashrc

