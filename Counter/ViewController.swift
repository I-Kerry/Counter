//
//  ViewController.swift
//  Counter
//
//  Created by Kirill Maidanovich on 12.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    var dateFormat = DateFormatter()
    
    @IBOutlet weak var counter: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var plusOne: UIButton!
    
    @IBOutlet weak var minusOne: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    
    @IBOutlet weak var changeHistory: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        plusOne.backgroundColor = .white
        minusOne.backgroundColor = .white
        plusOne.tintColor = .red
        minusOne.tintColor = .blue
        counter.backgroundColor = .lightGray
        counter.textColor = .white
        counter.highlightedTextColor = .red
        
        dateFormat.dateFormat = "dd.MM.yy HH:mm"
        
        
    }

    @IBAction func clickOnButton(_ sender: Any) {
        count += 1
        counter.text = "Значение счетчика: \(count)"
    }
    
    @IBAction func clickOnPlus(_ sender: Any) {
        count += 1
        counter.text = "Значение счетчика: \(count)"
        changeHistoryFunction("значение изменено на +1")
    }
    
    @IBAction func clickOnMinus(_ sender: Any) {
        if count != 0 {
            count -= 1; changeHistoryFunction("значение изменено на -1")
        } else {
            changeHistoryFunction("попытка уменьшить значение счётчика ниже 0")
        }
        counter.text = "Значение счетчика: \(count)"
    }
    
    @IBAction func reset(_ sender: Any) {
        count = 0
        counter.text = "Значение счетчика: \(count)"
        changeHistoryFunction("значение сброшено")
    }
    
    func changeHistoryFunction(_ note: String) {
        let time = dateFormat.string(from: Date())
        changeHistory.text = "[\(time)]:\(note)"
    }
    
}
