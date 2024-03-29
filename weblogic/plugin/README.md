# WebLogic Plugin

WebLogic plugin is a software module that integrates WebLogic Server with web servers.

## How to identify the plugin version

### Using DebugConfigInfo

Enable the query parameter:

```conf
DebugConfigInfo ON
```

Invoke:

```txt
http://www.example.com/helloworld?__WebLogicBridgeConfig
```

### Using strings command in linux

```bash
strings mod_wl.so | grep WLSPLUGINS
# WLSPLUGINS_12.2.1.3.0_LINUX.X64_170817.1846
# WebLogic Server Plugin version 12.2.1.3.0 <WLSPLUGINS_12.2.1.3.0_LINUX.X64_170817.1846>

# WLSPLUGINS_12.1.3.0.0_LINUX.X64_140429.1732
# WebLogic Server Plugin version 12.1.3 <WLSPLUGINS_12.1.3.0.0_LINUX.X64_140429.1732>

# WLSPLUGINS_11.1.1.9.0_LINUX.X64_150206.1116
# WebLogic Server Plugin version 1.1 <WLSPLUGINS_11.1.1.9.0_LINUX.X64_150206.1116>
```

### Using strings command in windows (Sysinternals strings required)

```powershell
strings64.exe iisproxy.dll | Select-String "WLSPLUGINS" -SimpleMatch -CaseSensitive
# WLSPLUGINS_12.2.1.3.0_WINDOWS.X64_170817.2030
# WebLogic Server Plugin version 12.2.1.3.0 <WLSPLUGINS_12.2.1.3.0_WINDOWS.X64_170817.2030>

# WLSPLUGINS_12.1.3.0.0_WINDOWS.X64_140429.1806
# WebLogic Server Plugin version 12.1.3 <WLSPLUGINS_12.1.3.0.0_WINDOWS.X64_140429.1806>

# WLSPLUGINS_11.1.1.9.0_WINDOWS.X64_150209.1021
# WebLogic Server Plugin version 1.1 <WLSPLUGINS_11.1.1.9.0_WINDOWS.X64_150209.1021>
```

- [Sysinternals Suite](https://docs.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite)
- [Sysinternals strings](https://docs.microsoft.com/en-us/sysinternals/downloads/strings)
