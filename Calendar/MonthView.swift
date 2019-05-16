//
//  MonthView.swift
//  Calendar
//
//  Created by Ortega, Grace A on 5/10/19.
//  Copyright © 2019 3BMAD. All rights reserved.
//

import UIKit

protocol MonthViewDelegate: AnyClass {
    func didChangeMonth(monthIndex: Int, year: Int)
}

class MonthView: UIView {
    var monthsArray = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var currentMonthIndex = 0
    var currentYear: Int = 0
    var delegate: MonthViewDelegate?
    
    override init(frame: frame) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        
        setupViews()
        
        btnLeft.isEnabled=false
    }
    
    @objc func btnLeftRightAction(sender: UIButton) {
        if sender ==  btnRight {
            currentMonthIndex += 1
            if currentMonthIndex > 11 {
                currentMonthIndex = 0
                currentYear += 1
            }
        } else {
            currentMonthIndex -= 1
            if currentMonthIndex < 0 {
                currentMonthIndex = 11
                currentYear -= 1
            }
        }
        lblName.text="\(monthsArray[currentMonthIndex]) \(currentYear)"
        delegate?.didChangeMonth(monthIndex: currentMonthIndex, year: currentYear)
    }
    
    func setupViews() {
        self.addSubView(lblName)
        lblName.topAnchor.constraint(equalTo: topAnchor).isActive=true
        lblName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive=true
        lblName.widthAnchor.constraint(equalToConstant: 150).isActive=true
        lblName.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
        lblName.text="\(monthsArray[currentMonthIndex]) \(currentYear)"
        
        self.addSubview(btnRight)
        btnRight.topAnchor.constraint(equalTo: topAnchor).isActive=true
        btnRight.centerXAnchor.constraint(equalTo: centerXAnchor).isActive=true
        btnRight.widthAnchor.constraint(equalToConstant: 50).isActive=true
        btnRight.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
        
        self.addSubview(btnLeft)
        btnLeft.topAnchor.constraint(equalTo: topAnchor).isActive=true
        btnLeft.centerXAnchor.constraint(equalTo: centerXAnchor).isActive=true
        btnLeft.widthAnchor.constraint(equalToConstant: 50).isActive=true
        btnLeft.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
    }
    
    let lblName: UILabel = {
        let lbl=UILabel()
        lbl.text="Default Month Year Text"
        lbl.textColor = Style.monthViewLblColor //Style is gonna work later- not implemented yet
        lbl.textAlignment = .center
        lbl.font=UIFont.boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let btnRight: UIButton = {
        let btn=UIButton()
        btn.setTitle(">", for: .normal)
        btn.setTitleColor(Style.monthViewBtnRightColor, for: .normal) //Style
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnLeftRightAction(sender:)), for: touchUpInside)
        return btn
    }()
    
    let btnLeft: UIButton = {
        let btn = UIButton()
        btn.setTitle("<", for: .normal)
        btn.setTitleColor(Style.monthViewBtnLeftColor, for: .normal) //Style
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnLeftRightAction(sender:)), for: touchUpInside)
        btn.setTitleColor(UIColor.lightGray, for: .disabled)
        return btn
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
