//
//  CalendarMonthCell.swift
//  Family-Office
//
//  Created by Nan Montaño on 14/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import JTAppleCalendar
import Stevia

class CalendarMonthCell: UICollectionViewCell {
    var calendarView: JTAppleCalendarView!
    let monthFormatter = DateFormatter()
    let monthLabel = UILabelX()
    var events = [EventInstance]()
    var start: Date!
    var end: Date!
    
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
        monthFormatter.dateFormat = "MMM"
        calendarView = JTAppleCalendarView()
        sv(calendarView, monthLabel)
        
        layout(
            |monthLabel.height(20%)|,
            |calendarView.height(80%)|
        )
        
        calendarView.backgroundColor = UIColor().withAlphaComponent(0)
        monthLabel.textColor = UIColor.black
    }
    
    func bind(events: [EventInstance], start: Date, end: Date) {
        self.events = events
        self.start = start
        self.end = end
        monthLabel.text = start.string(with: monthFormatter)
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self
        calendarView.reloadData()
    }
}

extension CalendarMonthCell: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        calendar.register(CalendarDayCell.self, forCellWithReuseIdentifier: "cell")
        
        let parameters = ConfigurationParameters(startDate: start, endDate: end)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let dayCell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "cell", for: indexPath) as! CalendarDayCell
        let start = cellState.date.toMillis()!
        let end = cellState.date.add(days: 1).toMillis()!
        let range = start..<end
        let hasEvents = events.first(where: {
            return range.contains($0.start) || range.contains($0.end)
        })
        dayCell.bind(state: cellState, active: hasEvents != nil)
        return dayCell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    }
    
    
}
