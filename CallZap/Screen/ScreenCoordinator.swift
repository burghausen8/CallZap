import UIKit

internal class ScreenCoordinator {

    private weak var navigationController: UINavigationController?

    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

}

extension ScreenCoordinator {

    internal static func createModule(navigationController: UINavigationController?) -> UIViewController {
        let coordinator = ScreenCoordinator(navigationController: navigationController)
        let presenter = ScreenPresenter()
        let controller = ScreenViewController()

        presenter.view = controller
        controller.presenter = presenter

        return controller
    }

}
