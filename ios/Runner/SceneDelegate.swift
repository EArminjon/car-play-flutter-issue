import UIKit  // pour utiliser l’interface utilisateur iOS
import CarPlay  // pour gérer CarPlay

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var carPlaySceneDelegate = CarPlaySceneDelegate()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let carPlayScene = scene as? CPTemplateApplicationScene {
            carPlayScene.delegate = carPlaySceneDelegate
            return
        }
        guard let windowScene = scene as? UIWindowScene else { return }

        window = UIWindow(windowScene: windowScene)

        let flutterEngine = FlutterEngine(name: "SceneDelegateEngine")
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: flutterEngine)

        let controller = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)

        // This code below is a trick to force the splash screen to continue else a black page is visible before flutter engine really display a frame
        if let storyboardName = Bundle.main.object(forInfoDictionaryKey: "UILaunchStoryboardName") as? String,
           let launchScreen = UIStoryboard(name: storyboardName, bundle: nil)
                .instantiateInitialViewController()?.view {
            launchScreen.frame = UIScreen.main.bounds
            controller.splashScreenView = launchScreen
        }

        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
