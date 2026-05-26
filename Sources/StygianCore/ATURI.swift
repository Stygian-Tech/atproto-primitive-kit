import Foundation

/// Parsed AT Protocol record URI (`at://{repo}/{collection}/{rkey}`).
public struct ATURI: Equatable, Sendable, Hashable {
  public let repo: String
  public let collection: String
  public let rkey: String

  public init(repo: String, collection: String, rkey: String) {
    self.repo = repo
    self.collection = collection
    self.rkey = rkey
  }

  public init?(_ raw: String) {
    guard raw.hasPrefix("at://") else { return nil }
    let rest = raw.dropFirst("at://".count)
    let parts = rest.split(separator: "/", omittingEmptySubsequences: true).map(String.init)
    guard parts.count >= 3 else { return nil }
    repo = parts[0]
    collection = parts[1]
    rkey = parts[2]
  }

  public var absoluteString: String {
    "at://\(repo)/\(collection)/\(rkey)"
  }
}

public enum ATURINormalization {
  public static func normalizeRepoParam(_ raw: String) -> String {
    raw.trimmingCharacters(in: .whitespacesAndNewlines)
  }

  public static func rkey(from uri: String) -> String {
    uri.split(separator: "/").last.map(String.init) ?? uri
  }

  public static func repoAndPublicationFilter(from publicationId: String) -> (repoDid: String, publicationAtUri: String?) {
    if let at = ATURI(publicationId) {
      return (at.repo, publicationId)
    }
    return (publicationId, nil)
  }
}
