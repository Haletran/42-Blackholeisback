# 42-Blackhole_is_back

Simple ruby program to get your real blackhole instead of the new milestone system.

## Dependencies

```
sudo apt install ruby
sudo gem install oauth2 json colorize
```
## Installation

```
git clone https://github.com/Haletran/42-Blackholeisback.git
```

## Environmnent Variables

To run this project, you will need to add the following environment 
variables to **getinfo.rb** file: 
- UID
- SECRET

To get those variables you need to create an application in [42intra](https://profile.intra.42.fr/oauth/applications).

## Usage

```
ruby getinfo.rb <your-login>
```

## Documentation

[Documentation](https://api.intra.42.fr/apidoc)
