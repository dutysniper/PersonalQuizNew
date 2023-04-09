//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet private weak var emojiLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    //MARK: Internal propeties
    var answers: [Answer]!
    
    //MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: Private methods
    private func showResult(answers: [Answer]) -> Animal? {
        let finalAnimal = Dictionary(grouping: answers, by: { $0.animal })
                .sorted(by: { $0.value.count > $1.value.count }).first?.key
        return finalAnimal
    }
    
    private func updateUI() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        emojiLabel.text = "Вы - " + String(showResult(answers: answers)?.rawValue ?? " ")
        descriptionLabel.text = String(showResult(answers: answers)?.definition ?? "")
    }
    
    //MARK: IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    //MARK: deinit method
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
