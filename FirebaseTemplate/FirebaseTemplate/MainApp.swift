import SwiftUI
import Firebase
//import GoogleSignIn
//import FBSDKCoreKit
@main
struct MainApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
//                .onOpenURL(perform: { url in
//                    ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
//                })
                .environmentObject(FirebaseEnv())
        }
    }
}


//class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate, ObservableObject {
//
//    @Published var email = ""
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//        FirebaseApp.configure()
//
//        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
//
//        GIDSignIn.sharedInstance().delegate = self
//
//        return true
//    }
//
//
//
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        guard let user = user else {
//
//            print(error.localizedDescription)
//            return
//
//        }
//
//
//        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
//
//        Auth.auth().signIn(with: credential) { result, err in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }
//            self.email = (result?.user.email)!
//
//            print(result?.user.email)
//        }
//    }
//}
