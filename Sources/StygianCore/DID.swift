import Foundation

/// Lightweight DID validation and normalization helpers.
public enum DID {
  public static func normalize(_ raw: String) throws -> String {
    let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
    guard trimmed.hasPrefix("did:") else {
      throw StygianError.invalidDID(raw)
    }
    let remainder = trimmed.dropFirst("did:".count)
    let parts = remainder.split(separator: ":", maxSplits: 1, omittingEmptySubsequences: false)
    guard parts.count == 2, !parts[0].isEmpty, !parts[1].isEmpty else {
      throw StygianError.invalidDID(raw)
    }
    return trimmed
  }

  public static func isValid(_ raw: String) -> Bool {
    (try? normalize(raw)) != nil
  }
}
