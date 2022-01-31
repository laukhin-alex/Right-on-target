//
//  ViewController.swift
//  Right on target
//
//  Created by Александр on 28.01.2022.
//

import UIKit

class ViewController: UIViewController {

    var number: Int = 0
    var round: Int = 1
    var points: Int = 0

    override func loadView() {
        super.loadView()
        print("loadView")
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }



    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!

    @IBAction func checkNumber() {
        let numSlide = Int(self.slider.value)
        if numSlide > self.number {
            self.points += 50 - numSlide + self.number
        } else if numSlide < self.number {
            self.points += 50 + numSlide - self.number
        } else {
            self.points += 50
        }
        if self.round == 5 {
            let alert = UIAlertController(title: "Game over",
                                          message: "You have owned \(self.points)",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Start again?",
                                               style: .default,
                                               handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0

        } else {
            self.round += 1
        }
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
    }

    lazy var secondViewController: SecondViewController = getSecondViewController()
    private func getSecondViewController() -> SecondViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController")
        return viewController as! SecondViewController
    }
}

