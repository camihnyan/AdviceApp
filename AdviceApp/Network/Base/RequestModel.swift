//
//  RequestModel.swift
//  AdviceApp
//
//  Created by Camila Ribeiro Rodrigues on 17/01/22.
//

import Foundation

typealias APIParams = [String : Any]?
typealias APIHeaders = [String : String]?

protocol RequestModel {

	var url: URL { get }

	var params: APIParams { get }

	var headers: APIHeaders { get }

	var method: String { get }

	var endPoint: String { get }
	
}

extension RequestModel {
	
	var baseURL: String {
		return "https://api.adviceslip.com"
	}
	
	var url: URL {
		print("\(baseURL)/\(endPoint)")
		return URL(string: "\(baseURL)/\(endPoint)")!
	}
}
