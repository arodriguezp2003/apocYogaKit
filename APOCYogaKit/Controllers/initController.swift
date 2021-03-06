//
//  ViewController.swift
//  APOCYogaKit
//
//  Created by Alejandro  Rodriguez on 1/23/19.
//  Copyright © 2019 Alejandro  Rodriguez. All rights reserved.
//

import UIKit
import YogaKit

class InitController: UIViewController {

    var titleHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Tarjeta de Crédito"
        label.font = UIFont(name: "PFBeauSansPro-Regular", size: 18)
        label.textAlignment = .center
        label.textColor = UIColor.defaultTheme.primaryText
        return label
    }()
    
    var usedLabel: UILabel = {
        let label = UILabel()
        label.text = "$130.000"
        let font = UIFont(name: "MyriadPro-Semibold", size: 18)!
        label.font =  UIFont(name: font.fontName, size: font.pointSize.dp)
        label.textAlignment = .center
        label.textColor = UIColor.defaultTheme.primaryText
        return label
    }()
    
    var availableLabel: UILabel = {
        let label = UILabel()
        label.text = "$670.000"
        let font = UIFont(name: "MyriadPro-Semibold", size: 18)!
        label.font =  UIFont(name: font.fontName, size: font.pointSize.dp)
        label.textAlignment = .center
        label.textColor = UIColor.defaultTheme.primaryText
        return label
    }()
    
    var selectorLastMov: UIButton = {
        let button = UIButton()
        button.tag = 1000
        button.setTitle("Últimos movimientos", for: .normal)
        button.setTitleColor(UIColor.defaultTheme.active, for: .normal)
        button.titleLabel?.font =  UIFont(name: "PFBeauSansPro-Regular", size: 14)
    
        return button
    }()
    
    var selectorBillingMov: UIButton = {
        let button = UIButton()
        button.tag = 1001
        button.setTitle("Movimientos Facturados", for: .normal)
        button.setTitleColor(UIColor.defaultTheme.df, for: .normal)
        button.titleLabel?.font = UIFont(name: "PFBeauSansPro-Regular", size: 14)
        return button
    }()
    
    var selectorActualLineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.defaultTheme.active
        return view
    }()
    
     var collectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        let c = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        
        if let flowlayout = c.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.scrollDirection = .horizontal
        }
        c.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        c.backgroundColor = .white
        c.isPagingEnabled = true
        return c
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHD()

    }
    
    private func setupHD() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        selectorLastMov.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        selectorBillingMov.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc  func tapButton(_ sender: UIButton) {
        let index = abs(1000 - sender.tag)
        setMov(index)
    }
}


extension InitController:UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if indexPath.item == 0 {
            cell.backgroundColor = UIColor.defaultTheme.df
        } else {
             cell.backgroundColor = UIColor.white
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x  / view.frame.width
        print(index)
        setMov(Int(index))
    }
    
    private func setMov(_ index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        var x = 0
        let w = view.frame.width / 2
        
        if index == 1 {
            x = Int(view.frame.width / 2)
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            if index == 0 {
                self.selectorLastMov.setTitleColor(UIColor.defaultTheme.active, for: .normal)
                self.selectorBillingMov.setTitleColor(UIColor.defaultTheme.df, for: .normal)
            } else {
                self.selectorLastMov.setTitleColor(UIColor.defaultTheme.df, for: .normal)
                self.selectorBillingMov.setTitleColor(UIColor.defaultTheme.active, for: .normal)
            }
            
            self.selectorActualLineView.frame = CGRect(x: x,y: 0, width: Int(w), height: 3)
        })
    }

}
