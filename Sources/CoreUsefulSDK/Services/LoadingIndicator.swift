//
//  File.swift
//  
//
//  Created by Burak Uzunboy on 25.08.20.
//

#if !os(macOS) && !os(watchOS)
import UIKit

/**
 Shows Loading Indicator View on top of the root view controller when needed.
 */
open class LoadingIndicator {
    
    /// Tint Color that will be applied to the activity indicator.
    public static var tintColor: UIColor = .red {
        didSet {
            LoadingIndicator.shared.activityIndicator.color = LoadingIndicator.tintColor
        }}
    
    /// Background color of the container view.
    public static var backgroundColor: UIColor = UIColor.gray.withAlphaComponent(0.5) {
           didSet {
               LoadingIndicator.shared.activityContainer.backgroundColor = LoadingIndicator.tintColor
           }}
    
    /// Singleton instance.
    private static let shared = LoadingIndicator()
    /// Activity indicator view.
    private var activityIndicator: UIActivityIndicatorView
    /// Container view of the activity indicator.
    private var activityContainer: UIView
    
    /// Private default initializer.
    private init() {
        self.activityContainer = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        self.activityContainer.backgroundColor = LoadingIndicator.backgroundColor
        self.activityContainer.cornerRadius = 16
        
        self.activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        self.activityIndicator.color = LoadingIndicator.tintColor
        self.activityIndicator.autoresizingMask = [.flexibleBottomMargin, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin]
        self.activityIndicator.alpha = 1.0
        self.activityIndicator.hidesWhenStopped = false
        self.activityIndicator.startAnimating()
        
        self.activityContainer.addSubview(self.activityIndicator)
        self.activityContainer.bringSubviewToFront(self.activityIndicator)
        self.activityIndicator.center = self.activityContainer.center
    }
    
    /// Starts to show the loading indicator in top view controller.
    public class func show() {
        guard let topVC = UIApplication.topViewController() else { return }
        
        let instance = LoadingIndicator.shared
        instance.activityContainer.removeFromSuperview()
        
        instance.activityContainer.alpha = 0.0
        
        topVC.view.addSubview(instance.activityContainer)
        topVC.view.bringSubviewToFront(instance.activityContainer)
        
        instance.activityContainer.center = topVC.view.center
        UIView.animate(withDuration: 0.3) {
            instance.activityContainer.alpha = 1.0
        }
    }
    
    /// Stops and hides the loading indicator from the view even view is changed.
    public class func stop(animated: Bool = true) {
        let instance = LoadingIndicator.shared
        
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                instance.activityContainer.alpha = 0.0
            }) { (_) in
                instance.activityContainer.removeFromSuperview()
            }
        } else {
            instance.activityContainer.removeFromSuperview()
        }
    }
    
}

#endif
