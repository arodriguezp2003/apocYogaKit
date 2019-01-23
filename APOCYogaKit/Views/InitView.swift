//
//  InitView.swift
//  APOCYogaKit
//
//  Created by Alejandro  Rodriguez on 1/23/19.
//  Copyright © 2019 Alejandro  Rodriguez. All rights reserved.
//

import UIKit
import YogaKit

extension InitController {
        
     func setupView() {
        self.view.configureLayout { l in
            l.isEnabled = true
        }
        setupHeader()
        setupAccountInfoView()
        setupSelector()
        setupCollection()
        
        self.view.yoga.applyLayout(preservingOrigin: true)
    }
    
    private func setupHeader() {
        // Soporte para el header en iphone x....
        var paddignIphoneX =  0.0
        if Util.shared.isIphoneX() {
            paddignIphoneX = 20.0
        }
        
        let headerView = UIView()
        headerView.backgroundColor = .red
        headerView.configureLayout { (l) in
            l.isEnabled = true
            l.flexDirection = .row
            l.paddingTop = YGValue(floatLiteral: Float(paddignIphoneX))
            l.height = YGValue(floatLiteral: Float(65 + paddignIphoneX))
            l.width = YGValue(self.view.frame.width)
        }
        
        let leftHeader = UIView()
        leftHeader.backgroundColor = .white
        leftHeader.configureLayout { (l) in
            l.isEnabled = true
            l.width = 30
            l.height = 30
            l.marginTop = 26
            l.marginLeft = 8
            l.marginRight = 30
        }
        
        let rightHeader = UIView()
        rightHeader.backgroundColor = .white
        rightHeader.configureLayout { (l) in
            l.isEnabled = true
            l.width = 30
            l.height = 30
            l.marginTop = 26
            l.marginRight = 8
            l.marginLeft = 30
        }
        titleHeaderLabel.configureLayout { (l) in
            l.isEnabled = true
            l.flexGrow = 1
            l.height = 19
            l.marginTop = 34
        }
        
        headerView.addSubview(leftHeader)
        headerView.addSubview(titleHeaderLabel)
        headerView.addSubview(rightHeader)
        
        view.addSubview(headerView)
    }
    
    private func setupAccountInfoView() {
        let accountInfoView = UIView()
        accountInfoView.backgroundColor = .brown
        // si es iphone 5 = 150, en el caso de cualquier otro sacamnos la proporción para mantener la vista del diseño
        var heigth:Float = 150.0
        if !Util.shared.isIphone5s() {
            let screenPercentage = CGFloat(( 180 * 100) / 568)
            let h = CGFloat(self.view.frame.height)
            heigth = Float((h * screenPercentage) / 100.0)
        }
        
        accountInfoView.configureLayout {l in
            l.isEnabled = true
            l.justifyContent = .center
            l.height = YGValue(heigth)
        }
        
        let accountInfoDetailView = UIView()
        accountInfoDetailView.backgroundColor = .yellow
        accountInfoDetailView.configureLayout {l in
            l.isEnabled = true
            l.height = 74
            l.marginLeft = 40
            l.marginRight = 40
            l.flexDirection = .row
        }
        
        
        let detailLeft = UIView()
        detailLeft.backgroundColor = .red
        detailLeft.configureLayout {l in
            l.isEnabled = true
            l.flexGrow = 1
            l.flexBasis = 0
            l.justifyContent = .center
        }
        
        usedLabel.configureLayout { l in
            l.isEnabled = true
        }
        detailLeft.addSubview(usedLabel)
        
        let usedTextLabel = UILabel()
        usedTextLabel.text = "Utilizado"
        usedTextLabel.textColor = .white
        usedTextLabel.textAlignment = .center
        usedTextLabel.font = UIFont.systemFont(ofSize: 12)
        usedTextLabel.configureLayout { l in
            l.isEnabled = true
        }
        
        detailLeft.addSubview(usedTextLabel)
        
        let detailCenter = UIView()
        detailCenter.backgroundColor = .black
        detailCenter.configureLayout {l in
            l.isEnabled = true
            l.width = 2
            
        }
        
        let detailRight = UIView()
        detailRight.backgroundColor = .red
        detailRight.configureLayout {l in
            l.isEnabled = true
            l.flexGrow = 1
            l.flexBasis = 0
            l.justifyContent = .center
            
        }
        
        availableLabel.configureLayout { l in
            l.isEnabled = true
        }
        detailRight.addSubview(availableLabel)
        
        let availableTextLabel = UILabel()
        availableTextLabel.text = "Disponible"
        availableTextLabel.textColor = .white
        availableTextLabel.textAlignment = .center
        availableTextLabel.font = UIFont.systemFont(ofSize: 12)
        availableTextLabel.configureLayout { l in
            l.isEnabled = true
        }
        
        detailRight.addSubview(availableTextLabel)
        
        accountInfoDetailView.addSubview(detailLeft)
        accountInfoDetailView.addSubview(detailCenter)
        accountInfoDetailView.addSubview(detailRight)
        accountInfoView.addSubview(accountInfoDetailView)
        view.addSubview(accountInfoView)
    }
    
    
    private func setupSelector() {
        let selectorView = UIView()
        selectorView.backgroundColor = .blue
        selectorView.configureLayout {l in
            l.isEnabled = true
            l.height = 55
            l.flexDirection = .row
        }
        
        selectorLastMov.configureLayout {l in
            l.isEnabled = true
            l.height = 55
            l.flexGrow = 1
            l.flexBasis = 0
        }
        selectorView.addSubview(selectorLastMov)
        
        selectorBillingMov.configureLayout {l in
            l.isEnabled = true
            l.height = 55
            l.flexBasis = 0
            l.flexGrow = 1
        }
        selectorView.addSubview(selectorBillingMov)
        
        view.addSubview(selectorView)
        
        let selectorLineView = UIView()
        selectorLineView.backgroundColor = .gray
        selectorLineView.configureLayout {l in
            l.isEnabled = true
            l.height = 3
        }
        
        let p = self.view.frame.width / 2
        selectorActualLineView.configureLayout { l in
            l.isEnabled = true
            l.height = 3
            l.width = YGValue(p)
        }
       selectorLineView.addSubview(selectorActualLineView)
       view.addSubview(selectorLineView)
    }
    
    private func setupCollection() {
        
        collectionView.configureLayout {l in
            l.isEnabled = true
            l.flexGrow = 1
        }
        view.addSubview(collectionView)
    }
}
