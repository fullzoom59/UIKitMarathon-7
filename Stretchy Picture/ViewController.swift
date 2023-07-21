import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .darkContent
    }
    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Sonoma"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = CGRect(origin: .zero, size: .init(width: UIScreen.main.bounds.size.width, height: 270))
        return imageView
    }()
    
    private let imageHeight: CGFloat = 270
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = scrollView
        scrollView.addSubview(imageView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = 270 - scrollView.contentOffset.y
        imageView.frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: UIScreen.main.bounds.size.width, height: height)
        
        let topInset = max(height, imageHeight) - view.safeAreaInsets.top
        scrollView.verticalScrollIndicatorInsets = .init(top: topInset, left: 0, bottom: 0, right: 0)
    }
}
