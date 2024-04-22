# UDP-CUSTOM

- add new user: ``` useradd -M change_me -s /bin/false -e 2024-12-30 && passwd change_me ```
- only supports x64 bit

```
wget -q https://raw.githubusercontent.com/feely666/udp-custom/main/udp-custom.sh && chmod +x udp-custom.sh && ./udp-custom.sh
```

```
wget -q https://raw.githubusercontent.com/feely666/udp-custom/main/udp-custom.sh && chmod +x udp-custom.sh && ./udp-custom.sh [ex port]
```
[optional port exclude separated by coma, ex. 53,5300]

Note:
- use optional port exclude when port udp between 1-65535 already use by other udp tunnel, like badvpn, ovpn udp and other.
- edit path config /root/udp/config.json, after change it then reboot

## Credit
> [ePro Dev. Team](https://t.me/s/ePro_Dev_Team)
