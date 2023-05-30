import UIKit

internal class ScreenPresenter: NSObject {

    // MARK: Module
    internal var view: ScreenViewControllerProtocol?
    private let application: UIApplication

    internal init(application: UIApplication = .shared) {
        self.application = application
        super.init()
    }

    private func validatePhoneIsEmpty(_ phone: String) {
        view?.hiddenCall(isHidden: phone.count < 1)
    }

}

extension ScreenPresenter: ScreenPresenterProtocol {

    internal func numberButtonTapped(number: String, phone: String?) {
        guard var phone = phone else {
            view?.setLabel(title: number)
            view?.hiddenCall(isHidden: false)
            return
        }

        guard phone.count < 12 else { return }

        phone.append(number)
        view?.setLabel(title: phone)
        validatePhoneIsEmpty(phone)
    }

    internal func callButtonTapped(phone: String?) {
        if let phone = phone {
            let urlString = "whatsapp://send?phone=55\(phone)"
            guard let url = URL(string: urlString), application.canOpenURL(url) else { return }

            application.open(url, options: [:])
        }
    }

    internal func deleteButtonTapped(phone: String?) {
        guard var phone = phone else { return }

        phone.removeLast()

        view?.setLabel(title: phone)
        validatePhoneIsEmpty(phone)
    }

}
