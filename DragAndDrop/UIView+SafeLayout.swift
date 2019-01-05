//
//  UIView+SafeLayout.swift
//  DragAndDrop
//
//  Created by Anuj Kumar on 12/19/18.
//  Copyright © 2018 Anuj Kumar. All rights reserved.
//

import UIKit

extension UIView {
  var safeTopAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.topAnchor
    }
    return topAnchor
  }
  var safeBottomAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.bottomAnchor
    }
    return bottomAnchor
  }
  var safeLeftAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.leftAnchor
    }
    return leftAnchor
  }
  var safeRightAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.rightAnchor
    }
    return leftAnchor
  }
}
