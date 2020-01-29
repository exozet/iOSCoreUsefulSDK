//
//  Orientable.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 06.06.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

/**
View Controllers who conform that protocol, will mark themselves as only accepting landscape orientation.
*/
public protocol Landscapeable: UIViewController { }

/**
View Controllers who conform that protocol, will mark themselves as only accepting portrait orientation.
*/
public protocol Portaiteable: UIViewController { }

/**
 View Controllers who conform that protocol, will mark themselves as accepting all screen rotations.
 */
public protocol AllOrientateable: UIViewController { }
