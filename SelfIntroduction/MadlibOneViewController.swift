//
//  MadlibOneViewController.swift
//  SelfIntroduction
//
//  Created by Daniel Kwolek on 9/6/16.
//  Copyright © 2016 Arcore. All rights reserved.
//

import UIKit

class MadlibOneViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var generateStoryButton: UIButton!
    @IBOutlet var textFieldMain: UITextField!
    @IBOutlet var textViewMain: UITextView!
    var adjective: String?
    var noun: String?
    var verb: String?
    var buttonCount = 0
    let abcs: CharacterSet = CharacterSet.init(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MadLib"
        textFieldMain.delegate = self
        textViewMain.text = "Adjective: \(adjective ?? "") \nNoun: \(noun ?? "") \nVerb: \(verb ?? "")"
        generateStoryButton.isHidden = true
        if adjective == nil
        {
            buttonCount = 0
            textFieldMain.text = ""
            textFieldMain.placeholder = "Please enter an adjective"
        } else if noun == nil
        {
            buttonCount = 1
            textFieldMain.text = ""
            textFieldMain.placeholder = "Please enter a noun"
        } else if verb == nil
        {
            buttonCount = 2
            textFieldMain.text = ""
            textFieldMain.placeholder = "Please enter a verb"
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillLayoutSubviews() {
        if adjective != nil && noun != nil && verb != nil
        {
            generateStoryButton.isHidden = false
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textFieldMain.text = textFieldMain.text?.components(separatedBy: abcs.inverted).joined(separator: "")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! MadlibTwoViewController
        destination.noun = noun
        destination.verb = verb
        destination.adjective = adjective
    }
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender != generateStoryButton
        {
            switch buttonCount{
            case 0:
                let temp = textFieldMain.text! as NSString
                if temp.length > 0
                {
                    adjective = textFieldMain.text?.components(separatedBy: abcs.inverted).joined(separator: "")
                    buttonCount += 1
                    textFieldMain.text = ""
                    textFieldMain.placeholder = "Please enter a noun"
                }
                break
            case 1:
                let temp = textFieldMain.text! as NSString
                if temp.length > 0
                {
                    noun = textFieldMain.text?.components(separatedBy: abcs.inverted).joined(separator: "")
                    buttonCount += 1
                    textFieldMain.text = ""
                    textFieldMain.placeholder = "Please enter a verb"
                }
                break
            case 2:
                let temp = textFieldMain.text! as NSString
                if temp.length > 0
                {
                    verb = textFieldMain.text?.components(separatedBy: abcs.inverted).joined(separator: "")
                    textFieldMain.text = ""
                    textFieldMain.placeholder = "Press the button to reset"
                    buttonCount += 1
                }
                break
            case 3:
                adjective = nil
                noun = nil
                verb = nil
                textFieldMain.text = ""
                textViewMain.text = ""
                textFieldMain.placeholder = "Please enter an adjective"
                buttonCount = 0
                break
            default: break
            }
            textViewMain.text = "Adjective: \(adjective ?? "") \nNoun: \(noun ?? "") \nVerb: \(verb ?? "")"
        }
    }
    
}
