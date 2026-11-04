# Fork changes

## OBD-II scripting and polling

- Added an `obd` JavaScript object for ISO-TP Mode 01, Mode 09, and Mode 22 read
  requests, with an allowlist that rejects other services.
- Added optional Mode 01 batching of up to six PIDs per request. It is off by
  default and is stored in OBD poll set JSON.
- Documented the OBD scripting interface and batching option in the help pages.
