//
//  LoadingView.swift
//  Planetz
//
//  Created by Bibin Jaimon on 06/05/23.
//

import UIKit

class LoadingView: BaseView {
    private var activityIndicator: UIActivityIndicatorView = {
        let indiacator = UIActivityIndicatorView(style: .large)
        indiacator.translatesAutoresizingMaskIntoConstraints = false
        return indiacator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    override func constructView() {
        self.addSubview(activityIndicator)
    }
    
    override func configureView() {
        NSLayoutConstraint.activate([
            activityIndicator.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    func startAnimating() {
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}