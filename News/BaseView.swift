import UIKit

protocol BaseView: class {
}

extension BaseView {
    
    // MARK: - MY
    func showAlert(title: String? = nil, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okAction)
        (self as? UIViewController)?.present(alert, animated: true)
        // self.present(alert, animated: true)
    }
    
    func showAlert(title: String,
                   message: String,
                   firstButtonTitle: String,
                   secondButtonTitle: String,
                   onFirstButton: (() -> Void)? = nil) {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let declineAction = UIAlertAction(title: secondButtonTitle, style: .cancel) {_ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(declineAction)
        let allowAction = UIAlertAction(title: firstButtonTitle, style: .default, handler: { _ in
            guard UIApplication.shared.canOpenURL(settingsUrl) else { return }
            UIApplication.shared.open(settingsUrl,
                                      completionHandler: nil)
        })
        alert.addAction(allowAction)
        (self as? UIViewController)?.present(alert, animated: true)
        // self.present(alert, animated: true, completion: nil)
    }
    
    // индикатор дописать
}

