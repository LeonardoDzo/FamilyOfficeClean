//  This file was automatically generated and should not be edited.

import Apollo

public final class SignInUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation SignInUser($e: String!, $p: String!) {\n  signInUser(emailProvider: {email: $e, password: $p}) {\n    __typename\n    token\n    user {\n      __typename\n      ...UserDetails\n      families {\n        __typename\n        family {\n          __typename\n          photo {\n            __typename\n            ...PhotoDetails\n          }\n          name\n          id\n          members {\n            __typename\n            user {\n              __typename\n              ...UserDetails\n            }\n          }\n        }\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetails.fragmentString).appending(PhotoDetails.fragmentString) }

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
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("families", type: .nonNull(.list(.object(Family.selections)))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, families: [Family?]) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "families": families.map { $0.flatMap { $0.snapshot } }])
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
              GraphQLField("members", type: .nonNull(.list(.object(Member.selections)))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(photo: Photo? = nil, name: String? = nil, id: GraphQLID, members: [Member?]) {
              self.init(snapshot: ["__typename": "Family", "photo": photo.flatMap { $0.snapshot }, "name": name, "id": id, "members": members.map { $0.flatMap { $0.snapshot } }])
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
                return (snapshot["photo"] as? Snapshot).flatMap { Photo(snapshot: $0) }
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

            public var members: [Member?] {
              get {
                return (snapshot["members"] as! [Snapshot?]).map { $0.flatMap { Member(snapshot: $0) } }
              }
              set {
                snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "members")
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
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil) {
                self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name])
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

                public var photoDetails: PhotoDetails {
                  get {
                    return PhotoDetails(snapshot: snapshot)
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
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, name: String, email: String, phone: String? = nil) {
                  self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone])
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
      }
    }
  }
}

public final class SignUpMutation: GraphQLMutation {
  public static let operationString =
    "mutation SignUp($name: String!, $email: String!, $password: String!, $phone: String!) {\n  createUser(name: $name, phone: $phone, emailProvider: {email: $email, password: $password}) {\n    __typename\n    token\n    user {\n      __typename\n      ...UserDetails\n      families {\n        __typename\n        family {\n          __typename\n          photo {\n            __typename\n            ...PhotoDetails\n          }\n          name\n          id\n        }\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetails.fragmentString).appending(PhotoDetails.fragmentString) }

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
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("families", type: .nonNull(.list(.object(Family.selections)))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, email: String, phone: String? = nil, families: [Family?]) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "families": families.map { $0.flatMap { $0.snapshot } }])
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
                return (snapshot["photo"] as? Snapshot).flatMap { Photo(snapshot: $0) }
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
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil) {
                self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name])
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

                public var photoDetails: PhotoDetails {
                  get {
                    return PhotoDetails(snapshot: snapshot)
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

public final class CreateFamilyMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateFamily($name: String!) {\n  createFamily(name: $name) {\n    __typename\n    ...FamilyDetails\n    members {\n      __typename\n      user {\n        __typename\n        ...UserDetails\n        families {\n          __typename\n          family {\n            __typename\n            ...FamilyDetails\n          }\n        }\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(FamilyDetails.fragmentString).appending(PhotoDetails.fragmentString).appending(UserDetails.fragmentString) }

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
        return (snapshot["createFamily"] as? Snapshot).flatMap { CreateFamily(snapshot: $0) }
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
          return (snapshot["photo"] as? Snapshot).flatMap { Photo(snapshot: $0) }
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
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil) {
          self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name])
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

          public var photoDetails: PhotoDetails {
            get {
              return PhotoDetails(snapshot: snapshot)
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
            GraphQLField("families", type: .nonNull(.list(.object(Family.selections)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, email: String, phone: String? = nil, families: [Family?]) {
            self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "families": families.map { $0.flatMap { $0.snapshot } }])
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
                  return (snapshot["photo"] as? Snapshot).flatMap { Photo(snapshot: $0) }
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
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil) {
                  self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name])
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

                  public var photoDetails: PhotoDetails {
                    get {
                      return PhotoDetails(snapshot: snapshot)
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
        return (snapshot["createPending"] as? Snapshot).flatMap { CreatePending(snapshot: $0) }
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

public final class AllUserQuery: GraphQLQuery {
  public static let operationString =
    "query allUser($phones: [String], $rol: Int) {\n  allUsers(filter: {phone: $phones, user_type: $rol}) {\n    __typename\n    ...UserDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(UserDetails.fragmentString) }

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
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, email: String, phone: String? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone])
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

public struct UserDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment UserDetails on User {\n  __typename\n  id\n  name\n  email\n  phone\n}"

  public static let possibleTypes = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("email", type: .nonNull(.scalar(String.self))),
    GraphQLField("phone", type: .scalar(String.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, name: String, email: String, phone: String? = nil) {
    self.init(snapshot: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone])
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
}

public struct PhotoDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment PhotoDetails on Attachment {\n  __typename\n  mime\n  ext\n  url\n  name\n}"

  public static let possibleTypes = ["Attachment"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("mime", type: .scalar(String.self)),
    GraphQLField("ext", type: .scalar(String.self)),
    GraphQLField("url", type: .scalar(String.self)),
    GraphQLField("name", type: .scalar(String.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil) {
    self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name])
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
}

public struct FamilyDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment FamilyDetails on Family {\n  __typename\n  id\n  name\n  photo {\n    __typename\n    ...PhotoDetails\n  }\n}"

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
      return (snapshot["photo"] as? Snapshot).flatMap { Photo(snapshot: $0) }
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
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(mime: String? = nil, ext: String? = nil, url: String? = nil, name: String? = nil) {
      self.init(snapshot: ["__typename": "Attachment", "mime": mime, "ext": ext, "url": url, "name": name])
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

      public var photoDetails: PhotoDetails {
        get {
          return PhotoDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
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