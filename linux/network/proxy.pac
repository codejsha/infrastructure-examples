function FindProxyForURL(url, host) {
  var PROXY = "SOCKS5 127.0.0.1:1080";
  if (host === "example.com" || dnsDomainIs(host, ".example.com")) {
    return PROXY;
  }
  return "DIRECT";
}

