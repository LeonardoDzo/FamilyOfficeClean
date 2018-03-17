//
//  CalendarDayCell.swift
//  Family-Office
//
//  Created by Nan Montaño on 15/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import JTAppleCalendar
import Stevia

class CalendarDayCell: JTAppleCell {
    var label = UILabelX()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        sv(label)
        
        label.width(90%)
        label.Height == label.Width
        label.centerInContainer()
        
        label.font = UIFont.systemFont(ofSize: 9)
        label.textAlignment = .center
        label.cornerRadius = self.bounds.width/2
        label.clipsToBounds = true
    }
    
    func bind(state: CellState, active: Bool) {
        if state.dateBelongsTo == .thisMonth {
            label.text = state.text
        } else {
            label.text = ""
        }
        if active {
            label.backgroundColor = MODULE.CALENDAR.color
            label.textColor = UIColor.white
        } else {
            label.backgroundColor = UIColor.clear
            label.textColor = UIColor.black
        }
    }
}
