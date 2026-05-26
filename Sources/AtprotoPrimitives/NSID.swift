import Foundation

/// AT Protocol NSID (`com.example.collection`) parser and validator.
public struct NSID: Equatable, Sendable, Hashable {
  public let authority: String
  public let name: String

  public var absoluteString: String {
    "\(authority).\(name)"
  }

  public init?(_ raw: String) {
    let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    guard !trimmed.isEmpty else { return nil }

    let labels = trimmed.split(separator: ".", omittingEmptySubsequences: false).map(String.init)
    guard labels.count >= 3 else { return nil }
    guard labels.allSatisfy(Self.isValidLabel) else { return nil }

    name = labels[labels.count - 1]
    authority = labels.dropLast().joined(separator: ".")
    guard !authority.isEmpty, !name.isEmpty else { return nil }
  }

  private static func isValidLabel(_ label: String) -> Bool {
    guard !label.isEmpty, label.count <= 63 else { return false }
    guard let first = label.first, first.isLetter || first.isNumber else { return false }
    return label.allSatisfy { $0.isLetter || $0.isNumber || $0 == "-" }
  }
}

public enum NSIDValidation {
  public static func normalize(_ raw: String) throws -> String {
    guard let nsid = NSID(raw) else {
      throw StygianError.invalidNSID(raw)
    }
    return nsid.absoluteString
  }
}
