# atproto-primitive-kit

Shared AT Protocol primitives for Swift packages: DID validation, AT-URI parsing, NSID parsing, Base64URL helpers, and shared errors.

Swift product: **`ATProtoPrimitiveKit`**

## Usage

```swift
import ATProtoPrimitiveKit

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

MIT
