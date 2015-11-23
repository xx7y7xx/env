function FindProxyForURL(url, host) {
    // Your proxy server name and port
    var proxyserver = '127.0.0.1:9999';
    //
    //  Here's a list of hosts to connect via the PROXY server
    //
    var proxylist = new Array(
        "nixcraft.com",
        "reddit.com",
        "www.cyberciti.biz",
        "mail.google.com",
        "www.pandora.com",
        "www.google.com"
    );

// If the requested website is hosted within the internal network, send direct.
    if (isPlainHostName(host) ||
        shExpMatch(host, "*.local") ||
        isInNet(dnsResolve(host), "192.168.0.0",  "255.255.0.0") ||
        isInNet(host, "192.168.0.0",  "255.255.0.0") ||
        isInNet(dnsResolve(host), "127.0.0.0", "255.255.255.0"))
        return "DIRECT";

    // Return our proxy name for matched domains/hosts
    for(var i=0; i<proxylist.length; i++) {
        var value = proxylist[i];
        if ( localHostOrDomainIs(host, value) ) {
            //return "PROXY "+proxyserver;
            return "SOCKS "+proxyserver;
        }
    }
    return "DIRECT";
}
