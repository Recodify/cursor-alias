# Cursor Alias

Simple utility to allow launching Cursor from the command line when using AppImages on Linux.

Cursor has a built in update mechanism that means the AppImage file name will change on a regular basis. This utility is version aware and will automatically download the correct AppImage file.


## Installation

This will add a `cursor` alias to your `.bashrc` file.

Note: After installation, remember to reload your `.bashrc` file: `source ~/.bashrc`


### Method 1: Single line curl install
```bash
curl -sSL https://raw.githubusercontent.com/recodify/cursor-alias/main/install.sh | bash -s -- "path/to/dir/with/cursorAppImage"
```

e.g `curl -sSL https://raw.githubusercontent.com/recodify/cursor-alias/main/install.sh | bash -s -- "~/tools"`


### Method 2: Clone repo and install

```bash
git clone https://github.com/recodify/cursor-alias.git
cd cursor-alias
chmod +x install.sh
./install.sh "path/to/dir/with/cursorAppImage"
```

## Usage

#### Launch Cursor
```bash
cursor
```

#### Launch Cursor and open the current directory
```bash
cursor .
```

#### Launch Cursor and open a specific file
```bash
cursor readme.md
```

#### Launch Cursor and open a specific directory
```bash
cursor /path/to/directory
```
