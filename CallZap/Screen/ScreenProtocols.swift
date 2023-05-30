// View -> Presenter
internal protocol ScreenPresenterProtocol {

    func numberButtonTapped(number: String, phone: String?)
    func callButtonTapped(phone: String?)
    func deleteButtonTapped(phone: String?)

}


// Presenter -> View
internal protocol ScreenViewControllerProtocol {

    func setLabel(title: String)
    func hiddenCall(isHidden: Bool)

}
