//
//  MadlibTwoViewController.swift
//  SelfIntroduction
//
//  Created by Daniel Kwolek on 9/6/16.
//  Copyright © 2016 Arcore. All rights reserved.
//

import UIKit

class MadlibTwoViewController: UIViewController {
    @IBOutlet var storyTextView: UITextView!
    var noun: String?
    var adjective: String?
    var verb: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MadLibStory"
        if verb != nil || adjective != nil || noun != nil
        {
            storyTextView.text = "There once was a guy named Danny who was going to the \(noun!) store to buy some blue jeans. All of a sudden a \(adjective!) lizard came up and began to \(verb!) him! Danny quickly smacked the lizard because it was being reckless. Bad lizard. Danny got his jeans from the \(noun!) store and went home, all the while thinking about the lizard that liked to \(verb!)"
        } else
        {
            storyTextView.text = "Oh no, something went wrong with the story! try again!"
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

