import Crypto
import Foundation

public enum Base64URLDecodingError: Error, Sendable {
  case invalidAlphabetLength
}

/// Base64URL helpers shared across Stygian packages.
public enum Base64URL {
  public static func decode(_ value: String) throws -> Data {
    var padded = value.replacingOccurrences(of: "-", with: "+").replacingOccurrences(of: "_", with: "/")
    let mod = padded.count % 4
    if mod != 0 { padded.append(String(repeating: "=", count: 4 - mod)) }
    guard let data = Data(base64Encoded: padded) else {
      throw Base64URLDecodingError.invalidAlphabetLength
    }
    return data
  }

  public static func encodeNoPadding<D: Digest>(digest: D) -> String {
    encodeNoPadding(data: digest.withUnsafeBytes { Data($0) })
  }

  public static func encodeNoPadding(data: Data) -> String {
    data.base64EncodedString()
      .replacingOccurrences(of: "+", with: "-")
      .replacingOccurrences(of: "/", with: "_")
      .replacingOccurrences(of: "=", with: "")
  }
}
