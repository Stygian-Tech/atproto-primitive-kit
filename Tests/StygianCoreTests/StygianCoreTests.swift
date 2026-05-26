import StygianCore
import Testing

@Suite("ATURI")
struct ATURITests {
  @Test("parses canonical record URI")
  func parsesCanonicalRecordURI() {
    let uri = ATURI("at://did:plc:abc123/com.example.collection/rkey456")
    #expect(uri?.repo == "did:plc:abc123")
    #expect(uri?.collection == "com.example.collection")
    #expect(uri?.rkey == "rkey456")
    #expect(uri?.absoluteString == "at://did:plc:abc123/com.example.collection/rkey456")
  }

  @Test("rejects malformed URI")
  func rejectsMalformedURI() {
    #expect(ATURI("https://example.test") == nil)
    #expect(ATURI("at://did:plc:abc") == nil)
  }
}

@Suite("DID")
struct DIDTests {
  @Test("normalizes valid DID")
  func normalizesValidDID() throws {
    let normalized = try DID.normalize("  did:plc:abc123  ")
    #expect(normalized == "did:plc:abc123")
  }

  @Test("rejects invalid DID")
  func rejectsInvalidDID() {
    #expect(throws: StygianError.self) {
      try DID.normalize("plc:abc123")
    }
  }
}

@Suite("NSID")
struct NSIDTests {
  @Test("parses collection NSID")
  func parsesCollectionNSID() {
    let nsid = NSID("com.example.collection")
    #expect(nsid?.authority == "com.example")
    #expect(nsid?.name == "collection")
  }

  @Test("rejects too few labels")
  func rejectsTooFewLabels() {
    #expect(NSID("com.example") == nil)
  }
}

@Suite("StygianError")
struct StygianErrorTests {
  @Test("error cases are equatable")
  func equatableCases() {
    #expect(StygianError.invalidATURI("x") == StygianError.invalidATURI("x"))
    #expect(StygianError.invalidATURI("x") != StygianError.invalidATURI("y"))
  }
}
