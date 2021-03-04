
import Foundation
import FirebaseFirestore
import class Firebase.User
typealias FirebaseUser = Firebase.User


struct User: Codable{
    var favoriteClub: String = ""
    var email: String = ""
}


struct SignInCredentials: Encodable
{
    var email: String
    var password: String
}
