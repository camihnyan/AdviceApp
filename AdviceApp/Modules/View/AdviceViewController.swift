//
//  AdviceViewController.swift
//  AdviceApp
//
//  Created by Camila Ribeiro Rodrigues on 17/01/22.
//

import Foundation
import UIKit

final class AdviceViewController: UIViewController {
	
	// MARK: - Class properties
	private var viewModel: AdviceViewModelProtocol
	private lazy var viewInstance = AdviceView()

	// MARK: - Public properties

	
	// MARK: - Life Cycle
	
	init(viewModel: AdviceViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		viewInstance = AdviceView()
		view = viewInstance
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewInstance.delegate(self)
		viewModel.viewDidLoad()
		viewInstance.configure(with: viewModel)
		bindUI()
	}
	
	private func bindUI() {
		viewModel.reloadView = { [self] in
			DispatchQueue.main.async {
				viewInstance.configure(with: viewModel)
			}
		}
	}
}

extension AdviceViewController: AdviceViewDelegate {}
