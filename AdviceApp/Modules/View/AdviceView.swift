//
//  AdviceView.swift
//  AdviceApp
//
//  Created by Camila Ribeiro Rodrigues on 17/01/22.
//

import Foundation
import UIKit

protocol AdviceViewProtocol {
	func configure(with data: AdviceViewModelProtocol)
}

protocol AdviceViewDelegate: AnyObject {}

final class AdviceView: UIView {
	
	private enum Strings {
		static let treasure = "Advice"
		static let treasureOpen = "Advice-open"
		static let openAdvice = "Open"
		static let closeAdvice = "Close"
		static let scrollImage = "scroll"
		static let adviceTitle = "Advice of the day"
	}
	
	private enum Constants {
		static let titleHeight = UIScreen.main.bounds.height * 0.1
		static let adviceTextHeight = UIScreen.main.bounds.height * 0.15
		static let treasureImageViewHeight = UIScreen.main.bounds.height * 0.15
		static let treasureImageViewWidth = UIScreen.main.bounds.width * 0.15
		static let topStackView = UIScreen.main.bounds.height * 0.12
		static let heightStackView = UIScreen.main.bounds.height * 0.8
	}
	
	weak var delegate: AdviceViewDelegate?
	private var adviceString = ""
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .white
		addSubview(stackView)
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.topStackView),
			stackView.heightAnchor.constraint(equalToConstant: Constants.heightStackView),
			treasureImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			treasureImageView.widthAnchor.constraint(equalToConstant: Constants.treasureImageViewWidth),
			treasureImageView.heightAnchor.constraint(equalToConstant: Constants.treasureImageViewHeight),
			adviceTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			adviceTitle.heightAnchor.constraint(equalToConstant: Constants.titleHeight),
			adviceText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			adviceText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -22),
			adviceText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 22),
			adviceText.heightAnchor.constraint(equalToConstant: Constants.adviceTextHeight),
			adviceButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			adviceButton.heightAnchor.constraint(equalToConstant: 48),
			adviceButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.5)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private lazy var adviceTitle: UILabel = {
		let label = UILabel()
		label.textColor = .black
		label.font = .systemFont(ofSize: 40, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.text = Strings.adviceTitle
		label.layer.cornerRadius = 20
		return label
	}()
	
	private lazy var adviceText: UILabel = {
		let label = UILabel()
		label.textColor = .black
		label.backgroundColor = .yellow
		label.font = .systemFont(ofSize: 22, weight: .bold)
		label.numberOfLines = 4
		label.lineBreakMode = .byClipping
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var treasureImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: Strings.treasure)
		imageView.sizeToFit()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private lazy var adviceButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = .blue
		button.setTitle(Strings.openAdvice, for: .normal)
		button.setTitleColor(UIColor.white, for: .normal)
		button.layer.cornerRadius = 8
		button.translatesAutoresizingMaskIntoConstraints = false
		let buttonGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openAdvice))
		button.isUserInteractionEnabled = true
		button.addGestureRecognizer(buttonGestureRecognizer)
		return button
	}()
	
	private lazy var adviceTitleStackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [adviceTitle])
		stack.spacing = 4
		stack.axis = .vertical
		return stack
	}()
	
	private lazy var adviceTextStackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [adviceText])
		stack.spacing = 4
		stack.axis = .vertical
		return stack
	}()
	
	private lazy var treasureImageStackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [treasureImageView])
		stack.spacing = 4
		stack.axis = .vertical
		return stack
	}()
	
	private lazy var buttonStackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [adviceButton])
		stack.spacing = 4
		stack.axis = .vertical
		return stack
	}()
	
	private lazy var stackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [adviceTitleStackView, adviceTextStackView, treasureImageStackView, buttonStackView])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.spacing = 16
		stack.axis = .vertical
		return stack
	}()
	
	func delegate(_ delegate: AdviceViewDelegate) {
		self.delegate = delegate
	}
	
	@objc private func openAdvice() {
		if adviceText.text != adviceString {
			adviceText.text = adviceString
			adviceText.layer.masksToBounds = false
			adviceText.layer.shadowColor = UIColor.yellow.cgColor
			adviceText.layer.shadowOpacity = 0.35
			adviceText.layer.shadowRadius = 50
			treasureImageView.image = UIImage(named: Strings.treasureOpen)
			adviceButton.setTitle(Strings.closeAdvice, for: .normal)
		} else {
			adviceText.text = ""
			adviceText.layer.masksToBounds = true
			adviceButton.setTitle(Strings.openAdvice, for: .normal)
			treasureImageView.image = UIImage(named: Strings.treasure)
		}
	}
}

extension AdviceView: AdviceViewProtocol {
	func configure(with data: AdviceViewModelProtocol) {
		adviceString = data.advice?.slip.advice ?? ""
		print(data)
	}
}
