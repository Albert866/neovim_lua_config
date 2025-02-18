# Lua config neovim MaxIDE

---

- Developer use system: Ubuntu version greater than 22.04 LTS

## tree

```text
├── coc-settings.json
├── images
│   ├── coc.png
│   ├── lazy.png
│   └── leaderf.png
├── init.lua
├── lazy-lock.json
├── lua
│   ├── colorscheme.lua
│   ├── config
│   │   ├── airline.lua
│   │   ├── doxygen_toolkit.lua
│   │   ├── leaderf.lua
│   │   ├── nerdcommenter.lua
│   │   ├── nvim-aerial.lua
│   │   ├── nvim-autopairs.lua
│   │   ├── nvim-coc.lua
│   │   ├── nvim-indent-blankline.lua
│   │   ├── nvim-markdown.lua
│   │   ├── nvim-tree.lua
│   │   ├── nvim-treesitter.lua
│   │   ├── nvim-treesitter-textobjects.lua
│   │   └── nvim-ts-rainbow.lua
│   ├── keymaps.lua
│   ├── options.lua
│   └── plugins.lua
└── README.md
```

## Add Display Pictures

![show leaderf](./images/leaderf.png)

![show lazy](./images/lazy.png)

![show coc](./images/coc.png)

## Install neovim

- neovim stable version greater than 0.10.0

```bash
sudo add-apt-repository ppa:neovim-ppa/stable -y
# OR sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update
sudo apt-get install -y neovim
nvim --version
```

OR

- Download neovim appimage and Install

```bash
# Select the latest version
https://github.com/neovim/neovim/releases
```

## Install nodejs

- nodejs version greater than 16.0

```bash
curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
node --version
```

## Install npm

```bash
sudo apt-get install -y npm
sudo npm install npm@latest -g
npm -v
sudo npm install -g neovim
```

## Install yarn

```bash
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/yarnpkg-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/yarnpkg-archive-keyring.gpg] https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install yarn
yarn --version
```

## Install python3

```bash
sudo apt-get install -y python3 python3-venv python3-dev python3-pip python3-neovim
python3 --version
pip3 install --upgrade pip
pip3 --version
pip3 install pynvim
pip3 install --upgrade pynvim
```

## Install ctags

```bash
sudo apt-get install -y universal-ctags
ctags --version
```

## Install clang and Set clang as default compiler

```bash
sudo apt-get install -y clang
clang --version
clang++ --version
```

- Set clang as default compiler

```bash
# update-alternatives --install <link> <name> <path> <priority>
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100
```

- OR

```bash
# update-alternatives --install <link> <name> <path> <priority>
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-14 100
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-14 100
# Switch between GCC and Clang toolchains
sudo update-alternatives --config cc
clang -v
# Switch between GCC and Clang++ toolchains
sudo update-alternatives --config c++
clang++ -v
```

### Install C/C++ language server

```bash
sudo apt-get install -y ccls
ccls --version
```

## Set terminal fonts

- Install nerd-fonts

```bash
# download FiraCode Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip

# unzip fonts
unzip FiraCode.zip -d ~/.local/share/fonts

# flush fonts cache
fc-cache -fv
```

- Terminal set fonts (`FiraCode Nerd Font Mono Regular 13`)

OR

```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hasklig.zip
unzip Hasklig.zip -d ~/.local/share/fonts
fc-cache -fv
```

### X-terminal set fonts

- Preferences -> Profiles -> default -> General -> Font

### System terminal set fonts

- Preferences -> Profiles -> Unnamed -> Custom font

## Config neovim

- Clone neovim config

```bash
cd ~/tools
git clone git@github.com:Albert866/neovim_lua_config.git
cd ~/.config
ln -s ~/tools/neovim_lua_config/ nvim
```

- Auto install plugins

  - > Open neovim `nvim`

- check health in neovim

```bash
:checkhealth
```

## Make compile_commands.json

---

### Makefile project

- sudo apt-get install -y bear
- Run `bear -- make`

### CMake project

```bash
cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
cmake --build build
```

OR into CMakeLists.txt file

```bash
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
```

### ninja project

```bash
gn gen out
ninja -C out -t compdb cc cxx > compile_commands.json
```
