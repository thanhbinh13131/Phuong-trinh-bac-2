//
//  ViewController.swift
//  ptBac2
//
//  Created by admin25 on 4/8/17.
//  Copyright © 2017 admin25. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var a: UITextField!
    
    @IBOutlet weak var b: UITextField!
    
    @IBOutlet weak var c: UITextField!
    
    @IBOutlet weak var x1: UILabel!

    @IBOutlet weak var x2: UILabel!
    
    @IBOutlet weak var voNghiem: UILabel!
    
    @IBOutlet weak var nghiem1Label: UILabel!
    
    @IBOutlet weak var nghiem2Label: UILabel!
    
    
    var numA:Int = 0
    var numB:Int = 0
    var numC:Int = 0
    
    var deltaCan:Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func textFieldDidChange(textField: UITextField) {
        if (a.text == "" || b.text == "" || c.text == "") {
            //Disable button
        }else{
            //Enable button
        }
    }
    func resetText(){
        nghiem1Label.text = ""
        voNghiem.backgroundColor = UIColor.clear
        nghiem2Label.text = ""
        x1.text = ""
        x2.text = ""
    }
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    @IBAction func Giai(_ sender: Any) {
        
        if(!isStringAnInt(string: a.text!)){
            voNghiem.text = "Hay nhap a la so nguyen nhe!"
           resetText()
            return
        }
        if(!isStringAnInt(string: b.text!)){
            voNghiem.text = "Hay nhap b la so nguyen nhe!"
            resetText()
            return
        }
        if(!isStringAnInt(string: c.text!)){
            voNghiem.text = "Hay nhap c la so nguyen nhe!"
           resetText()
            return
        }
        if(a.text == ""){
            return
        }
        
        
        numA = Int(a.text!)!
        numB = Int(b.text!)!
        numC = Int(c.text!)!

        
        
        let delta:Double = Double(numB*numB - 4*numA*numC)
        
        deltaCan = delta.squareRoot()
        if(numA == 0){
            if(numB == 0){
                if(numC == 0){
                    voNghiem.text = "Phuong trinh co vo so nghiem nhe!"
                    resetText()
                }
                else{
                    voNghiem.text = "Phuong trinh vo nghiem nhe!!"
                    resetText()
                }
               
            }
            else{
                
                voNghiem.text = "Phuong trinh co 1 nghiem!"
                
                let n1:Double = ((Double(-numC)) / Double(numB))
                
                nghiem1Label.text = "Nghiem:"
                nghiem2Label.text = ""
                x1.text = String(n1)
                x2.text = ""

            }
                    }
        else{
            if(delta < 0){
                voNghiem.text = "Phuong trinh vo nghiem nhe!"
                resetText()
            }
            else{
                if(delta == 0){
                    voNghiem.text = "Phuong trinh co nghiem kep nhe!"
                    voNghiem.textColor = UIColor.blue
                    voNghiem.backgroundColor = UIColor.white
                    
                    nghiem1Label.text = "Nghiem:"
                    nghiem2Label.text = ""
                    
                    let n1:Double = ((Double(-numB) - deltaCan) / Double(2*numA))
                    
                    x1.text = String(n1)
                    
                    
                   

                }
                else{
                    voNghiem.text = "Phuong trinh co 2 nghiem phan biet nhe!"
                    voNghiem.textColor = UIColor.brown
                    voNghiem.backgroundColor = UIColor.white
                    
                    nghiem1Label.text = "Nghiem 1:"
                    nghiem2Label.text = "Nghiem 2:"
                    
                    let n1:Double = ((Double(-numB) - deltaCan) / Double(2*numA))
                    let n2:Double = ((Double(-numB) + deltaCan) / Double(2*numA))
                    
                    
                    x1.text = String(n1)
                    x2.text = String(n2)

                    
                }
            }
        }
    }
}

