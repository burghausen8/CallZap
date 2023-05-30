import UIKit
import SnapKit

internal class ScreenViewController: UIViewController {

    // MARK: Module
    internal var presenter: ScreenPresenterProtocol? = nil

    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black

        return view
    }()

    private lazy var containerNumbersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.backgroundColor = .black

        return stackView
    }()

    private lazy var containerLine1StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.backgroundColor = .black

        return stackView
    }()

    private lazy var containerLine2StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.backgroundColor = .black

        return stackView
    }()

    private lazy var containerLine3StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.backgroundColor = .black

        return stackView
    }()

    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical

        return stackView
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.font =  UIFont.boldSystemFont(ofSize: 35)

        return label
    }()

    private lazy var button1: UIButton = {
        let button =  createButton(title: "1")

        return button
    }()

    private lazy var button2: UIButton = {
        return createButton(title: "2")
    }()

    private lazy var button3: UIButton = {
        return createButton(title: "3")
    }()

    private lazy var button4: UIButton = {
        return createButton(title: "4")
    }()

    private lazy var button5: UIButton = {
        return createButton(title: "5")
    }()

    private lazy var button6: UIButton = {
        return createButton(title: "6")
    }()

    private lazy var button7: UIButton = {
        return createButton(title: "7")
    }()

    private lazy var button8: UIButton = {
        return createButton(title: "8")
    }()

    private lazy var button9: UIButton = {
        return createButton(title: "9")
    }()

    private lazy var button0: UIButton = {
        return createButton(title: "0")
    }()

    private lazy var buttonCall: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 45
        button.backgroundColor = .green
        let originalImage = UIImage(systemName: "phone.fill")
        let resizedImage = originalImage?.resized(to: CGSize(width: 35, height: 35))
        let coloredImage = resizedImage?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(coloredImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(callButtonTapped), for: .touchUpInside)
        button.isHidden = true

        return button
    }()

    private lazy var buttonDelete: UIButton = {
        let button = UIButton()
        let originalImage = UIImage(systemName: "delete.left.fill")
        let resizedImage = originalImage?.resized(to: CGSize(width: 35, height: 26))
        let coloredImage = resizedImage?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        button.setImage(coloredImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        button.isHidden = true

        return button
    }()

    private func createButton(title: String) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 45
        button.backgroundColor = .gray
        button.setTitle(title, for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(numberButtonTapped), for: .touchUpInside)

        return button
    }




    @objc private func numberButtonTapped(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            presenter?.numberButtonTapped(number: title, phone: label.text)
        }
    }

    @objc private func callButtonTapped() {
        presenter?.callButtonTapped(phone: label.text)
    }

    @objc private func deleteButtonTapped() {
        presenter?.deleteButtonTapped(phone: label.text)
    }

    //MARK: Override Methods
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.view.backgroundColor = .white
    }

    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

extension ScreenViewController: CodableView {


    internal func buildViews() {
        containerLine1StackView.addArrangedSubview(button1)
        containerLine1StackView.addArrangedSubview(button2)
        containerLine1StackView.addArrangedSubview(button3)

        containerLine2StackView.addArrangedSubview(button4)
        containerLine2StackView.addArrangedSubview(button5)
        containerLine2StackView.addArrangedSubview(button6)

        containerLine3StackView.addArrangedSubview(button7)
        containerLine3StackView.addArrangedSubview(button8)
        containerLine3StackView.addArrangedSubview(button9)

        containerNumbersStackView.addArrangedSubview(containerLine1StackView)
        containerNumbersStackView.addArrangedSubview(containerLine2StackView)
        containerNumbersStackView.addArrangedSubview(containerLine3StackView)
        containerNumbersStackView.addArrangedSubview(button0)

        labelStackView.addArrangedSubview(label)

        contentView.addSubview(labelStackView)
        contentView.addSubview(containerNumbersStackView)
        contentView.addSubview(buttonCall)
        contentView.addSubview(buttonDelete)

        view.addSubview(contentView)
    }

    internal func configConstraints() {
        contentView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        labelStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(containerNumbersStackView.snp.top).offset(-40)
        }
        containerNumbersStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        button1.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        button2.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        button3.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        button4.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        button5.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        button6.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        button7.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        button8.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        button9.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        button0.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        buttonCall.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(containerNumbersStackView.snp.bottom).offset(30)
        }
        buttonDelete.snp.makeConstraints { make in
            make.top.equalTo(buttonCall.snp.top)
            make.bottom.equalTo(buttonCall.snp.bottom)
            make.trailing.equalTo(containerNumbersStackView.snp.trailing)
        }
    }

}

extension ScreenViewController: ScreenViewControllerProtocol {

    func setLabel(title: String) {
        label.text = title
    }

    func hiddenCall(isHidden: Bool) {
        buttonDelete.isHidden = isHidden
        buttonCall.isHidden = isHidden
    }

}
