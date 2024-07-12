# kcat (formerly kafkacat)

kcat (formerly kafkacat) is a command-line utility for interacting with Apache Kafka clusters.
It can be used to produce and consume messages from Kafka topics, as well as perform various administrative tasks such as creating and deleting topics, checking the status of a Kafka cluster, and more.

## Install

### DNF/YUM

```bash
sudo dnf copr enable -y bvn13/kafkacat
sudo dnf update
sudo dnf install -y kafkacat
```

### APT

```bash
sudo apt-get install -y kafkacat
```

### Homebrew

```sh
brew install -y kcat
```

## References

- kcat: <https://github.com/edenhill/kcat>
