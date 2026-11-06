# SavvyCAN JSON Lines capture format

SavvyCAN can import and export `.jsonl` and `.ndjson` captures through the normal **File → Open Log File** and **Save Log File** dialogs. The format is UTF-8 JSON Lines: a version header followed by one frame object per line. Empty lines are ignored.

```json
{"format":"savvycan-jsonl","version":1}
{"timestamp_us":"10070","id":340,"extended":false,"rtr":false,"direction":"rx","bus":1,"dlc":8,"data":"003210000000E077","frame_type":0,"error":0,"fd":false,"brs":false,"esi":false,"time_delta":"0","frame_count":"0"}
```

`timestamp_us` is a base-10 string containing signed integer microseconds, avoiding rounding at large timestamps. `id` is the numeric arbitration ID; `extended` distinguishes 11-bit and 29-bit identifiers. `direction` is `rx` or `tx`; `bus` is the SavvyCAN channel number. `data` is uppercase hexadecimal and `dlc` is the payload byte count. For RTR frames, `data` is empty and `dlc` holds the requested length; SavvyCAN stores that separately from the payload. `rtr` identifies a remote request. `frame_type`, `error`, `fd`, `brs`, and `esi` preserve SavvyCAN frame type, error flags, and CAN FD flags. `time_delta` and `frame_count` preserve the corresponding internal capture bookkeeping.

Version 1 maps CAN frames into SavvyCAN's `CommFrame`. Loading validates the complete file before replacing the current frame list; unsupported versions, malformed JSON, invalid IDs, and inconsistent payload lengths are rejected.
