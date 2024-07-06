# Dotfiles

## Installation

Paste this into your terminal(analyze the codes first, just to make sure you aren't get hacked or something, don't trust a random stranger):
```
git clone https://github.com/wykret/dotfiles
cd dotfiles
chmod +x installeverything.sh
```

## Firefox 
Open about:config and change the value of `toolkit.legacyUserProfileCustomizations.stylesheets` to `false`
And then, paste this, assuming you are inside the cloned repo:
```
cp ./firefox/* ~/.mozilla/firefox/*release/
```
