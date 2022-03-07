# Auto Ricer

## Usage (downloading requires a network connection, but installing from a cloned repo can be done offline): 

Add a user, su.:

```
# do this as root.
pacman -S git curl
useradd demo
su demo
```

Run, It will prompt for your root password.

```
curl https://raw.githubusercontent.com/10maurycy10/auto-ricer/main/bootstrap.sh | bash
```

OR: Download and run the script. It will prompt for your root password.

```
git clone https://github.com/10maurycy10/auto-ricer
cd auto-ricer
./install.sh
```

## Saftey

Apart from installing packages, the script wont touch stuff outside of ``~``.

If run as a new user with ``su`` it wont ovewrite your config files.
