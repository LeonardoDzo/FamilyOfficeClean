//
//  CreateEventController.swift
//  Family-Office
//
//  Created by Nan Montaño on 16/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Eureka
import RxSwift
import RxCocoa

class CreateEventController: FormViewController {
    let disposeBag = DisposeBag()
    var viewModel: CreateEventViewModel!
    let event = BehaviorRelay(value: Event())
    let recurrence = BehaviorRelay<String?>(value: nil)
    let valid = BehaviorRelay(value: false)
    
    var startTag = UUID().uuidString
    var endTag = UUID().uuidString
    var startTimeTag = UUID().uuidString
    var endTimeTag = UUID().uuidString
    var allDayTag = UUID().uuidString

    override func viewDidLoad() {
        super.viewDidLoad()
        
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.form.removeAll()
            self.startTag = UUID().uuidString
            self.endTag = UUID().uuidString
            self.startTimeTag = UUID().uuidString
            self.endTimeTag = UUID().uuidString
            self.allDayTag = UUID().uuidString
            self.setupView()
        }
        self.setupView()
    }
    
    func editEvent(_ mutate: (inout Event) -> Void) {
        var ev = self.event.value
        mutate(&ev)
        self.event.accept(ev)
//        print(ev)
        syncForm(event: ev)
        valid.accept(form.validate().count == 0)
    }
    
    func syncForm(event: Event) {
        var values = form.values()
        let start = Date(event.instances[0].start)
        let end = Date(event.instances[0].end)
        var changed = false
        if let date = values[startTag] as? Date, start != date {
            values[startTag] = start
            changed = true
        }
        if let date = values[endTag] as? Date, end != date {
            values[endTag] = end
            changed = true
        }
        if let date = values[startTimeTag] as? Date, start != date {
            values[startTimeTag] = start
            changed = true
        }
        if let date = values[endTimeTag] as? Date, end != date {
            values[endTimeTag] = end
            changed = true
        }
        if changed {
            form.setValues(values)
        }
    }
    
    func setupView() {
        // view
        let saveBtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
        navigationItem.rightBarButtonItem = saveBtn
        
        form +++ Section()
            <<< TextRow() { row in
                row.title = "Nombre del evento"
                row.value = event.value.summary
                row.add(rule: RuleRequired())
            }.onChange{ row in
                self.editEvent {
                    $0.summary = row.value ?? ""
                }
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.textLabel?.textColor = .red
                }
            }
            <<< TextAreaRow() { row in
                row.placeholder = "Descripción"
                row.value = event.value.description
            }.onChange({ row in
                self.editEvent {
                    $0.description = row.value ?? ""
                }
            })
            <<< CheckRow() { row in
                row.title = "Todo el día"
                row.tag = allDayTag
                row.value = event.value.instances[0].allDay
                }.onChange({ row in
                    self.editEvent {
                        var inst = $0.instances.first!
                        inst.allDay = row.value ?? false
                        if inst.allDay {
                            let start = Date(inst.start)!.startOfDay()
                            let end = Date(inst.end)!.startOfDay()
                            inst.start = start.toMillis()
                            inst.end = end.toMillis()
                        }
                        $0.instances = [inst]
                    }
                })
            <<< DateRow() { row in
                row.title = "Inicio"
                row.tag = startTag
                row.value = Date(event.value.instances[0].start)
                row.add(rule: RuleRequired())
            }.onChange({ row in
                self.editEvent {
                    var inst = $0.instances.first!
                    inst.start = row.value!.toMillis()
                    $0.instances = [inst]
                }
            })
            <<< TimeRow() { row in
                row.title = "Hora inicial"
                row.value = Date(event.value.instances[0].start)
                row.tag = startTimeTag
                row.hidden = Condition.function([allDayTag], {form in
                    return form.values()[self.allDayTag] as! Bool
                })
                row.add(rule: RuleRequired())
                }.onChange { row in
                    self.editEvent {
                        var inst = $0.instances.first!
                        inst.start = row.value!.toMillis()
                        $0.instances = [inst]
                    }
                }
            <<< DateRow() { row in
                row.title = "Fin"
                row.tag = endTag
                row.value = Date(event.value.instances[0].end)
                row.add(rule: RuleRequired())
                let ruleClosure = RuleClosure<Date>(closure: { value in
                    return value!.toMillis() < self.event.value.instances.first!.start
                        ? ValidationError(msg: "Fin del evento no puede ser mayor que el inicio")
                        : nil
                })
                row.add(rule: ruleClosure)
            }.onChange({ row in
                self.editEvent {
                    var inst = $0.instances.first!
                    inst.end = row.value!.toMillis()
                    $0.instances = [inst]
                }
            }).cellUpdate { cell, row in
                if !row.isValid {
                    cell.textLabel?.textColor = .red
                }
            }
            <<< TimeRow() { row in
                row.title = "Hora de terminación"
                row.value = Date(event.value.instances[0].end)
                row.tag = endTimeTag
                row.hidden = Condition.function([allDayTag], {form in
                    return form.values()[self.allDayTag] as! Bool
                })
                row.add(rule: RuleRequired())
            }.onChange { row in
                self.editEvent {
                    var inst = $0.instances.first!
                    inst.end = row.value!.toMillis()
                    $0.instances = [inst]
                }
            }
            <<< PushRow<String>() { row in
                row.title = "Repetir"
                row.options = ["Nunca", "Cada día", "Todas las semanas", "Cada 2 semanas", "Cada mes", "Cada año"]
                }.onChange { row in
//                    switch row.options.index(of: row.value) {
//                    case 0: recurrence.accept(nil) break
//                    case 1: recurrence.accept(rrule(.daily).)
//                    default: break
//                    }
                }
        
        // model
        let input = CreateEventViewModel.Input(
            valid: valid.asDriver(),
            event: event.asDriver(),
            submit: saveBtn.rx.tap.asDriver()
        )
        let output = viewModel.transform(input: input)
        output.enabled.drive(saveBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        output.created.drive().disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
