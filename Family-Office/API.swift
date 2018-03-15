//  This file was automatically generated and should not be edited.

import Apollo

public final class AllApplicationsAssistantsQuery: GraphQLQuery {
  public static let operationString =
    "query AllApplicationsAssistants {\n  allSolicitudes {\n    __typename\n    ...SolicitudeADetails\n  }\n}"

  public static var requestString: String { return operationString.appending(SolicitudeADetails.fragmentString).appending(UserDetails.fragmentString).appending(AttachmentDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allSolicitudes", type: .list(.object(AllSolicitude.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(allSolicitudes: [AllSolicitude?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "allSolicitudes": allSolicitudes.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var allSolicitudes: [AllSolicitude?]? {
      get {
        return (snapshot["allSolicitudes"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { AllSolicitude(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "allSolicitudes")
      }
    }

    public struct AllSolicitude: GraphQLSelectionSet {
      public static let possibleTypes = ["Solicitude"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("assistant", type: .object(Assistant.selections)),
        GraphQLField("boss", type: .object(Boss.selections)),
        GraphQLField("status", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, assistant: Assistant? = nil, boss: Boss? = nil, status: String? = nil) {
        self.init(snapshot: ["__typename": "Solicitude", "id": id, "assistant": assistant.flatMap { $0.snapshot }, "boss": boss.flatMap { $0.snapshot }, "status": status])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var assistant: Assistant? {
        get {
          return (snapshot["assistant"] as! Snapshot?).flatMap { Assistant(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "assistant")
        }
      }

      public var boss: Boss? {
        get {
          return (snapshot["boss"] as! Snapshot?).flatMap { Boss(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "boss")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var solicitudeADetails: SolicitudeADetails {
          get {
            return SolicitudeADetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Assistant: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Boss: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class AssitantApplicationsMutation: GraphQLMutation {
  public static let operationString =
    "mutation AssitantApplications($aid: ID!) {\n  createSolicitude(assistant: $aid) {\n    __typename\n    ...SolicitudeADetails\n  }\n}"

  public static var requestString: String { return operationString.appending(SolicitudeADetails.fragmentString).appending(UserDetails.fragmentString).appending(AttachmentDetails.fragmentString) }

  public var aid: GraphQLID

  public init(aid: GraphQLID) {
    self.aid = aid
  }

  public var variables: GraphQLMap? {
    return ["aid": aid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createSolicitude", arguments: ["assistant": GraphQLVariable("aid")], type: .object(CreateSolicitude.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createSolicitude: CreateSolicitude? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createSolicitude": createSolicitude.flatMap { $0.snapshot }])
    }

    public var createSolicitude: CreateSolicitude? {
      get {
        return (snapshot["createSolicitude"] as! Snapshot?).flatMap { CreateSolicitude(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createSolicitude")
      }
    }

    public struct CreateSolicitude: GraphQLSelectionSet {
      public static let possibleTypes = ["Solicitude"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("assistant", type: .object(Assistant.selections)),
        GraphQLField("boss", type: .object(Boss.selections)),
        GraphQLField("status", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, assistant: Assistant? = nil, boss: Boss? = nil, status: String? = nil) {
        self.init(snapshot: ["__typename": "Solicitude", "id": id, "assistant": assistant.flatMap { $0.snapshot }, "boss": boss.flatMap { $0.snapshot }, "status": status])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var assistant: Assistant? {
        get {
          return (snapshot["assistant"] as! Snapshot?).flatMap { Assistant(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "assistant")
        }
      }

      public var boss: Boss? {
        get {
          return (snapshot["boss"] as! Snapshot?).flatMap { Boss(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "boss")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var solicitudeADetails: SolicitudeADetails {
          get {
            return SolicitudeADetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Assistant: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Boss: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class SignInUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation SignInUser($e: String!, $p: String!) {\n  signInUser(emailProvider: {email: $e, password: $p}) {\n    __typename\n    token\n    user {\n      __typename\n      ...UserDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetails.fragmentString).appending(AttachmentDetails.fragmentString) }

  public var e: String
  public var p: String

  public init(e: String, p: String) {
    self.e = e
    self.p = p
  }

  public var variables: GraphQLMap? {
    return ["e": e, "p": p]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("signInUser", arguments: ["emailProvider": ["email": GraphQLVariable("e"), "password": GraphQLVariable("p")]], type: .object(SignInUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(signInUser: SignInUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "signInUser": signInUser.flatMap { $0.snapshot }])
    }

    public var signInUser: SignInUser? {
      get {
        return (snapshot["signInUser"] as! Snapshot?).flatMap { SignInUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "signInUser")
      }
    }

    public struct SignInUser: GraphQLSelectionSet {
      public static let possibleTypes = ["SignInPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .scalar(String.self)),
        GraphQLField("user", type: .object(User.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(token: String? = nil, user: User? = nil) {
        self.init(snapshot: ["__typename": "SignInPayload", "token": token, "user": user.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return snapshot["token"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "token")
        }
      }

      public var user: User? {
        get {
          return (snapshot["user"] as! Snapshot?).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class SignUpMutation: GraphQLMutation {
  public static let operationString =
    "mutation SignUp($name: String!, $email: String!, $password: String!, $phone: String!) {\n  createUser(name: $name, phone: $phone, emailProvider: {email: $email, password: $password}) {\n    __typename\n    token\n    user {\n      __typename\n      ...UserDetails\n      families {\n        __typename\n        family {\n          __typename\n          photo {\n            __typename\n            ...AttachmentDetails\n          }\n          name\n          id\n        }\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetails.fragmentString).appending(AttachmentDetails.fragmentString) }

  public var name: String
  public var email: String
  public var password: String
  public var phone: String

  public init(name: String, email: String, password: String, phone: String) {
    self.name = name
    self.email = email
    self.password = password
    self.phone = phone
  }

  public var variables: GraphQLMap? {
    return ["name": name, "email": email, "password": password, "phone": phone]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["name": GraphQLVariable("name"), "phone": GraphQLVariable("phone"), "emailProvider": ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")]], type: .object(CreateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createUser: CreateUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createUser": createUser.flatMap { $0.snapshot }])
    }

    public var createUser: CreateUser? {
      get {
        return (snapshot["createUser"] as! Snapshot?).flatMap { CreateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["SignInPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .scalar(String.self)),
        GraphQLField("user", type: .object(User.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(token: String? = nil, user: User? = nil) {
        self.init(snapshot: ["__typename": "SignInPayload", "token": token, "user": user.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return snapshot["token"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "token")
        }
      }

      public var user: User? {
        get {
          return (snapshot["user"] as! Snapshot?).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
          GraphQLField("families", type: .nonNull(.list(.object(Family.selections)))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil, families: [Family?]) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }, "families": families.map { $0.flatMap { $0.snapshot } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var families: [Family?] {
          get {
            return (snapshot["families"] as! [Snapshot?]).map { $0.flatMap { Family(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "families")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        public struct Family: GraphQLSelectionSet {
          public static let possibleTypes = ["FamilyMembership"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("family", type: .nonNull(.object(Family.selections))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(family: Family) {
            self.init(snapshot: ["__typename": "FamilyMembership", "family": family.snapshot])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var family: Family {
            get {
              return Family(snapshot: snapshot["family"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "family")
            }
          }

          public struct Family: GraphQLSelectionSet {
            public static let possibleTypes = ["Family"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("photo", type: .object(Photo.selections)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(photo: Photo? = nil, name: String? = nil, id: GraphQLID) {
              self.init(snapshot: ["__typename": "Family", "photo": photo.flatMap { $0.snapshot }, "name": name, "id": id])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var photo: Photo? {
              get {
                return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue?.snapshot, forKey: "photo")
              }
            }

            public var name: String? {
              get {
                return snapshot["name"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public struct Photo: GraphQLSelectionSet {
              public static let possibleTypes = ["Attachment"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("mime", type: .scalar(String.self)),
                GraphQLField("ext", type: .scalar(String.self)),
                GraphQLField("url", type: .scalar(String.self)),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("routes", type: .list(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
                self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var mime: String? {
                get {
                  return snapshot["mime"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "mime")
                }
              }

              public var ext: String? {
                get {
                  return snapshot["ext"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "ext")
                }
              }

              public var url: String? {
                get {
                  return snapshot["url"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "url")
                }
              }

              public var name: String? {
                get {
                  return snapshot["name"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }

              public var routes: [String?]? {
                get {
                  return snapshot["routes"] as? [String?]
                }
                set {
                  snapshot.updateValue(newValue, forKey: "routes")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var attachmentDetails: AttachmentDetails {
                  get {
                    return AttachmentDetails(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class CreateChatGroupMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateChatGroup($users: [ID]!, $name: String!) {\n  createChatGroup(users: $users, name: $name) {\n    __typename\n    ...ChatDetails\n    members {\n      __typename\n      ...ChatMembershipDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(ChatDetails.fragmentString).appending(FamilyDetails.fragmentString).appending(AttachmentDetails.fragmentString).appending(ChatMessageDetails.fragmentString).appending(UserDetails.fragmentString).appending(ChatMembershipDetails.fragmentString) }

  public var users: [GraphQLID?]
  public var name: String

  public init(users: [GraphQLID?], name: String) {
    self.users = users
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["users": users, "name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createChatGroup", arguments: ["users": GraphQLVariable("users"), "name": GraphQLVariable("name")], type: .nonNull(.object(CreateChatGroup.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createChatGroup: CreateChatGroup) {
      self.init(snapshot: ["__typename": "Mutation", "createChatGroup": createChatGroup.snapshot])
    }

    public var createChatGroup: CreateChatGroup {
      get {
        return CreateChatGroup(snapshot: snapshot["createChatGroup"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "createChatGroup")
      }
    }

    public struct CreateChatGroup: GraphQLSelectionSet {
      public static let possibleTypes = ["Chat"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("family", type: .object(Family.selections)),
        GraphQLField("group", type: .object(Group.selections)),
        GraphQLField("last_message", type: .object(LastMessage.selections)),
        GraphQLField("members", type: .nonNull(.list(.object(Member.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, family: Family? = nil, group: Group? = nil, lastMessage: LastMessage? = nil, members: [Member?]) {
        self.init(snapshot: ["__typename": "Chat", "id": id, "family": family.flatMap { $0.snapshot }, "group": group.flatMap { $0.snapshot }, "last_message": lastMessage.flatMap { $0.snapshot }, "members": members.map { $0.flatMap { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var family: Family? {
        get {
          return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "family")
        }
      }

      public var group: Group? {
        get {
          return (snapshot["group"] as! Snapshot?).flatMap { Group(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "group")
        }
      }

      public var lastMessage: LastMessage? {
        get {
          return (snapshot["last_message"] as! Snapshot?).flatMap { LastMessage(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "last_message")
        }
      }

      public var members: [Member?] {
        get {
          return (snapshot["members"] as! [Snapshot?]).map { $0.flatMap { Member(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "members")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var chatDetails: ChatDetails {
          get {
            return ChatDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Family: GraphQLSelectionSet {
        public static let possibleTypes = ["Family"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var familyDetails: FamilyDetails {
            get {
              return FamilyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Group: GraphQLSelectionSet {
        public static let possibleTypes = ["ChatGroup"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "ChatGroup", "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct LastMessage: GraphQLSelectionSet {
        public static let possibleTypes = ["ChatMessage"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sender", type: .object(Sender.selections)),
          GraphQLField("sent_at", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("attachment", type: .object(Attachment.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, sender: Sender? = nil, sentAt: Int? = nil, text: String? = nil, attachment: Attachment? = nil) {
          self.init(snapshot: ["__typename": "ChatMessage", "id": id, "sender": sender.flatMap { $0.snapshot }, "sent_at": sentAt, "text": text, "attachment": attachment.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var sender: Sender? {
          get {
            return (snapshot["sender"] as! Snapshot?).flatMap { Sender(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "sender")
          }
        }

        public var sentAt: Int? {
          get {
            return snapshot["sent_at"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "sent_at")
          }
        }

        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        public var attachment: Attachment? {
          get {
            return (snapshot["attachment"] as! Snapshot?).flatMap { Attachment(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "attachment")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var chatMessageDetails: ChatMessageDetails {
            get {
              return ChatMessageDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Sender: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .scalar(String.self)),
            GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
            GraphQLField("photo", type: .object(Photo.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var email: String {
            get {
              return snapshot["email"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "email")
            }
          }

          public var phone: String? {
            get {
              return snapshot["phone"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone")
            }
          }

          public var userType: String {
            get {
              return snapshot["user_type"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_type")
            }
          }

          public var photo: Photo? {
            get {
              return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "photo")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var userDetails: UserDetails {
              get {
                return UserDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Photo: GraphQLSelectionSet {
            public static let possibleTypes = ["Attachment"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("mime", type: .scalar(String.self)),
              GraphQLField("ext", type: .scalar(String.self)),
              GraphQLField("url", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("routes", type: .list(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
              self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mime: String? {
              get {
                return snapshot["mime"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "mime")
              }
            }

            public var ext: String? {
              get {
                return snapshot["ext"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "ext")
              }
            }

            public var url: String? {
              get {
                return snapshot["url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }

            public var name: String? {
              get {
                return snapshot["name"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var routes: [String?]? {
              get {
                return snapshot["routes"] as? [String?]
              }
              set {
                snapshot.updateValue(newValue, forKey: "routes")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var attachmentDetails: AttachmentDetails {
                get {
                  return AttachmentDetails(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }

        public struct Attachment: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes = ["ChatMembership"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("is_admin", type: .scalar(Bool.self)),
          GraphQLField("seen_at", type: .scalar(Int.self)),
          GraphQLField("user", type: .object(User.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, isAdmin: Bool? = nil, seenAt: Int? = nil, user: User? = nil) {
          self.init(snapshot: ["__typename": "ChatMembership", "id": id, "is_admin": isAdmin, "seen_at": seenAt, "user": user.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var isAdmin: Bool? {
          get {
            return snapshot["is_admin"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_admin")
          }
        }

        public var seenAt: Int? {
          get {
            return snapshot["seen_at"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "seen_at")
          }
        }

        public var user: User? {
          get {
            return (snapshot["user"] as! Snapshot?).flatMap { User(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "user")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var chatMembershipDetails: ChatMembershipDetails {
            get {
              return ChatMembershipDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .scalar(String.self)),
            GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
            GraphQLField("photo", type: .object(Photo.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var email: String {
            get {
              return snapshot["email"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "email")
            }
          }

          public var phone: String? {
            get {
              return snapshot["phone"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone")
            }
          }

          public var userType: String {
            get {
              return snapshot["user_type"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_type")
            }
          }

          public var photo: Photo? {
            get {
              return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "photo")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var userDetails: UserDetails {
              get {
                return UserDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Photo: GraphQLSelectionSet {
            public static let possibleTypes = ["Attachment"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("mime", type: .scalar(String.self)),
              GraphQLField("ext", type: .scalar(String.self)),
              GraphQLField("url", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("routes", type: .list(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
              self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mime: String? {
              get {
                return snapshot["mime"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "mime")
              }
            }

            public var ext: String? {
              get {
                return snapshot["ext"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "ext")
              }
            }

            public var url: String? {
              get {
                return snapshot["url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }

            public var name: String? {
              get {
                return snapshot["name"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var routes: [String?]? {
              get {
                return snapshot["routes"] as? [String?]
              }
              set {
                snapshot.updateValue(newValue, forKey: "routes")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var attachmentDetails: AttachmentDetails {
                get {
                  return AttachmentDetails(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class CreateChatMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateChat($user: ID!) {\n  createChat(user: $user) {\n    __typename\n    ...ChatDetails\n    members {\n      __typename\n      ...ChatMembershipDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(ChatDetails.fragmentString).appending(FamilyDetails.fragmentString).appending(AttachmentDetails.fragmentString).appending(ChatMessageDetails.fragmentString).appending(UserDetails.fragmentString).appending(ChatMembershipDetails.fragmentString) }

  public var user: GraphQLID

  public init(user: GraphQLID) {
    self.user = user
  }

  public var variables: GraphQLMap? {
    return ["user": user]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createChat", arguments: ["user": GraphQLVariable("user")], type: .nonNull(.object(CreateChat.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createChat: CreateChat) {
      self.init(snapshot: ["__typename": "Mutation", "createChat": createChat.snapshot])
    }

    public var createChat: CreateChat {
      get {
        return CreateChat(snapshot: snapshot["createChat"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "createChat")
      }
    }

    public struct CreateChat: GraphQLSelectionSet {
      public static let possibleTypes = ["Chat"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("family", type: .object(Family.selections)),
        GraphQLField("group", type: .object(Group.selections)),
        GraphQLField("last_message", type: .object(LastMessage.selections)),
        GraphQLField("members", type: .nonNull(.list(.object(Member.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, family: Family? = nil, group: Group? = nil, lastMessage: LastMessage? = nil, members: [Member?]) {
        self.init(snapshot: ["__typename": "Chat", "id": id, "family": family.flatMap { $0.snapshot }, "group": group.flatMap { $0.snapshot }, "last_message": lastMessage.flatMap { $0.snapshot }, "members": members.map { $0.flatMap { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var family: Family? {
        get {
          return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "family")
        }
      }

      public var group: Group? {
        get {
          return (snapshot["group"] as! Snapshot?).flatMap { Group(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "group")
        }
      }

      public var lastMessage: LastMessage? {
        get {
          return (snapshot["last_message"] as! Snapshot?).flatMap { LastMessage(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "last_message")
        }
      }

      public var members: [Member?] {
        get {
          return (snapshot["members"] as! [Snapshot?]).map { $0.flatMap { Member(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "members")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var chatDetails: ChatDetails {
          get {
            return ChatDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Family: GraphQLSelectionSet {
        public static let possibleTypes = ["Family"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var familyDetails: FamilyDetails {
            get {
              return FamilyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Group: GraphQLSelectionSet {
        public static let possibleTypes = ["ChatGroup"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "ChatGroup", "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct LastMessage: GraphQLSelectionSet {
        public static let possibleTypes = ["ChatMessage"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sender", type: .object(Sender.selections)),
          GraphQLField("sent_at", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("attachment", type: .object(Attachment.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, sender: Sender? = nil, sentAt: Int? = nil, text: String? = nil, attachment: Attachment? = nil) {
          self.init(snapshot: ["__typename": "ChatMessage", "id": id, "sender": sender.flatMap { $0.snapshot }, "sent_at": sentAt, "text": text, "attachment": attachment.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var sender: Sender? {
          get {
            return (snapshot["sender"] as! Snapshot?).flatMap { Sender(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "sender")
          }
        }

        public var sentAt: Int? {
          get {
            return snapshot["sent_at"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "sent_at")
          }
        }

        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        public var attachment: Attachment? {
          get {
            return (snapshot["attachment"] as! Snapshot?).flatMap { Attachment(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "attachment")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var chatMessageDetails: ChatMessageDetails {
            get {
              return ChatMessageDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Sender: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .scalar(String.self)),
            GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
            GraphQLField("photo", type: .object(Photo.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var email: String {
            get {
              return snapshot["email"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "email")
            }
          }

          public var phone: String? {
            get {
              return snapshot["phone"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone")
            }
          }

          public var userType: String {
            get {
              return snapshot["user_type"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_type")
            }
          }

          public var photo: Photo? {
            get {
              return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "photo")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var userDetails: UserDetails {
              get {
                return UserDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Photo: GraphQLSelectionSet {
            public static let possibleTypes = ["Attachment"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("mime", type: .scalar(String.self)),
              GraphQLField("ext", type: .scalar(String.self)),
              GraphQLField("url", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("routes", type: .list(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
              self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mime: String? {
              get {
                return snapshot["mime"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "mime")
              }
            }

            public var ext: String? {
              get {
                return snapshot["ext"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "ext")
              }
            }

            public var url: String? {
              get {
                return snapshot["url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }

            public var name: String? {
              get {
                return snapshot["name"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var routes: [String?]? {
              get {
                return snapshot["routes"] as? [String?]
              }
              set {
                snapshot.updateValue(newValue, forKey: "routes")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var attachmentDetails: AttachmentDetails {
                get {
                  return AttachmentDetails(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }

        public struct Attachment: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes = ["ChatMembership"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("is_admin", type: .scalar(Bool.self)),
          GraphQLField("seen_at", type: .scalar(Int.self)),
          GraphQLField("user", type: .object(User.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, isAdmin: Bool? = nil, seenAt: Int? = nil, user: User? = nil) {
          self.init(snapshot: ["__typename": "ChatMembership", "id": id, "is_admin": isAdmin, "seen_at": seenAt, "user": user.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var isAdmin: Bool? {
          get {
            return snapshot["is_admin"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_admin")
          }
        }

        public var seenAt: Int? {
          get {
            return snapshot["seen_at"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "seen_at")
          }
        }

        public var user: User? {
          get {
            return (snapshot["user"] as! Snapshot?).flatMap { User(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "user")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var chatMembershipDetails: ChatMembershipDetails {
            get {
              return ChatMembershipDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .scalar(String.self)),
            GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
            GraphQLField("photo", type: .object(Photo.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var email: String {
            get {
              return snapshot["email"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "email")
            }
          }

          public var phone: String? {
            get {
              return snapshot["phone"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone")
            }
          }

          public var userType: String {
            get {
              return snapshot["user_type"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_type")
            }
          }

          public var photo: Photo? {
            get {
              return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "photo")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var userDetails: UserDetails {
              get {
                return UserDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Photo: GraphQLSelectionSet {
            public static let possibleTypes = ["Attachment"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("mime", type: .scalar(String.self)),
              GraphQLField("ext", type: .scalar(String.self)),
              GraphQLField("url", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("routes", type: .list(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
              self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mime: String? {
              get {
                return snapshot["mime"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "mime")
              }
            }

            public var ext: String? {
              get {
                return snapshot["ext"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "ext")
              }
            }

            public var url: String? {
              get {
                return snapshot["url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }

            public var name: String? {
              get {
                return snapshot["name"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var routes: [String?]? {
              get {
                return snapshot["routes"] as? [String?]
              }
              set {
                snapshot.updateValue(newValue, forKey: "routes")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var attachmentDetails: AttachmentDetails {
                get {
                  return AttachmentDetails(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class AddMemberToChatMutation: GraphQLMutation {
  public static let operationString =
    "mutation AddMemberToChat($chat: ID!, $user: ID!, $admin: Boolean) {\n  addChatMember(chat: $chat, user: $user, admin: $admin) {\n    __typename\n    ...ChatMembershipDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(ChatMembershipDetails.fragmentString).appending(UserDetails.fragmentString).appending(AttachmentDetails.fragmentString) }

  public var chat: GraphQLID
  public var user: GraphQLID
  public var admin: Bool?

  public init(chat: GraphQLID, user: GraphQLID, admin: Bool? = nil) {
    self.chat = chat
    self.user = user
    self.admin = admin
  }

  public var variables: GraphQLMap? {
    return ["chat": chat, "user": user, "admin": admin]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addChatMember", arguments: ["chat": GraphQLVariable("chat"), "user": GraphQLVariable("user"), "admin": GraphQLVariable("admin")], type: .nonNull(.object(AddChatMember.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(addChatMember: AddChatMember) {
      self.init(snapshot: ["__typename": "Mutation", "addChatMember": addChatMember.snapshot])
    }

    public var addChatMember: AddChatMember {
      get {
        return AddChatMember(snapshot: snapshot["addChatMember"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "addChatMember")
      }
    }

    public struct AddChatMember: GraphQLSelectionSet {
      public static let possibleTypes = ["ChatMembership"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("is_admin", type: .scalar(Bool.self)),
        GraphQLField("seen_at", type: .scalar(Int.self)),
        GraphQLField("user", type: .object(User.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID? = nil, isAdmin: Bool? = nil, seenAt: Int? = nil, user: User? = nil) {
        self.init(snapshot: ["__typename": "ChatMembership", "id": id, "is_admin": isAdmin, "seen_at": seenAt, "user": user.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return snapshot["id"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var isAdmin: Bool? {
        get {
          return snapshot["is_admin"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "is_admin")
        }
      }

      public var seenAt: Int? {
        get {
          return snapshot["seen_at"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "seen_at")
        }
      }

      public var user: User? {
        get {
          return (snapshot["user"] as! Snapshot?).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "user")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var chatMembershipDetails: ChatMembershipDetails {
          get {
            return ChatMembershipDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class SendMessageMutation: GraphQLMutation {
  public static let operationString =
    "mutation SendMessage($chat: ID!, $messageId: ID!, $text: String!) {\n  createChatMessage(chat: $chat, messageId: $messageId, text: $text) {\n    __typename\n    ...ChatMessageDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(ChatMessageDetails.fragmentString).appending(UserDetails.fragmentString).appending(AttachmentDetails.fragmentString) }

  public var chat: GraphQLID
  public var messageId: GraphQLID
  public var text: String

  public init(chat: GraphQLID, messageId: GraphQLID, text: String) {
    self.chat = chat
    self.messageId = messageId
    self.text = text
  }

  public var variables: GraphQLMap? {
    return ["chat": chat, "messageId": messageId, "text": text]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createChatMessage", arguments: ["chat": GraphQLVariable("chat"), "messageId": GraphQLVariable("messageId"), "text": GraphQLVariable("text")], type: .object(CreateChatMessage.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createChatMessage: CreateChatMessage? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createChatMessage": createChatMessage.flatMap { $0.snapshot }])
    }

    public var createChatMessage: CreateChatMessage? {
      get {
        return (snapshot["createChatMessage"] as! Snapshot?).flatMap { CreateChatMessage(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createChatMessage")
      }
    }

    public struct CreateChatMessage: GraphQLSelectionSet {
      public static let possibleTypes = ["ChatMessage"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("sender", type: .object(Sender.selections)),
        GraphQLField("sent_at", type: .scalar(Int.self)),
        GraphQLField("text", type: .scalar(String.self)),
        GraphQLField("attachment", type: .object(Attachment.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, sender: Sender? = nil, sentAt: Int? = nil, text: String? = nil, attachment: Attachment? = nil) {
        self.init(snapshot: ["__typename": "ChatMessage", "id": id, "sender": sender.flatMap { $0.snapshot }, "sent_at": sentAt, "text": text, "attachment": attachment.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var sender: Sender? {
        get {
          return (snapshot["sender"] as! Snapshot?).flatMap { Sender(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "sender")
        }
      }

      public var sentAt: Int? {
        get {
          return snapshot["sent_at"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "sent_at")
        }
      }

      public var text: String? {
        get {
          return snapshot["text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var attachment: Attachment? {
        get {
          return (snapshot["attachment"] as! Snapshot?).flatMap { Attachment(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "attachment")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var chatMessageDetails: ChatMessageDetails {
          get {
            return ChatMessageDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Sender: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Attachment: GraphQLSelectionSet {
        public static let possibleTypes = ["Attachment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mime", type: .scalar(String.self)),
          GraphQLField("ext", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("routes", type: .list(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
          self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var mime: String? {
          get {
            return snapshot["mime"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mime")
          }
        }

        public var ext: String? {
          get {
            return snapshot["ext"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ext")
          }
        }

        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var routes: [String?]? {
          get {
            return snapshot["routes"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "routes")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var attachmentDetails: AttachmentDetails {
            get {
              return AttachmentDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class SetChatSeenMutation: GraphQLMutation {
  public static let operationString =
    "mutation SetChatSeen($chat: ID!) {\n  setChatSeen(chat: $chat) {\n    __typename\n    ...ChatMembershipDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(ChatMembershipDetails.fragmentString).appending(UserDetails.fragmentString).appending(AttachmentDetails.fragmentString) }

  public var chat: GraphQLID

  public init(chat: GraphQLID) {
    self.chat = chat
  }

  public var variables: GraphQLMap? {
    return ["chat": chat]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("setChatSeen", arguments: ["chat": GraphQLVariable("chat")], type: .object(SetChatSeen.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(setChatSeen: SetChatSeen? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "setChatSeen": setChatSeen.flatMap { $0.snapshot }])
    }

    public var setChatSeen: SetChatSeen? {
      get {
        return (snapshot["setChatSeen"] as! Snapshot?).flatMap { SetChatSeen(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "setChatSeen")
      }
    }

    public struct SetChatSeen: GraphQLSelectionSet {
      public static let possibleTypes = ["ChatMembership"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("is_admin", type: .scalar(Bool.self)),
        GraphQLField("seen_at", type: .scalar(Int.self)),
        GraphQLField("user", type: .object(User.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID? = nil, isAdmin: Bool? = nil, seenAt: Int? = nil, user: User? = nil) {
        self.init(snapshot: ["__typename": "ChatMembership", "id": id, "is_admin": isAdmin, "seen_at": seenAt, "user": user.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return snapshot["id"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var isAdmin: Bool? {
        get {
          return snapshot["is_admin"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "is_admin")
        }
      }

      public var seenAt: Int? {
        get {
          return snapshot["seen_at"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "seen_at")
        }
      }

      public var user: User? {
        get {
          return (snapshot["user"] as! Snapshot?).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "user")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var chatMembershipDetails: ChatMembershipDetails {
          get {
            return ChatMembershipDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class MyChatsQuery: GraphQLQuery {
  public static let operationString =
    "query MyChats {\n  myChats {\n    __typename\n    ...ChatDetails\n    members {\n      __typename\n      ...ChatMembershipDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(ChatDetails.fragmentString).appending(FamilyDetails.fragmentString).appending(AttachmentDetails.fragmentString).appending(ChatMessageDetails.fragmentString).appending(UserDetails.fragmentString).appending(ChatMembershipDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("myChats", type: .nonNull(.list(.object(MyChat.selections)))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(myChats: [MyChat?]) {
      self.init(snapshot: ["__typename": "Query", "myChats": myChats.map { $0.flatMap { $0.snapshot } }])
    }

    public var myChats: [MyChat?] {
      get {
        return (snapshot["myChats"] as! [Snapshot?]).map { $0.flatMap { MyChat(snapshot: $0) } }
      }
      set {
        snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "myChats")
      }
    }

    public struct MyChat: GraphQLSelectionSet {
      public static let possibleTypes = ["Chat"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("family", type: .object(Family.selections)),
        GraphQLField("group", type: .object(Group.selections)),
        GraphQLField("last_message", type: .object(LastMessage.selections)),
        GraphQLField("members", type: .nonNull(.list(.object(Member.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, family: Family? = nil, group: Group? = nil, lastMessage: LastMessage? = nil, members: [Member?]) {
        self.init(snapshot: ["__typename": "Chat", "id": id, "family": family.flatMap { $0.snapshot }, "group": group.flatMap { $0.snapshot }, "last_message": lastMessage.flatMap { $0.snapshot }, "members": members.map { $0.flatMap { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var family: Family? {
        get {
          return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "family")
        }
      }

      public var group: Group? {
        get {
          return (snapshot["group"] as! Snapshot?).flatMap { Group(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "group")
        }
      }

      public var lastMessage: LastMessage? {
        get {
          return (snapshot["last_message"] as! Snapshot?).flatMap { LastMessage(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "last_message")
        }
      }

      public var members: [Member?] {
        get {
          return (snapshot["members"] as! [Snapshot?]).map { $0.flatMap { Member(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "members")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var chatDetails: ChatDetails {
          get {
            return ChatDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Family: GraphQLSelectionSet {
        public static let possibleTypes = ["Family"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var familyDetails: FamilyDetails {
            get {
              return FamilyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Group: GraphQLSelectionSet {
        public static let possibleTypes = ["ChatGroup"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "ChatGroup", "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct LastMessage: GraphQLSelectionSet {
        public static let possibleTypes = ["ChatMessage"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sender", type: .object(Sender.selections)),
          GraphQLField("sent_at", type: .scalar(Int.self)),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("attachment", type: .object(Attachment.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, sender: Sender? = nil, sentAt: Int? = nil, text: String? = nil, attachment: Attachment? = nil) {
          self.init(snapshot: ["__typename": "ChatMessage", "id": id, "sender": sender.flatMap { $0.snapshot }, "sent_at": sentAt, "text": text, "attachment": attachment.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var sender: Sender? {
          get {
            return (snapshot["sender"] as! Snapshot?).flatMap { Sender(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "sender")
          }
        }

        public var sentAt: Int? {
          get {
            return snapshot["sent_at"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "sent_at")
          }
        }

        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        public var attachment: Attachment? {
          get {
            return (snapshot["attachment"] as! Snapshot?).flatMap { Attachment(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "attachment")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var chatMessageDetails: ChatMessageDetails {
            get {
              return ChatMessageDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Sender: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .scalar(String.self)),
            GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
            GraphQLField("photo", type: .object(Photo.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var email: String {
            get {
              return snapshot["email"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "email")
            }
          }

          public var phone: String? {
            get {
              return snapshot["phone"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone")
            }
          }

          public var userType: String {
            get {
              return snapshot["user_type"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_type")
            }
          }

          public var photo: Photo? {
            get {
              return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "photo")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var userDetails: UserDetails {
              get {
                return UserDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Photo: GraphQLSelectionSet {
            public static let possibleTypes = ["Attachment"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("mime", type: .scalar(String.self)),
              GraphQLField("ext", type: .scalar(String.self)),
              GraphQLField("url", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("routes", type: .list(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
              self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mime: String? {
              get {
                return snapshot["mime"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "mime")
              }
            }

            public var ext: String? {
              get {
                return snapshot["ext"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "ext")
              }
            }

            public var url: String? {
              get {
                return snapshot["url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }

            public var name: String? {
              get {
                return snapshot["name"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var routes: [String?]? {
              get {
                return snapshot["routes"] as? [String?]
              }
              set {
                snapshot.updateValue(newValue, forKey: "routes")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var attachmentDetails: AttachmentDetails {
                get {
                  return AttachmentDetails(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }

        public struct Attachment: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes = ["ChatMembership"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("is_admin", type: .scalar(Bool.self)),
          GraphQLField("seen_at", type: .scalar(Int.self)),
          GraphQLField("user", type: .object(User.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, isAdmin: Bool? = nil, seenAt: Int? = nil, user: User? = nil) {
          self.init(snapshot: ["__typename": "ChatMembership", "id": id, "is_admin": isAdmin, "seen_at": seenAt, "user": user.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var isAdmin: Bool? {
          get {
            return snapshot["is_admin"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_admin")
          }
        }

        public var seenAt: Int? {
          get {
            return snapshot["seen_at"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "seen_at")
          }
        }

        public var user: User? {
          get {
            return (snapshot["user"] as! Snapshot?).flatMap { User(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "user")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var chatMembershipDetails: ChatMembershipDetails {
            get {
              return ChatMembershipDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .scalar(String.self)),
            GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
            GraphQLField("photo", type: .object(Photo.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var email: String {
            get {
              return snapshot["email"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "email")
            }
          }

          public var phone: String? {
            get {
              return snapshot["phone"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone")
            }
          }

          public var userType: String {
            get {
              return snapshot["user_type"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_type")
            }
          }

          public var photo: Photo? {
            get {
              return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "photo")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var userDetails: UserDetails {
              get {
                return UserDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Photo: GraphQLSelectionSet {
            public static let possibleTypes = ["Attachment"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("mime", type: .scalar(String.self)),
              GraphQLField("ext", type: .scalar(String.self)),
              GraphQLField("url", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("routes", type: .list(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
              self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mime: String? {
              get {
                return snapshot["mime"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "mime")
              }
            }

            public var ext: String? {
              get {
                return snapshot["ext"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "ext")
              }
            }

            public var url: String? {
              get {
                return snapshot["url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }

            public var name: String? {
              get {
                return snapshot["name"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var routes: [String?]? {
              get {
                return snapshot["routes"] as? [String?]
              }
              set {
                snapshot.updateValue(newValue, forKey: "routes")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var attachmentDetails: AttachmentDetails {
                get {
                  return AttachmentDetails(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class CreateFamilyMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateFamily($name: String!) {\n  createFamily(name: $name) {\n    __typename\n    ...FamilyDetails\n    members {\n      __typename\n      user {\n        __typename\n        ...UserDetails\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(FamilyDetails.fragmentString).appending(AttachmentDetails.fragmentString).appending(UserDetails.fragmentString) }

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createFamily", arguments: ["name": GraphQLVariable("name")], type: .object(CreateFamily.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createFamily: CreateFamily? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createFamily": createFamily.flatMap { $0.snapshot }])
    }

    public var createFamily: CreateFamily? {
      get {
        return (snapshot["createFamily"] as! Snapshot?).flatMap { CreateFamily(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createFamily")
      }
    }

    public struct CreateFamily: GraphQLSelectionSet {
      public static let possibleTypes = ["Family"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("photo", type: .object(Photo.selections)),
        GraphQLField("members", type: .nonNull(.list(.object(Member.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil, members: [Member?]) {
        self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }, "members": members.map { $0.flatMap { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var photo: Photo? {
        get {
          return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "photo")
        }
      }

      public var members: [Member?] {
        get {
          return (snapshot["members"] as! [Snapshot?]).map { $0.flatMap { Member(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "members")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var familyDetails: FamilyDetails {
          get {
            return FamilyDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Photo: GraphQLSelectionSet {
        public static let possibleTypes = ["Attachment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mime", type: .scalar(String.self)),
          GraphQLField("ext", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("routes", type: .list(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
          self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var mime: String? {
          get {
            return snapshot["mime"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mime")
          }
        }

        public var ext: String? {
          get {
            return snapshot["ext"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ext")
          }
        }

        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var routes: [String?]? {
          get {
            return snapshot["routes"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "routes")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var attachmentDetails: AttachmentDetails {
            get {
              return AttachmentDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes = ["FamilyMembership"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(user: User) {
          self.init(snapshot: ["__typename": "FamilyMembership", "user": user.snapshot])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var user: User {
          get {
            return User(snapshot: snapshot["user"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "user")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .scalar(String.self)),
            GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
            GraphQLField("photo", type: .object(Photo.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var email: String {
            get {
              return snapshot["email"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "email")
            }
          }

          public var phone: String? {
            get {
              return snapshot["phone"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone")
            }
          }

          public var userType: String {
            get {
              return snapshot["user_type"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_type")
            }
          }

          public var photo: Photo? {
            get {
              return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "photo")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var userDetails: UserDetails {
              get {
                return UserDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Photo: GraphQLSelectionSet {
            public static let possibleTypes = ["Attachment"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("mime", type: .scalar(String.self)),
              GraphQLField("ext", type: .scalar(String.self)),
              GraphQLField("url", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("routes", type: .list(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
              self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mime: String? {
              get {
                return snapshot["mime"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "mime")
              }
            }

            public var ext: String? {
              get {
                return snapshot["ext"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "ext")
              }
            }

            public var url: String? {
              get {
                return snapshot["url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }

            public var name: String? {
              get {
                return snapshot["name"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var routes: [String?]? {
              get {
                return snapshot["routes"] as? [String?]
              }
              set {
                snapshot.updateValue(newValue, forKey: "routes")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var attachmentDetails: AttachmentDetails {
                get {
                  return AttachmentDetails(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class MyFamiliesQuery: GraphQLQuery {
  public static let operationString =
    "query MyFamilies {\n  myFamilies {\n    __typename\n    ...FamilyDetails\n    members {\n      __typename\n      ...FamilyMembershipDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(FamilyDetails.fragmentString).appending(AttachmentDetails.fragmentString).appending(FamilyMembershipDetails.fragmentString).appending(UserDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("myFamilies", type: .nonNull(.list(.object(MyFamily.selections)))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(myFamilies: [MyFamily?]) {
      self.init(snapshot: ["__typename": "Query", "myFamilies": myFamilies.map { $0.flatMap { $0.snapshot } }])
    }

    public var myFamilies: [MyFamily?] {
      get {
        return (snapshot["myFamilies"] as! [Snapshot?]).map { $0.flatMap { MyFamily(snapshot: $0) } }
      }
      set {
        snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "myFamilies")
      }
    }

    public struct MyFamily: GraphQLSelectionSet {
      public static let possibleTypes = ["Family"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("photo", type: .object(Photo.selections)),
        GraphQLField("members", type: .nonNull(.list(.object(Member.selections)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil, members: [Member?]) {
        self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }, "members": members.map { $0.flatMap { $0.snapshot } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var photo: Photo? {
        get {
          return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "photo")
        }
      }

      public var members: [Member?] {
        get {
          return (snapshot["members"] as! [Snapshot?]).map { $0.flatMap { Member(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "members")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var familyDetails: FamilyDetails {
          get {
            return FamilyDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Photo: GraphQLSelectionSet {
        public static let possibleTypes = ["Attachment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mime", type: .scalar(String.self)),
          GraphQLField("ext", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("routes", type: .list(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
          self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var mime: String? {
          get {
            return snapshot["mime"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mime")
          }
        }

        public var ext: String? {
          get {
            return snapshot["ext"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ext")
          }
        }

        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var routes: [String?]? {
          get {
            return snapshot["routes"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "routes")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var attachmentDetails: AttachmentDetails {
            get {
              return AttachmentDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes = ["FamilyMembership"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("added_at", type: .nonNull(.scalar(Int.self))),
          GraphQLField("is_admin", type: .scalar(Bool.self)),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
          GraphQLField("family", type: .nonNull(.object(Family.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, addedAt: Int, isAdmin: Bool? = nil, user: User, family: Family) {
          self.init(snapshot: ["__typename": "FamilyMembership", "id": id, "added_at": addedAt, "is_admin": isAdmin, "user": user.snapshot, "family": family.snapshot])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var addedAt: Int {
          get {
            return snapshot["added_at"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "added_at")
          }
        }

        public var isAdmin: Bool? {
          get {
            return snapshot["is_admin"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "is_admin")
          }
        }

        public var user: User {
          get {
            return User(snapshot: snapshot["user"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "user")
          }
        }

        public var family: Family {
          get {
            return Family(snapshot: snapshot["family"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "family")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var familyMembershipDetails: FamilyMembershipDetails {
            get {
              return FamilyMembershipDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .scalar(String.self)),
            GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
            GraphQLField("photo", type: .object(Photo.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var email: String {
            get {
              return snapshot["email"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "email")
            }
          }

          public var phone: String? {
            get {
              return snapshot["phone"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone")
            }
          }

          public var userType: String {
            get {
              return snapshot["user_type"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user_type")
            }
          }

          public var photo: Photo? {
            get {
              return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "photo")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var userDetails: UserDetails {
              get {
                return UserDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Photo: GraphQLSelectionSet {
            public static let possibleTypes = ["Attachment"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("mime", type: .scalar(String.self)),
              GraphQLField("ext", type: .scalar(String.self)),
              GraphQLField("url", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("routes", type: .list(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
              self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mime: String? {
              get {
                return snapshot["mime"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "mime")
              }
            }

            public var ext: String? {
              get {
                return snapshot["ext"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "ext")
              }
            }

            public var url: String? {
              get {
                return snapshot["url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }

            public var name: String? {
              get {
                return snapshot["name"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var routes: [String?]? {
              get {
                return snapshot["routes"] as? [String?]
              }
              set {
                snapshot.updateValue(newValue, forKey: "routes")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var attachmentDetails: AttachmentDetails {
                get {
                  return AttachmentDetails(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }

        public struct Family: GraphQLSelectionSet {
          public static let possibleTypes = ["Family"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("photo", type: .object(Photo.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
            self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var photo: Photo? {
            get {
              return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "photo")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var familyDetails: FamilyDetails {
              get {
                return FamilyDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public struct Photo: GraphQLSelectionSet {
            public static let possibleTypes = ["Attachment"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("mime", type: .scalar(String.self)),
              GraphQLField("ext", type: .scalar(String.self)),
              GraphQLField("url", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("routes", type: .list(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
              self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mime: String? {
              get {
                return snapshot["mime"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "mime")
              }
            }

            public var ext: String? {
              get {
                return snapshot["ext"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "ext")
              }
            }

            public var url: String? {
              get {
                return snapshot["url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }

            public var name: String? {
              get {
                return snapshot["name"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var routes: [String?]? {
              get {
                return snapshot["routes"] as? [String?]
              }
              set {
                snapshot.updateValue(newValue, forKey: "routes")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var attachmentDetails: AttachmentDetails {
                get {
                  return AttachmentDetails(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class CreateIllnessMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateIllness($name: String!, $description: String!, $medicines: String!, $type: Int!, $user: ID, $family: ID) {\n  createIllness(name: $name, description: $description, medicines: $medicines, type: $type, user: $user, family: $family) {\n    __typename\n    ...IllnessDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(IllnessDetails.fragmentString).appending(FamilyDetails.fragmentString).appending(AttachmentDetails.fragmentString).appending(UserDetails.fragmentString) }

  public var name: String
  public var description: String
  public var medicines: String
  public var type: Int
  public var user: GraphQLID?
  public var family: GraphQLID?

  public init(name: String, description: String, medicines: String, type: Int, user: GraphQLID? = nil, family: GraphQLID? = nil) {
    self.name = name
    self.description = description
    self.medicines = medicines
    self.type = type
    self.user = user
    self.family = family
  }

  public var variables: GraphQLMap? {
    return ["name": name, "description": description, "medicines": medicines, "type": type, "user": user, "family": family]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createIllness", arguments: ["name": GraphQLVariable("name"), "description": GraphQLVariable("description"), "medicines": GraphQLVariable("medicines"), "type": GraphQLVariable("type"), "user": GraphQLVariable("user"), "family": GraphQLVariable("family")], type: .object(CreateIllness.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createIllness: CreateIllness? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createIllness": createIllness.flatMap { $0.snapshot }])
    }

    public var createIllness: CreateIllness? {
      get {
        return (snapshot["createIllness"] as! Snapshot?).flatMap { CreateIllness(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createIllness")
      }
    }

    public struct CreateIllness: GraphQLSelectionSet {
      public static let possibleTypes = ["Illness"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("medicines", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(Int.self)),
        GraphQLField("family", type: .object(Family.selections)),
        GraphQLField("creator", type: .object(Creator.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, description: String? = nil, medicines: String? = nil, type: Int? = nil, family: Family? = nil, creator: Creator? = nil) {
        self.init(snapshot: ["__typename": "Illness", "id": id, "name": name, "description": description, "medicines": medicines, "type": type, "family": family.flatMap { $0.snapshot }, "creator": creator.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var medicines: String? {
        get {
          return snapshot["medicines"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "medicines")
        }
      }

      public var type: Int? {
        get {
          return snapshot["type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var family: Family? {
        get {
          return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "family")
        }
      }

      public var creator: Creator? {
        get {
          return (snapshot["creator"] as! Snapshot?).flatMap { Creator(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "creator")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var illnessDetails: IllnessDetails {
          get {
            return IllnessDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Family: GraphQLSelectionSet {
        public static let possibleTypes = ["Family"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var familyDetails: FamilyDetails {
            get {
              return FamilyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class EditIllnessMutation: GraphQLMutation {
  public static let operationString =
    "mutation EditIllness($id: ID!, $name: String, $description: String, $medicines: String, $type: Int) {\n  editIllness(id: $id, name: $name, description: $description, medicines: $medicines, type: $type) {\n    __typename\n    ...IllnessDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(IllnessDetails.fragmentString).appending(FamilyDetails.fragmentString).appending(AttachmentDetails.fragmentString).appending(UserDetails.fragmentString) }

  public var id: GraphQLID
  public var name: String?
  public var description: String?
  public var medicines: String?
  public var type: Int?

  public init(id: GraphQLID, name: String? = nil, description: String? = nil, medicines: String? = nil, type: Int? = nil) {
    self.id = id
    self.name = name
    self.description = description
    self.medicines = medicines
    self.type = type
  }

  public var variables: GraphQLMap? {
    return ["id": id, "name": name, "description": description, "medicines": medicines, "type": type]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("editIllness", arguments: ["id": GraphQLVariable("id"), "name": GraphQLVariable("name"), "description": GraphQLVariable("description"), "medicines": GraphQLVariable("medicines"), "type": GraphQLVariable("type")], type: .object(EditIllness.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(editIllness: EditIllness? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "editIllness": editIllness.flatMap { $0.snapshot }])
    }

    public var editIllness: EditIllness? {
      get {
        return (snapshot["editIllness"] as! Snapshot?).flatMap { EditIllness(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "editIllness")
      }
    }

    public struct EditIllness: GraphQLSelectionSet {
      public static let possibleTypes = ["Illness"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("medicines", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(Int.self)),
        GraphQLField("family", type: .object(Family.selections)),
        GraphQLField("creator", type: .object(Creator.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, description: String? = nil, medicines: String? = nil, type: Int? = nil, family: Family? = nil, creator: Creator? = nil) {
        self.init(snapshot: ["__typename": "Illness", "id": id, "name": name, "description": description, "medicines": medicines, "type": type, "family": family.flatMap { $0.snapshot }, "creator": creator.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var medicines: String? {
        get {
          return snapshot["medicines"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "medicines")
        }
      }

      public var type: Int? {
        get {
          return snapshot["type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var family: Family? {
        get {
          return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "family")
        }
      }

      public var creator: Creator? {
        get {
          return (snapshot["creator"] as! Snapshot?).flatMap { Creator(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "creator")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var illnessDetails: IllnessDetails {
          get {
            return IllnessDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Family: GraphQLSelectionSet {
        public static let possibleTypes = ["Family"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var familyDetails: FamilyDetails {
            get {
              return FamilyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class DeleteIllnessMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteIllness($id: ID!) {\n  deleteIllness(id: $id) {\n    __typename\n    ...IllnessDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(IllnessDetails.fragmentString).appending(FamilyDetails.fragmentString).appending(AttachmentDetails.fragmentString).appending(UserDetails.fragmentString) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteIllness", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteIllness.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteIllness: DeleteIllness? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteIllness": deleteIllness.flatMap { $0.snapshot }])
    }

    public var deleteIllness: DeleteIllness? {
      get {
        return (snapshot["deleteIllness"] as! Snapshot?).flatMap { DeleteIllness(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteIllness")
      }
    }

    public struct DeleteIllness: GraphQLSelectionSet {
      public static let possibleTypes = ["Illness"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("medicines", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(Int.self)),
        GraphQLField("family", type: .object(Family.selections)),
        GraphQLField("creator", type: .object(Creator.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, description: String? = nil, medicines: String? = nil, type: Int? = nil, family: Family? = nil, creator: Creator? = nil) {
        self.init(snapshot: ["__typename": "Illness", "id": id, "name": name, "description": description, "medicines": medicines, "type": type, "family": family.flatMap { $0.snapshot }, "creator": creator.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var medicines: String? {
        get {
          return snapshot["medicines"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "medicines")
        }
      }

      public var type: Int? {
        get {
          return snapshot["type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var family: Family? {
        get {
          return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "family")
        }
      }

      public var creator: Creator? {
        get {
          return (snapshot["creator"] as! Snapshot?).flatMap { Creator(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "creator")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var illnessDetails: IllnessDetails {
          get {
            return IllnessDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Family: GraphQLSelectionSet {
        public static let possibleTypes = ["Family"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var familyDetails: FamilyDetails {
            get {
              return FamilyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class AllIllnessQuery: GraphQLQuery {
  public static let operationString =
    "query AllIllness($fid: ID) {\n  allIllnesses(familyId: $fid) {\n    __typename\n    ...IllnessDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(IllnessDetails.fragmentString).appending(FamilyDetails.fragmentString).appending(AttachmentDetails.fragmentString).appending(UserDetails.fragmentString) }

  public var fid: GraphQLID?

  public init(fid: GraphQLID? = nil) {
    self.fid = fid
  }

  public var variables: GraphQLMap? {
    return ["fid": fid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allIllnesses", arguments: ["familyId": GraphQLVariable("fid")], type: .nonNull(.list(.object(AllIllness.selections)))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(allIllnesses: [AllIllness?]) {
      self.init(snapshot: ["__typename": "Query", "allIllnesses": allIllnesses.map { $0.flatMap { $0.snapshot } }])
    }

    public var allIllnesses: [AllIllness?] {
      get {
        return (snapshot["allIllnesses"] as! [Snapshot?]).map { $0.flatMap { AllIllness(snapshot: $0) } }
      }
      set {
        snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "allIllnesses")
      }
    }

    public struct AllIllness: GraphQLSelectionSet {
      public static let possibleTypes = ["Illness"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("medicines", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(Int.self)),
        GraphQLField("family", type: .object(Family.selections)),
        GraphQLField("creator", type: .object(Creator.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, description: String? = nil, medicines: String? = nil, type: Int? = nil, family: Family? = nil, creator: Creator? = nil) {
        self.init(snapshot: ["__typename": "Illness", "id": id, "name": name, "description": description, "medicines": medicines, "type": type, "family": family.flatMap { $0.snapshot }, "creator": creator.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var medicines: String? {
        get {
          return snapshot["medicines"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "medicines")
        }
      }

      public var type: Int? {
        get {
          return snapshot["type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var family: Family? {
        get {
          return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "family")
        }
      }

      public var creator: Creator? {
        get {
          return (snapshot["creator"] as! Snapshot?).flatMap { Creator(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "creator")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var illnessDetails: IllnessDetails {
          get {
            return IllnessDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Family: GraphQLSelectionSet {
        public static let possibleTypes = ["Family"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var familyDetails: FamilyDetails {
            get {
              return FamilyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class AllInsurancesQuery: GraphQLQuery {
  public static let operationString =
    "query AllInsurances {\n  allInsurances {\n    __typename\n    id\n    name\n    policy\n    telephone\n    type\n    attachment {\n      __typename\n      ...AttachmentDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(AttachmentDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allInsurances", type: .nonNull(.list(.object(AllInsurance.selections)))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(allInsurances: [AllInsurance?]) {
      self.init(snapshot: ["__typename": "Query", "allInsurances": allInsurances.map { $0.flatMap { $0.snapshot } }])
    }

    public var allInsurances: [AllInsurance?] {
      get {
        return (snapshot["allInsurances"] as! [Snapshot?]).map { $0.flatMap { AllInsurance(snapshot: $0) } }
      }
      set {
        snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "allInsurances")
      }
    }

    public struct AllInsurance: GraphQLSelectionSet {
      public static let possibleTypes = ["Insurance"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("policy", type: .scalar(String.self)),
        GraphQLField("telephone", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(Int.self)),
        GraphQLField("attachment", type: .object(Attachment.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, policy: String? = nil, telephone: String? = nil, type: Int? = nil, attachment: Attachment? = nil) {
        self.init(snapshot: ["__typename": "Insurance", "id": id, "name": name, "policy": policy, "telephone": telephone, "type": type, "attachment": attachment.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var policy: String? {
        get {
          return snapshot["policy"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "policy")
        }
      }

      public var telephone: String? {
        get {
          return snapshot["telephone"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "telephone")
        }
      }

      public var type: Int? {
        get {
          return snapshot["type"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var attachment: Attachment? {
        get {
          return (snapshot["attachment"] as! Snapshot?).flatMap { Attachment(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "attachment")
        }
      }

      public struct Attachment: GraphQLSelectionSet {
        public static let possibleTypes = ["Attachment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mime", type: .scalar(String.self)),
          GraphQLField("ext", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("routes", type: .list(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
          self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var mime: String? {
          get {
            return snapshot["mime"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mime")
          }
        }

        public var ext: String? {
          get {
            return snapshot["ext"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ext")
          }
        }

        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var routes: [String?]? {
          get {
            return snapshot["routes"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "routes")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var attachmentDetails: AttachmentDetails {
            get {
              return AttachmentDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class AllPendingQuery: GraphQLQuery {
  public static let operationString =
    "query AllPending {\n  allPendings {\n    __typename\n    ...PendingDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(PendingDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allPendings", type: .list(.object(AllPending.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(allPendings: [AllPending?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "allPendings": allPendings.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var allPendings: [AllPending?]? {
      get {
        return (snapshot["allPendings"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { AllPending(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "allPendings")
      }
    }

    public struct AllPending: GraphQLSelectionSet {
      public static let possibleTypes = ["Pending"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("priority", type: .scalar(String.self)),
        GraphQLField("details", type: .scalar(String.self)),
        GraphQLField("created_at", type: .scalar(Int.self)),
        GraphQLField("updated_at", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String? = nil, priority: String? = nil, details: String? = nil, createdAt: Int? = nil, updatedAt: Int? = nil) {
        self.init(snapshot: ["__typename": "Pending", "id": id, "title": title, "priority": priority, "details": details, "created_at": createdAt, "updated_at": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var priority: String? {
        get {
          return snapshot["priority"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "priority")
        }
      }

      public var details: String? {
        get {
          return snapshot["details"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "details")
        }
      }

      public var createdAt: Int? {
        get {
          return snapshot["created_at"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_at")
        }
      }

      public var updatedAt: Int? {
        get {
          return snapshot["updated_at"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "updated_at")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var pendingDetails: PendingDetails {
          get {
            return PendingDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public final class CreatePendingMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreatePending($title: String!, $priority: String, $details: String) {\n  createPending(title: $title, priority: $priority, details: $details) {\n    __typename\n    ...PendingDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(PendingDetails.fragmentString) }

  public var title: String
  public var priority: String?
  public var details: String?

  public init(title: String, priority: String? = nil, details: String? = nil) {
    self.title = title
    self.priority = priority
    self.details = details
  }

  public var variables: GraphQLMap? {
    return ["title": title, "priority": priority, "details": details]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createPending", arguments: ["title": GraphQLVariable("title"), "priority": GraphQLVariable("priority"), "details": GraphQLVariable("details")], type: .object(CreatePending.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createPending: CreatePending? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createPending": createPending.flatMap { $0.snapshot }])
    }

    public var createPending: CreatePending? {
      get {
        return (snapshot["createPending"] as! Snapshot?).flatMap { CreatePending(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createPending")
      }
    }

    public struct CreatePending: GraphQLSelectionSet {
      public static let possibleTypes = ["Pending"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("priority", type: .scalar(String.self)),
        GraphQLField("details", type: .scalar(String.self)),
        GraphQLField("created_at", type: .scalar(Int.self)),
        GraphQLField("updated_at", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String? = nil, priority: String? = nil, details: String? = nil, createdAt: Int? = nil, updatedAt: Int? = nil) {
        self.init(snapshot: ["__typename": "Pending", "id": id, "title": title, "priority": priority, "details": details, "created_at": createdAt, "updated_at": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var priority: String? {
        get {
          return snapshot["priority"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "priority")
        }
      }

      public var details: String? {
        get {
          return snapshot["details"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "details")
        }
      }

      public var createdAt: Int? {
        get {
          return snapshot["created_at"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "created_at")
        }
      }

      public var updatedAt: Int? {
        get {
          return snapshot["updated_at"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "updated_at")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var pendingDetails: PendingDetails {
          get {
            return PendingDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public final class FamilyApplicationMutation: GraphQLMutation {
  public static let operationString =
    "mutation FamilyApplication($userId: ID!, $familyId: ID!) {\n  createFamilyApplication(family: $familyId, user: $userId) {\n    __typename\n    ...SolicitudeFDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(SolicitudeFDetails.fragmentString).appending(FamilyDetails.fragmentString).appending(AttachmentDetails.fragmentString).appending(UserDetails.fragmentString) }

  public var userId: GraphQLID
  public var familyId: GraphQLID

  public init(userId: GraphQLID, familyId: GraphQLID) {
    self.userId = userId
    self.familyId = familyId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "familyId": familyId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createFamilyApplication", arguments: ["family": GraphQLVariable("familyId"), "user": GraphQLVariable("userId")], type: .object(CreateFamilyApplication.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createFamilyApplication: CreateFamilyApplication? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createFamilyApplication": createFamilyApplication.flatMap { $0.snapshot }])
    }

    public var createFamilyApplication: CreateFamilyApplication? {
      get {
        return (snapshot["createFamilyApplication"] as! Snapshot?).flatMap { CreateFamilyApplication(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createFamilyApplication")
      }
    }

    public struct CreateFamilyApplication: GraphQLSelectionSet {
      public static let possibleTypes = ["FamilyApplication"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("family", type: .object(Family.selections)),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("status", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, family: Family? = nil, user: User? = nil, status: String? = nil) {
        self.init(snapshot: ["__typename": "FamilyApplication", "id": id, "family": family.flatMap { $0.snapshot }, "user": user.flatMap { $0.snapshot }, "status": status])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var family: Family? {
        get {
          return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "family")
        }
      }

      public var user: User? {
        get {
          return (snapshot["user"] as! Snapshot?).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "user")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var solicitudeFDetails: SolicitudeFDetails {
          get {
            return SolicitudeFDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Family: GraphQLSelectionSet {
        public static let possibleTypes = ["Family"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var familyDetails: FamilyDetails {
            get {
              return FamilyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class AcceptFamilyApplicationMutation: GraphQLMutation {
  public static let operationString =
    "mutation AcceptFamilyApplication($id: ID!) {\n  approveFamilyApplication(familyApplicationId: $id) {\n    __typename\n    ...SolicitudeFDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(SolicitudeFDetails.fragmentString).appending(FamilyDetails.fragmentString).appending(AttachmentDetails.fragmentString).appending(UserDetails.fragmentString) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("approveFamilyApplication", arguments: ["familyApplicationId": GraphQLVariable("id")], type: .object(ApproveFamilyApplication.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(approveFamilyApplication: ApproveFamilyApplication? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "approveFamilyApplication": approveFamilyApplication.flatMap { $0.snapshot }])
    }

    public var approveFamilyApplication: ApproveFamilyApplication? {
      get {
        return (snapshot["approveFamilyApplication"] as! Snapshot?).flatMap { ApproveFamilyApplication(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "approveFamilyApplication")
      }
    }

    public struct ApproveFamilyApplication: GraphQLSelectionSet {
      public static let possibleTypes = ["FamilyApplication"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("family", type: .object(Family.selections)),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("status", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, family: Family? = nil, user: User? = nil, status: String? = nil) {
        self.init(snapshot: ["__typename": "FamilyApplication", "id": id, "family": family.flatMap { $0.snapshot }, "user": user.flatMap { $0.snapshot }, "status": status])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var family: Family? {
        get {
          return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "family")
        }
      }

      public var user: User? {
        get {
          return (snapshot["user"] as! Snapshot?).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "user")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var solicitudeFDetails: SolicitudeFDetails {
          get {
            return SolicitudeFDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Family: GraphQLSelectionSet {
        public static let possibleTypes = ["Family"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var familyDetails: FamilyDetails {
            get {
              return FamilyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class FamilyApplicationsQuery: GraphQLQuery {
  public static let operationString =
    "query FamilyApplications {\n  allFamilyApplications {\n    __typename\n    ...SolicitudeFDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(SolicitudeFDetails.fragmentString).appending(FamilyDetails.fragmentString).appending(AttachmentDetails.fragmentString).appending(UserDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allFamilyApplications", type: .nonNull(.list(.object(AllFamilyApplication.selections)))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(allFamilyApplications: [AllFamilyApplication?]) {
      self.init(snapshot: ["__typename": "Query", "allFamilyApplications": allFamilyApplications.map { $0.flatMap { $0.snapshot } }])
    }

    public var allFamilyApplications: [AllFamilyApplication?] {
      get {
        return (snapshot["allFamilyApplications"] as! [Snapshot?]).map { $0.flatMap { AllFamilyApplication(snapshot: $0) } }
      }
      set {
        snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "allFamilyApplications")
      }
    }

    public struct AllFamilyApplication: GraphQLSelectionSet {
      public static let possibleTypes = ["FamilyApplication"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("family", type: .object(Family.selections)),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("status", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, family: Family? = nil, user: User? = nil, status: String? = nil) {
        self.init(snapshot: ["__typename": "FamilyApplication", "id": id, "family": family.flatMap { $0.snapshot }, "user": user.flatMap { $0.snapshot }, "status": status])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var family: Family? {
        get {
          return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "family")
        }
      }

      public var user: User? {
        get {
          return (snapshot["user"] as! Snapshot?).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "user")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var solicitudeFDetails: SolicitudeFDetails {
          get {
            return SolicitudeFDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Family: GraphQLSelectionSet {
        public static let possibleTypes = ["Family"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var familyDetails: FamilyDetails {
            get {
              return FamilyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class AllUserQuery: GraphQLQuery {
  public static let operationString =
    "query allUser($phones: [String], $rol: Int) {\n  allUsers(filter: {phone: $phones, user_type: $rol}) {\n    __typename\n    ...UserDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetails.fragmentString).appending(AttachmentDetails.fragmentString) }

  public var phones: [String?]?
  public var rol: Int?

  public init(phones: [String?]? = nil, rol: Int? = nil) {
    self.phones = phones
    self.rol = rol
  }

  public var variables: GraphQLMap? {
    return ["phones": phones, "rol": rol]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allUsers", arguments: ["filter": ["phone": GraphQLVariable("phones"), "user_type": GraphQLVariable("rol")]], type: .list(.object(AllUser.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(allUsers: [AllUser?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "allUsers": allUsers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var allUsers: [AllUser?]? {
      get {
        return (snapshot["allUsers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { AllUser(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "allUsers")
      }
    }

    public struct AllUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("phone", type: .scalar(String.self)),
        GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
        GraphQLField("photo", type: .object(Photo.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var phone: String? {
        get {
          return snapshot["phone"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "phone")
        }
      }

      public var userType: String {
        get {
          return snapshot["user_type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_type")
        }
      }

      public var photo: Photo? {
        get {
          return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "photo")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var userDetails: UserDetails {
          get {
            return UserDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Photo: GraphQLSelectionSet {
        public static let possibleTypes = ["Attachment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mime", type: .scalar(String.self)),
          GraphQLField("ext", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("routes", type: .list(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
          self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var mime: String? {
          get {
            return snapshot["mime"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mime")
          }
        }

        public var ext: String? {
          get {
            return snapshot["ext"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ext")
          }
        }

        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var routes: [String?]? {
          get {
            return snapshot["routes"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "routes")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var attachmentDetails: AttachmentDetails {
            get {
              return AttachmentDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class EditUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation EditUser($file: Upload) {\n  editUser(photo: $file) {\n    __typename\n    ...UserDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetails.fragmentString).appending(AttachmentDetails.fragmentString) }

  public var file: String?

  public init(file: String? = nil) {
    self.file = file
  }

  public var variables: GraphQLMap? {
    return ["file": file]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("editUser", arguments: ["photo": GraphQLVariable("file")], type: .object(EditUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(editUser: EditUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "editUser": editUser.flatMap { $0.snapshot }])
    }

    public var editUser: EditUser? {
      get {
        return (snapshot["editUser"] as! Snapshot?).flatMap { EditUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "editUser")
      }
    }

    public struct EditUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("phone", type: .scalar(String.self)),
        GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
        GraphQLField("photo", type: .object(Photo.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var phone: String? {
        get {
          return snapshot["phone"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "phone")
        }
      }

      public var userType: String {
        get {
          return snapshot["user_type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_type")
        }
      }

      public var photo: Photo? {
        get {
          return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "photo")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var userDetails: UserDetails {
          get {
            return UserDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Photo: GraphQLSelectionSet {
        public static let possibleTypes = ["Attachment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mime", type: .scalar(String.self)),
          GraphQLField("ext", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("routes", type: .list(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
          self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var mime: String? {
          get {
            return snapshot["mime"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mime")
          }
        }

        public var ext: String? {
          get {
            return snapshot["ext"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ext")
          }
        }

        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var routes: [String?]? {
          get {
            return snapshot["routes"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "routes")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var attachmentDetails: AttachmentDetails {
            get {
              return AttachmentDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class MyAssistantsQuery: GraphQLQuery {
  public static let operationString =
    "query myAssistants {\n  myAssistants {\n    __typename\n    assistant {\n      __typename\n      ...UserDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetails.fragmentString).appending(AttachmentDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("myAssistants", type: .list(.object(MyAssistant.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(myAssistants: [MyAssistant?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "myAssistants": myAssistants.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var myAssistants: [MyAssistant?]? {
      get {
        return (snapshot["myAssistants"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { MyAssistant(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "myAssistants")
      }
    }

    public struct MyAssistant: GraphQLSelectionSet {
      public static let possibleTypes = ["BossToAssistant"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("assistant", type: .object(Assistant.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(assistant: Assistant? = nil) {
        self.init(snapshot: ["__typename": "BossToAssistant", "assistant": assistant.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var assistant: Assistant? {
        get {
          return (snapshot["assistant"] as! Snapshot?).flatMap { Assistant(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "assistant")
        }
      }

      public struct Assistant: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .object(Photo.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var userType: String {
          get {
            return snapshot["user_type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user_type")
          }
        }

        public var photo: Photo? {
          get {
            return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "photo")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var userDetails: UserDetails {
            get {
              return UserDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Photo: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mime", type: .scalar(String.self)),
            GraphQLField("ext", type: .scalar(String.self)),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("routes", type: .list(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
            self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var mime: String? {
            get {
              return snapshot["mime"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "mime")
            }
          }

          public var ext: String? {
            get {
              return snapshot["ext"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "ext")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var routes: [String?]? {
            get {
              return snapshot["routes"] as? [String?]
            }
            set {
              snapshot.updateValue(newValue, forKey: "routes")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var attachmentDetails: AttachmentDetails {
              get {
                return AttachmentDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class GetUserQuery: GraphQLQuery {
  public static let operationString =
    "query GetUser($id: ID!) {\n  getUser(id: $id) {\n    __typename\n    ...UserDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetails.fragmentString).appending(AttachmentDetails.fragmentString) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUser", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(GetUser.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUser: GetUser) {
      self.init(snapshot: ["__typename": "Query", "getUser": getUser.snapshot])
    }

    public var getUser: GetUser {
      get {
        return GetUser(snapshot: snapshot["getUser"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "getUser")
      }
    }

    public struct GetUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("phone", type: .scalar(String.self)),
        GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
        GraphQLField("photo", type: .object(Photo.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var phone: String? {
        get {
          return snapshot["phone"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "phone")
        }
      }

      public var userType: String {
        get {
          return snapshot["user_type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_type")
        }
      }

      public var photo: Photo? {
        get {
          return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "photo")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var userDetails: UserDetails {
          get {
            return UserDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Photo: GraphQLSelectionSet {
        public static let possibleTypes = ["Attachment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mime", type: .scalar(String.self)),
          GraphQLField("ext", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("routes", type: .list(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
          self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var mime: String? {
          get {
            return snapshot["mime"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mime")
          }
        }

        public var ext: String? {
          get {
            return snapshot["ext"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ext")
          }
        }

        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var routes: [String?]? {
          get {
            return snapshot["routes"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "routes")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var attachmentDetails: AttachmentDetails {
            get {
              return AttachmentDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public struct SolicitudeADetails: GraphQLFragment {
  public static let fragmentString =
    "fragment SolicitudeADetails on Solicitude {\n  __typename\n  id\n  assistant {\n    __typename\n    ...UserDetails\n  }\n  boss {\n    __typename\n    ...UserDetails\n  }\n  status\n}"

  public static let possibleTypes = ["Solicitude"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("assistant", type: .object(Assistant.selections)),
    GraphQLField("boss", type: .object(Boss.selections)),
    GraphQLField("status", type: .scalar(String.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, assistant: Assistant? = nil, boss: Boss? = nil, status: String? = nil) {
    self.init(snapshot: ["__typename": "Solicitude", "id": id, "assistant": assistant.flatMap { $0.snapshot }, "boss": boss.flatMap { $0.snapshot }, "status": status])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var assistant: Assistant? {
    get {
      return (snapshot["assistant"] as! Snapshot?).flatMap { Assistant(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "assistant")
    }
  }

  public var boss: Boss? {
    get {
      return (snapshot["boss"] as! Snapshot?).flatMap { Boss(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "boss")
    }
  }

  public var status: String? {
    get {
      return snapshot["status"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "status")
    }
  }

  public struct Assistant: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("email", type: .nonNull(.scalar(String.self))),
      GraphQLField("phone", type: .scalar(String.self)),
      GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
      GraphQLField("photo", type: .object(Photo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
      self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var email: String {
      get {
        return snapshot["email"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "email")
      }
    }

    public var phone: String? {
      get {
        return snapshot["phone"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "phone")
      }
    }

    public var userType: String {
      get {
        return snapshot["user_type"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "user_type")
      }
    }

    public var photo: Photo? {
      get {
        return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "photo")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var userDetails: UserDetails {
        get {
          return UserDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Photo: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }

  public struct Boss: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("email", type: .nonNull(.scalar(String.self))),
      GraphQLField("phone", type: .scalar(String.self)),
      GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
      GraphQLField("photo", type: .object(Photo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
      self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var email: String {
      get {
        return snapshot["email"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "email")
      }
    }

    public var phone: String? {
      get {
        return snapshot["phone"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "phone")
      }
    }

    public var userType: String {
      get {
        return snapshot["user_type"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "user_type")
      }
    }

    public var photo: Photo? {
      get {
        return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "photo")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var userDetails: UserDetails {
        get {
          return UserDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Photo: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public struct UserDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment UserDetails on User {\n  __typename\n  id\n  name\n  email\n  phone\n  user_type\n  photo {\n    __typename\n    ...AttachmentDetails\n  }\n}"

  public static let possibleTypes = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("email", type: .nonNull(.scalar(String.self))),
    GraphQLField("phone", type: .scalar(String.self)),
    GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
    GraphQLField("photo", type: .object(Photo.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
    self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return snapshot["name"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  public var email: String {
    get {
      return snapshot["email"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "email")
    }
  }

  public var phone: String? {
    get {
      return snapshot["phone"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "phone")
    }
  }

  public var userType: String {
    get {
      return snapshot["user_type"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "user_type")
    }
  }

  public var photo: Photo? {
    get {
      return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "photo")
    }
  }

  public struct Photo: GraphQLSelectionSet {
    public static let possibleTypes = ["Attachment"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("mime", type: .scalar(String.self)),
      GraphQLField("ext", type: .scalar(String.self)),
      GraphQLField("url", type: .scalar(String.self)),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("routes", type: .list(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
      self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var mime: String? {
      get {
        return snapshot["mime"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "mime")
      }
    }

    public var ext: String? {
      get {
        return snapshot["ext"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "ext")
      }
    }

    public var url: String? {
      get {
        return snapshot["url"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "url")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var routes: [String?]? {
      get {
        return snapshot["routes"] as? [String?]
      }
      set {
        snapshot.updateValue(newValue, forKey: "routes")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var attachmentDetails: AttachmentDetails {
        get {
          return AttachmentDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

public struct FamilyMembershipDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment FamilyMembershipDetails on FamilyMembership {\n  __typename\n  id\n  added_at\n  is_admin\n  user {\n    __typename\n    ...UserDetails\n  }\n  family {\n    __typename\n    ...FamilyDetails\n  }\n}"

  public static let possibleTypes = ["FamilyMembership"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .scalar(GraphQLID.self)),
    GraphQLField("added_at", type: .nonNull(.scalar(Int.self))),
    GraphQLField("is_admin", type: .scalar(Bool.self)),
    GraphQLField("user", type: .nonNull(.object(User.selections))),
    GraphQLField("family", type: .nonNull(.object(Family.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID? = nil, addedAt: Int, isAdmin: Bool? = nil, user: User, family: Family) {
    self.init(snapshot: ["__typename": "FamilyMembership", "id": id, "added_at": addedAt, "is_admin": isAdmin, "user": user.snapshot, "family": family.snapshot])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID? {
    get {
      return snapshot["id"] as? GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var addedAt: Int {
    get {
      return snapshot["added_at"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "added_at")
    }
  }

  public var isAdmin: Bool? {
    get {
      return snapshot["is_admin"] as? Bool
    }
    set {
      snapshot.updateValue(newValue, forKey: "is_admin")
    }
  }

  public var user: User {
    get {
      return User(snapshot: snapshot["user"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "user")
    }
  }

  public var family: Family {
    get {
      return Family(snapshot: snapshot["family"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "family")
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("email", type: .nonNull(.scalar(String.self))),
      GraphQLField("phone", type: .scalar(String.self)),
      GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
      GraphQLField("photo", type: .object(Photo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
      self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var email: String {
      get {
        return snapshot["email"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "email")
      }
    }

    public var phone: String? {
      get {
        return snapshot["phone"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "phone")
      }
    }

    public var userType: String {
      get {
        return snapshot["user_type"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "user_type")
      }
    }

    public var photo: Photo? {
      get {
        return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "photo")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var userDetails: UserDetails {
        get {
          return UserDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Photo: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }

  public struct Family: GraphQLSelectionSet {
    public static let possibleTypes = ["Family"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("photo", type: .object(Photo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
      self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var photo: Photo? {
      get {
        return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "photo")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var familyDetails: FamilyDetails {
        get {
          return FamilyDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Photo: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public struct ChatDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment ChatDetails on Chat {\n  __typename\n  id\n  family {\n    __typename\n    ...FamilyDetails\n  }\n  group {\n    __typename\n    name\n    photo {\n      __typename\n      ...AttachmentDetails\n    }\n  }\n  last_message {\n    __typename\n    ...ChatMessageDetails\n  }\n}"

  public static let possibleTypes = ["Chat"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("family", type: .object(Family.selections)),
    GraphQLField("group", type: .object(Group.selections)),
    GraphQLField("last_message", type: .object(LastMessage.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, family: Family? = nil, group: Group? = nil, lastMessage: LastMessage? = nil) {
    self.init(snapshot: ["__typename": "Chat", "id": id, "family": family.flatMap { $0.snapshot }, "group": group.flatMap { $0.snapshot }, "last_message": lastMessage.flatMap { $0.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var family: Family? {
    get {
      return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "family")
    }
  }

  public var group: Group? {
    get {
      return (snapshot["group"] as! Snapshot?).flatMap { Group(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "group")
    }
  }

  public var lastMessage: LastMessage? {
    get {
      return (snapshot["last_message"] as! Snapshot?).flatMap { LastMessage(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "last_message")
    }
  }

  public struct Family: GraphQLSelectionSet {
    public static let possibleTypes = ["Family"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("photo", type: .object(Photo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
      self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var photo: Photo? {
      get {
        return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "photo")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var familyDetails: FamilyDetails {
        get {
          return FamilyDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Photo: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }

  public struct Group: GraphQLSelectionSet {
    public static let possibleTypes = ["ChatGroup"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("photo", type: .object(Photo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(name: String, photo: Photo? = nil) {
      self.init(snapshot: ["__typename": "ChatGroup", "name": name, "photo": photo.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var photo: Photo? {
      get {
        return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "photo")
      }
    }

    public struct Photo: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }

  public struct LastMessage: GraphQLSelectionSet {
    public static let possibleTypes = ["ChatMessage"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("sender", type: .object(Sender.selections)),
      GraphQLField("sent_at", type: .scalar(Int.self)),
      GraphQLField("text", type: .scalar(String.self)),
      GraphQLField("attachment", type: .object(Attachment.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, sender: Sender? = nil, sentAt: Int? = nil, text: String? = nil, attachment: Attachment? = nil) {
      self.init(snapshot: ["__typename": "ChatMessage", "id": id, "sender": sender.flatMap { $0.snapshot }, "sent_at": sentAt, "text": text, "attachment": attachment.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var sender: Sender? {
      get {
        return (snapshot["sender"] as! Snapshot?).flatMap { Sender(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "sender")
      }
    }

    public var sentAt: Int? {
      get {
        return snapshot["sent_at"] as? Int
      }
      set {
        snapshot.updateValue(newValue, forKey: "sent_at")
      }
    }

    public var text: String? {
      get {
        return snapshot["text"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "text")
      }
    }

    public var attachment: Attachment? {
      get {
        return (snapshot["attachment"] as! Snapshot?).flatMap { Attachment(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "attachment")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var chatMessageDetails: ChatMessageDetails {
        get {
          return ChatMessageDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Sender: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("phone", type: .scalar(String.self)),
        GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
        GraphQLField("photo", type: .object(Photo.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var phone: String? {
        get {
          return snapshot["phone"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "phone")
        }
      }

      public var userType: String {
        get {
          return snapshot["user_type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user_type")
        }
      }

      public var photo: Photo? {
        get {
          return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "photo")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var userDetails: UserDetails {
          get {
            return UserDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Photo: GraphQLSelectionSet {
        public static let possibleTypes = ["Attachment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mime", type: .scalar(String.self)),
          GraphQLField("ext", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("routes", type: .list(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
          self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var mime: String? {
          get {
            return snapshot["mime"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "mime")
          }
        }

        public var ext: String? {
          get {
            return snapshot["ext"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ext")
          }
        }

        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var routes: [String?]? {
          get {
            return snapshot["routes"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "routes")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var attachmentDetails: AttachmentDetails {
            get {
              return AttachmentDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }

    public struct Attachment: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public struct ChatMessageDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment ChatMessageDetails on ChatMessage {\n  __typename\n  id\n  sender {\n    __typename\n    ...UserDetails\n  }\n  sent_at\n  text\n  attachment {\n    __typename\n    ...AttachmentDetails\n  }\n}"

  public static let possibleTypes = ["ChatMessage"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("sender", type: .object(Sender.selections)),
    GraphQLField("sent_at", type: .scalar(Int.self)),
    GraphQLField("text", type: .scalar(String.self)),
    GraphQLField("attachment", type: .object(Attachment.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, sender: Sender? = nil, sentAt: Int? = nil, text: String? = nil, attachment: Attachment? = nil) {
    self.init(snapshot: ["__typename": "ChatMessage", "id": id, "sender": sender.flatMap { $0.snapshot }, "sent_at": sentAt, "text": text, "attachment": attachment.flatMap { $0.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var sender: Sender? {
    get {
      return (snapshot["sender"] as! Snapshot?).flatMap { Sender(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "sender")
    }
  }

  public var sentAt: Int? {
    get {
      return snapshot["sent_at"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "sent_at")
    }
  }

  public var text: String? {
    get {
      return snapshot["text"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "text")
    }
  }

  public var attachment: Attachment? {
    get {
      return (snapshot["attachment"] as! Snapshot?).flatMap { Attachment(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "attachment")
    }
  }

  public struct Sender: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("email", type: .nonNull(.scalar(String.self))),
      GraphQLField("phone", type: .scalar(String.self)),
      GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
      GraphQLField("photo", type: .object(Photo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
      self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var email: String {
      get {
        return snapshot["email"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "email")
      }
    }

    public var phone: String? {
      get {
        return snapshot["phone"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "phone")
      }
    }

    public var userType: String {
      get {
        return snapshot["user_type"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "user_type")
      }
    }

    public var photo: Photo? {
      get {
        return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "photo")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var userDetails: UserDetails {
        get {
          return UserDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Photo: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }

  public struct Attachment: GraphQLSelectionSet {
    public static let possibleTypes = ["Attachment"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("mime", type: .scalar(String.self)),
      GraphQLField("ext", type: .scalar(String.self)),
      GraphQLField("url", type: .scalar(String.self)),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("routes", type: .list(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
      self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var mime: String? {
      get {
        return snapshot["mime"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "mime")
      }
    }

    public var ext: String? {
      get {
        return snapshot["ext"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "ext")
      }
    }

    public var url: String? {
      get {
        return snapshot["url"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "url")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var routes: [String?]? {
      get {
        return snapshot["routes"] as? [String?]
      }
      set {
        snapshot.updateValue(newValue, forKey: "routes")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var attachmentDetails: AttachmentDetails {
        get {
          return AttachmentDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

public struct ChatMembershipDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment ChatMembershipDetails on ChatMembership {\n  __typename\n  id\n  is_admin\n  seen_at\n  user {\n    __typename\n    ...UserDetails\n  }\n}"

  public static let possibleTypes = ["ChatMembership"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .scalar(GraphQLID.self)),
    GraphQLField("is_admin", type: .scalar(Bool.self)),
    GraphQLField("seen_at", type: .scalar(Int.self)),
    GraphQLField("user", type: .object(User.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID? = nil, isAdmin: Bool? = nil, seenAt: Int? = nil, user: User? = nil) {
    self.init(snapshot: ["__typename": "ChatMembership", "id": id, "is_admin": isAdmin, "seen_at": seenAt, "user": user.flatMap { $0.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID? {
    get {
      return snapshot["id"] as? GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var isAdmin: Bool? {
    get {
      return snapshot["is_admin"] as? Bool
    }
    set {
      snapshot.updateValue(newValue, forKey: "is_admin")
    }
  }

  public var seenAt: Int? {
    get {
      return snapshot["seen_at"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "seen_at")
    }
  }

  public var user: User? {
    get {
      return (snapshot["user"] as! Snapshot?).flatMap { User(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "user")
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("email", type: .nonNull(.scalar(String.self))),
      GraphQLField("phone", type: .scalar(String.self)),
      GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
      GraphQLField("photo", type: .object(Photo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
      self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var email: String {
      get {
        return snapshot["email"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "email")
      }
    }

    public var phone: String? {
      get {
        return snapshot["phone"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "phone")
      }
    }

    public var userType: String {
      get {
        return snapshot["user_type"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "user_type")
      }
    }

    public var photo: Photo? {
      get {
        return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "photo")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var userDetails: UserDetails {
        get {
          return UserDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Photo: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public struct AttachmentDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment AttachmentDetails on Attachment {\n  __typename\n  mime\n  ext\n  url\n  name\n  routes\n}"

  public static let possibleTypes = ["Attachment"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("mime", type: .scalar(String.self)),
    GraphQLField("ext", type: .scalar(String.self)),
    GraphQLField("url", type: .scalar(String.self)),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("routes", type: .list(.scalar(String.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
    self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var mime: String? {
    get {
      return snapshot["mime"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "mime")
    }
  }

  public var ext: String? {
    get {
      return snapshot["ext"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "ext")
    }
  }

  public var url: String? {
    get {
      return snapshot["url"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "url")
    }
  }

  public var name: String? {
    get {
      return snapshot["name"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  public var routes: [String?]? {
    get {
      return snapshot["routes"] as? [String?]
    }
    set {
      snapshot.updateValue(newValue, forKey: "routes")
    }
  }
}

public struct FamilyDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment FamilyDetails on Family {\n  __typename\n  id\n  name\n  photo {\n    __typename\n    ...AttachmentDetails\n  }\n}"

  public static let possibleTypes = ["Family"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("photo", type: .object(Photo.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
    self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return snapshot["name"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  public var photo: Photo? {
    get {
      return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "photo")
    }
  }

  public struct Photo: GraphQLSelectionSet {
    public static let possibleTypes = ["Attachment"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("mime", type: .scalar(String.self)),
      GraphQLField("ext", type: .scalar(String.self)),
      GraphQLField("url", type: .scalar(String.self)),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("routes", type: .list(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
      self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var mime: String? {
      get {
        return snapshot["mime"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "mime")
      }
    }

    public var ext: String? {
      get {
        return snapshot["ext"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "ext")
      }
    }

    public var url: String? {
      get {
        return snapshot["url"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "url")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var routes: [String?]? {
      get {
        return snapshot["routes"] as? [String?]
      }
      set {
        snapshot.updateValue(newValue, forKey: "routes")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var attachmentDetails: AttachmentDetails {
        get {
          return AttachmentDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

public struct IllnessDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment IllnessDetails on Illness {\n  __typename\n  id\n  name\n  description\n  medicines\n  name\n  type\n  family {\n    __typename\n    ...FamilyDetails\n  }\n  creator {\n    __typename\n    ...UserDetails\n  }\n}"

  public static let possibleTypes = ["Illness"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("description", type: .scalar(String.self)),
    GraphQLField("medicines", type: .scalar(String.self)),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("type", type: .scalar(Int.self)),
    GraphQLField("family", type: .object(Family.selections)),
    GraphQLField("creator", type: .object(Creator.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, name: String? = nil, description: String? = nil, medicines: String? = nil, type: Int? = nil, family: Family? = nil, creator: Creator? = nil) {
    self.init(snapshot: ["__typename": "Illness", "id": id, "name": name, "description": description, "medicines": medicines, "type": type, "family": family.flatMap { $0.snapshot }, "creator": creator.flatMap { $0.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return snapshot["name"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  public var description: String? {
    get {
      return snapshot["description"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "description")
    }
  }

  public var medicines: String? {
    get {
      return snapshot["medicines"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "medicines")
    }
  }

  public var type: Int? {
    get {
      return snapshot["type"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "type")
    }
  }

  public var family: Family? {
    get {
      return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "family")
    }
  }

  public var creator: Creator? {
    get {
      return (snapshot["creator"] as! Snapshot?).flatMap { Creator(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "creator")
    }
  }

  public struct Family: GraphQLSelectionSet {
    public static let possibleTypes = ["Family"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("photo", type: .object(Photo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
      self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var photo: Photo? {
      get {
        return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "photo")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var familyDetails: FamilyDetails {
        get {
          return FamilyDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Photo: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }

  public struct Creator: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("email", type: .nonNull(.scalar(String.self))),
      GraphQLField("phone", type: .scalar(String.self)),
      GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
      GraphQLField("photo", type: .object(Photo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
      self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var email: String {
      get {
        return snapshot["email"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "email")
      }
    }

    public var phone: String? {
      get {
        return snapshot["phone"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "phone")
      }
    }

    public var userType: String {
      get {
        return snapshot["user_type"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "user_type")
      }
    }

    public var photo: Photo? {
      get {
        return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "photo")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var userDetails: UserDetails {
        get {
          return UserDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Photo: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public struct PendingDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment PendingDetails on Pending {\n  __typename\n  id\n  title\n  priority\n  details\n  created_at\n  updated_at\n}"

  public static let possibleTypes = ["Pending"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("title", type: .scalar(String.self)),
    GraphQLField("priority", type: .scalar(String.self)),
    GraphQLField("details", type: .scalar(String.self)),
    GraphQLField("created_at", type: .scalar(Int.self)),
    GraphQLField("updated_at", type: .scalar(Int.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, title: String? = nil, priority: String? = nil, details: String? = nil, createdAt: Int? = nil, updatedAt: Int? = nil) {
    self.init(snapshot: ["__typename": "Pending", "id": id, "title": title, "priority": priority, "details": details, "created_at": createdAt, "updated_at": updatedAt])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String? {
    get {
      return snapshot["title"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "title")
    }
  }

  public var priority: String? {
    get {
      return snapshot["priority"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "priority")
    }
  }

  public var details: String? {
    get {
      return snapshot["details"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "details")
    }
  }

  public var createdAt: Int? {
    get {
      return snapshot["created_at"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "created_at")
    }
  }

  public var updatedAt: Int? {
    get {
      return snapshot["updated_at"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "updated_at")
    }
  }
}

public struct SolicitudeFDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment SolicitudeFDetails on FamilyApplication {\n  __typename\n  id\n  family {\n    __typename\n    ...FamilyDetails\n  }\n  user {\n    __typename\n    ...UserDetails\n  }\n  status\n}"

  public static let possibleTypes = ["FamilyApplication"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("family", type: .object(Family.selections)),
    GraphQLField("user", type: .object(User.selections)),
    GraphQLField("status", type: .scalar(String.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, family: Family? = nil, user: User? = nil, status: String? = nil) {
    self.init(snapshot: ["__typename": "FamilyApplication", "id": id, "family": family.flatMap { $0.snapshot }, "user": user.flatMap { $0.snapshot }, "status": status])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var family: Family? {
    get {
      return (snapshot["family"] as! Snapshot?).flatMap { Family(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "family")
    }
  }

  public var user: User? {
    get {
      return (snapshot["user"] as! Snapshot?).flatMap { User(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "user")
    }
  }

  public var status: String? {
    get {
      return snapshot["status"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "status")
    }
  }

  public struct Family: GraphQLSelectionSet {
    public static let possibleTypes = ["Family"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("photo", type: .object(Photo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String? = nil, photo: Photo? = nil) {
      self.init(snapshot: ["__typename": "Family", "id": id, "name": name, "photo": photo.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var photo: Photo? {
      get {
        return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "photo")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var familyDetails: FamilyDetails {
        get {
          return FamilyDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Photo: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("email", type: .nonNull(.scalar(String.self))),
      GraphQLField("phone", type: .scalar(String.self)),
      GraphQLField("user_type", type: .nonNull(.scalar(String.self))),
      GraphQLField("photo", type: .object(Photo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, name: String, email: String, phone: String? = nil, userType: String, photo: Photo? = nil) {
      self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "user_type": userType, "photo": photo.flatMap { $0.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var email: String {
      get {
        return snapshot["email"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "email")
      }
    }

    public var phone: String? {
      get {
        return snapshot["phone"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "phone")
      }
    }

    public var userType: String {
      get {
        return snapshot["user_type"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "user_type")
      }
    }

    public var photo: Photo? {
      get {
        return (snapshot["photo"] as! Snapshot?).flatMap { Photo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "photo")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var userDetails: UserDetails {
        get {
          return UserDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Photo: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mime", type: .scalar(String.self)),
        GraphQLField("ext", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("routes", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil, routes: [String?]? = nil) {
        self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name, "routes": routes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mime: String? {
        get {
          return snapshot["mime"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mime")
        }
      }

      public var ext: String? {
        get {
          return snapshot["ext"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ext")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var routes: [String?]? {
        get {
          return snapshot["routes"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "routes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var attachmentDetails: AttachmentDetails {
          get {
            return AttachmentDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}