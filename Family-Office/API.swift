//  This file was automatically generated and should not be edited.

import Apollo

public final class AllUserQuery: GraphQLQuery {
  public static let operationString =
    "query allUser {\n  allUsers {\n    __typename\n    id\n    name\n    email\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allUsers", type: .list(.object(AllUser.selections))),
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
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, email: String) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email])
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
    }
  }
}

public final class MyFamiliesQuery: GraphQLQuery {
  public static let operationString =
    "query MyFamilies {\n  myFamilies {\n    __typename\n    id\n    name\n  }\n}"

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
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil) {
        self.init(snapshot: ["__typename": "Family", "id": id, "name": name])
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
    }
  }
}

public final class SignInUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation SignInUser($e: String!, $p: String!) {\n  signInUser(emailProvider: {email: $e, password: $p}) {\n    __typename\n    token\n    user {\n      __typename\n      ...UserDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetails.fragmentString) }

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
        return (snapshot["signInUser"] as? Snapshot).flatMap { SignInUser(snapshot: $0) }
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
          return (snapshot["user"] as? Snapshot).flatMap { User(snapshot: $0) }
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
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email])
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
      }
    }
  }
}

public final class SignUpMutation: GraphQLMutation {
  public static let operationString =
    "mutation SignUp($name: String!, $email: String!, $password: String!, $phone: String!) {\n  createUser(name: $name, phone: $phone, emailProvider: {email: $email, password: $password}) {\n    __typename\n    token\n    user {\n      __typename\n      ...UserDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetails.fragmentString) }

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
        return (snapshot["createUser"] as? Snapshot).flatMap { CreateUser(snapshot: $0) }
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
          return (snapshot["user"] as? Snapshot).flatMap { User(snapshot: $0) }
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
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email])
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
      }
    }
  }
}

public struct UserDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment UserDetails on User {\n  __typename\n  id\n  name\n  email\n}"

  public static let possibleTypes = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("email", type: .nonNull(.scalar(String.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, name: String, email: String) {
    self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email])
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
}