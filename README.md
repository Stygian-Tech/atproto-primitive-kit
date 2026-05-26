# stygian-core

Shared AT Protocol primitives for Stygian Swift packages: DID validation, AT-URI parsing, NSID parsing, Base64URL helpers, and shared errors.

## Requirements

- Swift 6.0+
- macOS 14+ / iOS 17+

## Usage

```swift
import StygianCore

let uri = ATURI("at://did:plc:abc/com.example.post/3jz...")
let nsid = NSID("com.example.collection")
let did = try DID.normalize("did:plc:abc123")
```

## Development

```bash
scripts/bootstrap.sh
scripts/check.sh
```

## License

MIT — see [LICENSE](LICENSE).
