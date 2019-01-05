//
//  ViewController.swift
//  DragAndDrop
//
//  Created by Anuj Kumar on 12/19/18.
//  Copyright © 2018 Anuj Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  enum Constants {
    static let iconSize: CGFloat = 60
    static let fileImageName = "file"
    static let trashImageName = "trash"
    static let padding: CGFloat = 10.0
  }

  lazy var fileView: UIImageView = {
    let file = UIImageView()
    file.image = UIImage(named: Constants.fileImageName)
    file.contentMode = .scaleAspectFit
    file.isUserInteractionEnabled = true
    return file
  }()

  lazy var trashView: UIImageView = {
    let trash = UIImageView()
    trash.contentMode = .scaleAspectFit
    trash.image = UIImage(named: Constants.trashImageName)
    return trash
  }()

  var originalCenter: CGPoint?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
    // Do any additional setup after loading the view, typically from a nib.
    view.addSubview(fileView)
    view.addSubview(trashView)
    setupConstraints()
    setupGestureRecognizer()
  }

  // MARK: Private

  private func setupConstraints() {
    fileView.translatesAutoresizingMaskIntoConstraints = false
    trashView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      fileView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: Constants.padding),
      fileView.leftAnchor.constraint(equalTo: view.safeLeftAnchor, constant: Constants.padding),
      fileView.widthAnchor.constraint(equalToConstant: Constants.iconSize),
      fileView.heightAnchor.constraint(equalToConstant: Constants.iconSize),

      trashView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -Constants.padding),
      trashView.rightAnchor.constraint(equalTo: view.safeRightAnchor, constant: -Constants.padding),
      trashView.widthAnchor.constraint(equalToConstant: Constants.iconSize),
      trashView.heightAnchor.constraint(equalToConstant: Constants.iconSize),
      ])
  }

  private func setupGestureRecognizer() {
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pan))
    panGesture.maximumNumberOfTouches = 1
    panGesture.minimumNumberOfTouches = 1
    fileView.addGestureRecognizer(panGesture)
  }

  @objc func pan(recognizer: UIPanGestureRecognizer) {
    let point = recognizer.location(in: view)
    switch recognizer.state {
    case .began:
      originalCenter = point
    case .changed:
      fileView.center = point
    case .ended:
      if fileView.frame.intersects(trashView.frame) {
        fileView.removeFromSuperview()
      } else {
        UIView.animate(withDuration: 1) {
          self.fileView.center = self.originalCenter!
        }
      }
    default:
      print("no op")
    }
  }
}

