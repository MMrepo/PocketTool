//
//  Error+String.swift
//  Vindur
//
//  Created by Mateusz on 18.12.2017.
//  Copyright © 2017 Vindur. All rights reserved.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
