import UIKit  // pour utiliser l’interface utilisateur iOS
import CarPlay  // pour gérer CarPlay

class CarPlaySceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {
    private var interfaceController: CPInterfaceController?

    func templateApplicationScene(
        _ templateApplicationScene: CPTemplateApplicationScene,
        didConnect interfaceController: CPInterfaceController
    ) {
        self.interfaceController = interfaceController
        
        setInformationTemplate()
    }
    
    private func setInformationTemplate() {
        let sections: [CPListSection] = [
            .init(items: [
                .init(text: "Hello, CarPlay!", detailText: "This is a test app.")
            ])
        ]
        
        let infoTemplate = CPListTemplate(title: "Hello World", sections: sections)
        
        interfaceController?.setRootTemplate(infoTemplate,
                                             animated: true,
                                             completion: { success, error in
            if let error = error {
                debugPrint("Error: \(error)")
            }
        })
    }
}
