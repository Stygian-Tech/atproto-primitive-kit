import Foundation

/// Shared error surface for Stygian Swift packages.
public enum StygianError: Error, Equatable, Sendable {
  case invalidDID(String)
  case invalidNSID(String)
  case invalidATURI(String)
  case invalidInput(String)
  case missingValue(String)
}
