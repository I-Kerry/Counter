//
//  ViewController.swift
//  Counter
//
//  Created by Kirill Maidanovich on 12.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private var count = 0
    
    private var dateFormat = DateFormatter()
    
    @IBOutlet private weak var counter: UILabel!
        
    @IBOutlet private weak var plusOne: UIButton!
    
    @IBOutlet private weak var minusOne: UIButton!
    
    @IBOutlet private weak var resetButton: UIButton!
    
    
    @IBOutlet private weak var changeHistory: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        plusOne.backgroundColor = .white
        minusOne.backgroundColor = .white
        plusOne.tintColor = .red
        minusOne.tintColor = .blue
        counter.backgroundColor = .lightGray
        counter.textColor = .white
        counter.highlightedTextColor = .red
        
        dateFormat.dateFormat = "dd.MM.yy HH:mm"
        
    }
    
    @IBAction private func clickOnPlus(_ sender: Any) {
        count += 1
        counter.text = "Значение счетчика: \(count)"
        changeHistoryFunction("значение изменено на +1")
    }
    
    @IBAction private func clickOnMinus(_ sender: Any) {
        if count != 0 {
            count -= 1; changeHistoryFunction("значение изменено на -1")
        } else {
            changeHistoryFunction("попытка уменьшить значение счётчика ниже 0")
        }
        counter.text = "Значение счетчика: \(count)"
    }
    
    @IBAction private func reset(_ sender: Any) {
        count = 0
        counter.text = "Значение счетчика: \(count)"
        changeHistoryFunction("значение сброшено")
    }
    
    private func changeHistoryFunction(_ note: String) {
        let time = dateFormat.string(from: Date())
        changeHistory.text = changeHistory.text + "[\(time)]:\(note)"
    }
    
}
