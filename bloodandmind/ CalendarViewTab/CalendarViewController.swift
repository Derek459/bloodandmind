//
//  CalendarViewController.swift
//  bloodandmind
//
//  Created by Lin Derek on 2023/8/13.
//

import UIKit

class CalendarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurCalendarView()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var addbtn: UIImageView!
    private func configurCalendarView(){
        let calendarView = UICalendarView()
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.fontDesign = .rounded
        calendarView.layer.cornerRadius = 15
        
        let dateSelection = UICalendarSelectionSingleDate(delegate:self)
        calendarView.selectionBehavior = dateSelection
        calendarView.delegate = self
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendarView)
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calendarView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            calendarView.heightAnchor.constraint(equalToConstant: 300)
        
        
        
        ])
    }
}

extension CalendarViewController:UICalendarViewDelegate,UICalendarSelectionSingleDateDelegate{
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        
    }
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        return .customView{
            let smileFace = UILabel()
            smileFace.text = "🟢😃"
            return smileFace
        }
    }
}
