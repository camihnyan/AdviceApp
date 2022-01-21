//
//  AdviceViewModel.swift
//  AdviceApp
//
//  Created by Camila Ribeiro Rodrigues on 17/01/22.
//

import Foundation
import UIKit

final class AdviceViewModel {
	
	private let adviceServices: AdviceServicesProtocol
	
	var advice: AdviceModel? {
		didSet {
			reloadView?()
		}
	}
	
	var reloadView: (() -> Void)?
	
	init(adviceServices: AdviceServicesProtocol) {
		self.adviceServices = adviceServices
	}
	
	func viewDidLoad() {
		fetchAdvices()
	}
	
	private func fetchAdvices() {
		adviceServices.fetchAllAdvices { result in
			switch result {
			case .success(let adviceResult):
				self.advice = adviceResult
			case .failure: break
			}
		}
	}
}

// MARK: - Extensions
extension AdviceViewModel: AdviceViewModelProtocol { }
