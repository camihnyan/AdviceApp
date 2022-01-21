//
//  AdviceModel.swift
//  AdviceApp
//
//  Created by Camila Ribeiro Rodrigues on 17/01/22.
//

import Foundation

// MARK: - AdviceModel
struct AdviceModel: Codable {
	let slip: Slip
}

// MARK: - Slip
struct Slip: Codable {
	let id: Int
	let advice: String
}

