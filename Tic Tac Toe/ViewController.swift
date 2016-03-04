//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Hanniel C. Malonzo on 2/26/16.
//  Copyright © 2016 Hanniel C. Malonzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{


    @IBOutlet weak var square1: UIImageView!
    @IBOutlet weak var square2: UIImageView!
    @IBOutlet weak var square3: UIImageView!
    @IBOutlet weak var square4: UIImageView!
    @IBOutlet weak var square5: UIImageView!
    @IBOutlet weak var square6: UIImageView!
    @IBOutlet weak var square7: UIImageView!
    @IBOutlet weak var square8: UIImageView!
    @IBOutlet weak var square9: UIImageView!
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch4: UISwitch!
    
    var imageDictionary = [UIImageView:Int]()
    var currentTurn = true
    var BGLogo = UIImage(named: "BGLogo0")
    var JHLogo = UIImage(named: "JHLogo1")
    var x = UIImage(named: "GoodSquare")
    var o = UIImage(named: "GoodCircle")
    var currentX: UIImage!
    var currentO: UIImage!
    var blank = UIImage(named: "White_square")
    var winner = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imageDictionary = [square1:0,square2:0,square3:0,square4:0,square5:0,square6:0,square7:0,square8:0,square9:0]
        for image in imageDictionary
        {
            image.0.image = blank
        }
        self.view.backgroundColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        topLabel.text = "Current Turn: Player One"
        currentX = BGLogo
        currentO = JHLogo
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        if switch4.on
        {
            var point = sender.locationInView(self.view)
            topLabel.center = CGPointMake(point.x, point.y)
            for var image in imageDictionary
            {
                if CGRectContainsPoint(image.0.frame, point)
                {
                    topLabel.text = String(imageDictionary[image.0]!)
                }
            }
        }
    }
    
    @IBAction func whenTapped(sender: UITapGestureRecognizer)
    {
        let pointer = sender.locationInView(self.view)
        
        for var image in imageDictionary
        {
            if CGRectContainsPoint(image.0.frame, pointer)
            {
                if currentTurn == true
                {
                    if image.0.image == blank
                    {
                        imageDictionary[image.0] = 1
                        image.0.image = currentX
                        currentTurn = !currentTurn
                        pingValues()
                        checkForWin()
                        newColor()
                        topLabel.text = "Current Turn: Player Two"
                    }
                }
                else
                {
                    if image.0.image == blank
                    {
                        imageDictionary[image.0] = 2
                        image.0.image = currentO
                        currentTurn = !currentTurn
                        pingValues()
                        checkForWin()
                        newColor()
                        topLabel.text = "Current Turn: Player One"
                    }
                }
            }
        }
    }
    
    func checkForWin()
    {
        /* 3x3 win combos */
        //123
        //456
        //789
        //147
        //258
        //369
        //159
        //357
        if
            //Player 1 wins
            (imageDictionary[square1] == 1 && imageDictionary[square2] == 1 && imageDictionary[square3] == 1) ||
            (imageDictionary[square4] == 1 && imageDictionary[square5] == 1 && imageDictionary[square6] == 1) ||
            (imageDictionary[square7] == 1 && imageDictionary[square8] == 1 && imageDictionary[square9] == 1) ||
            (imageDictionary[square1] == 1 && imageDictionary[square4] == 1 && imageDictionary[square7] == 1) ||
            (imageDictionary[square2] == 1 && imageDictionary[square5] == 1 && imageDictionary[square8] == 1) ||
            (imageDictionary[square3] == 1 && imageDictionary[square6] == 1 && imageDictionary[square9] == 1) ||
            (imageDictionary[square3] == 1 && imageDictionary[square5] == 1 && imageDictionary[square7] == 1) ||
            (imageDictionary[square1] == 1 && imageDictionary[square5] == 1 && imageDictionary[square9] == 1)
        {
            winner = 1
            let alert = UIAlertController(title: "Player \(winner) won!", message: "Resetting Game...", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "OK", style: .Default, handler:
                {
                    sender in
                    self.resetGame()
            })
            alert.addAction(ok)
            presentViewController(alert, animated: true, completion: nil)
        }
        else if
            //Player 2 wins
            (imageDictionary[square1] == 2 && imageDictionary[square2] == 2 && imageDictionary[square3] == 2) ||
            (imageDictionary[square4] == 2 && imageDictionary[square5] == 2 && imageDictionary[square6] == 2) ||
            (imageDictionary[square7] == 2 && imageDictionary[square8] == 2 && imageDictionary[square9] == 2) ||
            (imageDictionary[square1] == 2 && imageDictionary[square4] == 2 && imageDictionary[square7] == 2) ||
            (imageDictionary[square2] == 2 && imageDictionary[square5] == 2 && imageDictionary[square8] == 2) ||
            (imageDictionary[square3] == 2 && imageDictionary[square6] == 2 && imageDictionary[square9] == 2) ||
            (imageDictionary[square3] == 2 && imageDictionary[square5] == 2 && imageDictionary[square7] == 2) ||
            (imageDictionary[square1] == 2 && imageDictionary[square5] == 2 && imageDictionary[square9] == 2)
        {
            winner = 2
            let alert = UIAlertController(title: "Player \(winner) won!", message: "Resetting Game...", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "OK", style: .Default, handler:
                {
                    sender in
                    self.resetGame()
            })
            alert.addAction(ok)
            presentViewController(alert, animated: true, completion: nil)
        }
        else if
            (imageDictionary[square1]! > 0) && (imageDictionary[square2]! > 0) && (imageDictionary[square3]! > 0) &&
            (imageDictionary[square4]! > 0) && (imageDictionary[square5]! > 0) && (imageDictionary[square6]! > 0) &&
            (imageDictionary[square7]! > 0) && (imageDictionary[square8]! > 0) && (imageDictionary[square9]! > 0)
        {
            let alert = UIAlertController(title: "No one won.", message: "Resetting Game...", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "OK", style: .Default, handler:
                {
                    sender in
                    self.resetGame()
            })
            alert.addAction(ok)
            presentViewController(alert, animated: true, completion: nil)
        }
    
    }
    func pingValues()
    {
        for image in imageDictionary
        {
            print(imageDictionary[image.0])
        }

    }
    func resetGame()
    {
        for image in imageDictionary
        {
            image.0.image = blank
            imageDictionary[image.0] = 0
            winner = 0
            currentTurn = true
            topLabel.text = "Current Turn: Player One"
        }
    }
    func newColor()
    {
        if switch2.on
        {
            self.view.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
        }
    }
    
    func AIMove()
    {
        if switch1.on
        {
            //insert AI here
        }
    }
    
    //switches
        //AI toggle
        //random color toggle
        //XO or School Logo toggle
        //Pan Label Toggle
    
    @IBAction func whenSwitch1Toggle(sender: UISwitch) {
    }
    
    @IBAction func whenSwitch2Toggle(sender: UISwitch) {
    }
    
    @IBAction func whenSwitch3Toggle(sender: UISwitch) {
        if switch3.on
        {
            self.currentX = BGLogo
            self.currentO = JHLogo
            resetGame()
        }
        else
        {
            self.currentX = self.x
            self.currentO = self.o
            resetGame()
        }
    }
    
    @IBAction func whenSwitch4Toggle(sender: UISwitch) {
    }
    
    
}

