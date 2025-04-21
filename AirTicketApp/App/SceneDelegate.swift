//
//  SceneDelegate.swift
//  AirTicketApp
//
//  Created by Muhammet Yiğit on 21.04.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let splashVC = UIViewController()
        splashVC.view.backgroundColor = UIColor(red: 163/255, green: 29/255, blue: 29/255, alpha: 1)
        
        let planeLabel = UILabel()
        planeLabel.text = "🛫"
        planeLabel.font = UIFont.systemFont(ofSize: 40)
        planeLabel.translatesAutoresizingMaskIntoConstraints = false
        splashVC.view.addSubview(planeLabel)
        
        let lettersStack = UIStackView()
        lettersStack.axis = .horizontal
        lettersStack.alignment = .center
        lettersStack.spacing = 5
        lettersStack.translatesAutoresizingMaskIntoConstraints = false
        splashVC.view.addSubview(lettersStack)
        
        let text = "Air Ticket App"
        var letterLabels: [UILabel] = []
        for char in text {
            let label = UILabel()
            label.text = String(char)
            label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
            label.textColor = UIColor(red: 0xEC/255, green: 0xDC/255, blue: 0xBF/255, alpha: 1.0)
            label.alpha = 0
            letterLabels.append(label)
            lettersStack.addArrangedSubview(label)
        }
        
        NSLayoutConstraint.activate([
            planeLabel.centerYAnchor.constraint(equalTo: splashVC.view.centerYAnchor),
            planeLabel.leadingAnchor.constraint(equalTo: splashVC.view.leadingAnchor, constant: -40),
            
            lettersStack.centerXAnchor.constraint(equalTo: splashVC.view.centerXAnchor),
            lettersStack.topAnchor.constraint(equalTo: planeLabel.bottomAnchor, constant: 20)
        ])
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = splashVC
        window?.makeKeyAndVisible()
        
        let durationPerStep = 0.25
        
        for (index, label) in letterLabels.enumerated() {
            let delay = Double(index) * durationPerStep
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                label.alpha = 1
                UIView.animate(withDuration: durationPerStep) {
                    planeLabel.transform = CGAffineTransform(translationX: CGFloat(index) * 35, y: 0)
                }
            }
        }
        
        let totalDuration = Double(text.count) * durationPerStep + 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + totalDuration) {
            UIView.animate(withDuration: 0.6) {
                splashVC.view.backgroundColor = .systemGray6
                letterLabels.forEach { $0.textColor = .darkGray }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let nav = storyboard.instantiateViewController(withIdentifier: "NavigationController") as? UINavigationController else { return }
                UIView.transition(with: self.window!, duration: 0.6, options: [.transitionCrossDissolve], animations: {
                    self.window?.rootViewController = nav
                })
            }
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

