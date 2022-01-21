//
//  AdviceModelProtocol.swift
//  AdviceApp
//
//  Created by Camila Ribeiro Rodrigues on 17/01/22.
//

import Foundation

protocol AdviceViewModelProtocol {
	var reloadView: (() -> Void)? { get set }
	var advice: AdviceModel? { get }
	func viewDidLoad()
}
