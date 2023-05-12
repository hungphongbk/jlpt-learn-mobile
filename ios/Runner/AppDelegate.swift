import UIKit
import receive_sharing_intent
import SwiftUI
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate,AddNewWordDelegate {
    var show: Bool = false
    var flutterResult: FlutterResult?
    
    @Published var _initialWord: String = ""
    var initialWord: Published<String>.Publisher { $_initialWord }
    
    var controller: FlutterViewController {
        get {
            return (window?.rootViewController as! FlutterViewController)
        }
    }
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        GeneratedPluginRegistrant.register(with: self)
        
        let channel = FlutterMethodChannel.init(name: "com.jlptlearn.mixandmatch/add_new_word", binaryMessenger: controller.binaryMessenger)
        
        let view = AddNewWordUIView(delegate: self)
        let addNewWordController = UIHostingController(rootView: view)
        
        channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if ("showSheet" == call.method) {
                self.controller.present(addNewWordController, animated: true, completion: nil)
                self.flutterResult = result
                print((call.arguments as? String)!)
                self._initialWord = (call.arguments as? String)!
            } else {
                result(FlutterMethodNotImplemented)
            }
        });
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let sharingIntent = SwiftReceiveSharingIntentPlugin.instance
        if sharingIntent.hasMatchingSchemePrefix(url: url) {
            return sharingIntent.application(app, open: url, options: options)
        }
        
        return super.application(app, open: url, options:options)
    }
}
