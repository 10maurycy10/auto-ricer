# Auto Ricer

## Usage:

Add a user, su.:

```
# do this as root.
pacman -S git
useradd demo
su demo
```

Connect to a network.

Download and run the script. It will prompt for your root password.

```
git clone https://github.com/10maurycy10/auto-ricer
cd auto-ricer
./install.sh
```

## Saftey

Apart from installing packages, the script wont touch stuff outside of ``~``.

If run as a new user with ``su`` it wont ovewrite your config files.
