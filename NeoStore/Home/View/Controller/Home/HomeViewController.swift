//
//  HomeViewController.swift
//  NeoStore
//
//  Created by Shraddha Ghadage on 09/08/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var ImageSliderView: UICollectionView!
    @IBOutlet weak var PageController: UIPageControl!
    @IBOutlet weak var productImgView: UICollectionView!
    let viewModel =  HomeViewModel()
    var imgArray = [
        "imgSlide":  [UIImage(named: "slider_img1"),
                      UIImage(named: "slider_img2"),
                      UIImage(named: "slider_img3"),
                      UIImage(named: "slider_img4")]] 
    var timer:Timer?
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let titleAttributes: [NSAttributedString.Key: Any] = [
                   .font: UIFont.boldSystemFont(ofSize: 28) ,
                   .foregroundColor: UIColor.white
               ]

               navigationController?.navigationBar.titleTextAttributes = titleAttributes

        let customBackButton = UIBarButtonItem(image: UIImage(named: "menu_icon"), style: .plain, target: self, action: #selector(menuSlider))
        customBackButton.tintColor = UIColor.white
        let customSearchButton = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(menuSlider))
        customSearchButton.tintColor = UIColor.white
                // Set the left bar button item
        self.navigationItem.leftBarButtonItem = customBackButton
        self.navigationItem.rightBarButtonItem = customSearchButton

        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        PageController.numberOfPages = imgArray["imgSlide"]!.count
        PageController.currentPage = 0
        
    }
   
    @objc func menuSlider() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "NeoSTORE"
    }
    @objc func slideToNext()
    {
        if counter < imgArray["imgSlide"]!.count - 1 {
            counter = counter + 1
        }
        else {
            counter = 0
        }
        PageController.currentPage = counter
        ImageSliderView.scrollToItem(at: IndexPath(item: counter, section: 0), at: .right, animated: true)
    }
    
}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.ImageSliderView  {
            guard let listCount = imgArray["imgSlide"] else {
                return 0
            }
            return listCount.count
        } else {
            return viewModel.getNumberOfRows()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = viewModel.getProductId(iIndex: indexPath.row)
        print(index)
        if collectionView == productImgView {
            if let productVC = self.storyboard?.instantiateViewController(withIdentifier: "VC") as? ProductViewController {
                productVC.productId = index
                self.navigationItem.title = ""
                self.navigationController?.pushViewController(productVC, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == ImageSliderView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageSliderCollectionViewCell
            if let arrImg = imgArray["imgSlide"] {
                cell.imgView.image = arrImg[indexPath.row]
            }
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            
            if let product = viewModel.getDataForIndexpath(iIndex: indexPath.row) {
                cell.imgView.image = product.image
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == ImageSliderView
        {
            return CGSize(width: ImageSliderView.frame.size.width, height: ImageSliderView.frame.size.height)
        }
        else {
            //  let size = (collectionView.frame.size.width) / 2
            return CGSize(width: (collectionView.frame.width-10) / 2, height: (collectionView.frame.height-10) / 2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
}

class HomeViewModel {
    var productListContent: [productContent]?
    
    init() {
        getProduct()
    }
    
    func getProduct() {
        let list = productList()
        productListContent = list.productList
    }
    
    func getNumberOfRows() -> Int {
        return productListContent?.count ?? 0
    }
    
    func getDataForIndexpath(iIndex: Int) -> productContent? {
        return productListContent?[iIndex] ?? nil
    }
    
    func getProductId(iIndex: Int) -> Int {
        return productListContent?[iIndex].contentId ?? -1
    }
}
