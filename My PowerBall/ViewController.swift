//
//  ViewController.swift
//  My PowerBall
//
//  Created by suncihai on 16/1/28.
//  Copyright © 2016年 suncihai. All rights reserved.
//

import UIKit

enum GroupError:ErrorType{
    case OutOfSum
    case WrongOddEven
    case NullInput
}

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var Box1:UIImageView!
    @IBOutlet weak var Box2:UIImageView!
    @IBOutlet weak var Box3:UIImageView!
    @IBOutlet weak var Box4:UIImageView!
    @IBOutlet weak var Box5:UIImageView!
    @IBOutlet weak var Box6:UIImageView!
    
    @IBOutlet weak var WhiteBall1:UIImageView!
    @IBOutlet weak var WhiteBall2:UIImageView!
    @IBOutlet weak var WhiteBall3:UIImageView!
    @IBOutlet weak var WhiteBall4:UIImageView!
    @IBOutlet weak var WhiteBall5:UIImageView!
    @IBOutlet weak var RedBall:UIImageView!
    
    @IBOutlet weak var arrow1:UIImageView!
    @IBOutlet weak var arrow2:UIImageView!
    @IBOutlet weak var arrow3:UIImageView!
    @IBOutlet weak var arrow4:UIImageView!
    @IBOutlet weak var arrow5:UIImageView!
    
    @IBOutlet weak var RollButton:UIButton!
    @IBOutlet weak var CLearButton:UIButton!
    @IBOutlet weak var SaveButton:UIButton!
    
    @IBOutlet weak var MinValueLabel:UILabel!
    @IBOutlet weak var MaxValueLabel:UILabel!
    
    @IBOutlet weak var OddNumberLabel:UILabel!
    @IBOutlet weak var EvenNumberLabel:UILabel!
    
    @IBOutlet weak var slider:UISlider!
    
    var WhiteBallArray:[String]=["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69"]
    var WhiteBallImageArray:[String]=["W1.png","W2.png","W3.png","W4.png","W5.png","W6.png","W7.png","W8.png","W9.png","W10.png","W11.png","W12.png","W13.png","W14.png","W15.png","W16.png","W17.png","W18.png","W19.png","W20.png","W21.png","W22.png","W23.png","W24.png","W25.png","W26.png","W27.png","W28.png","W29.png","W30.png","W31.png","W32.png","W33.png","W34.png","W35.png","W36.png","W37.png","W38.png","W39.png","W40.png","W41.png","W42.png","W43.png","W44.png","W45.png","W46.png","W47.png","W48.png","W49.png","W50.png","W51.png","W52.png","W53.png","W54.png","W55.png","W56.png","W57.png","W58.png","W59.png","W60.png","W61.png","W62.png","W63.png","W64.png","W65.png","W66.png","W67.png","W68.png","W69.png",]
    var RedBallArray:[String]=["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26"]
    var RedBallImageArray:[String]=["R1.png","R2.png","R3.png","R4.png","R5.png","R6.png","R7.png","R8.png","R9.png","R10.png","R11.png","R12.png","R13.png","R14.png","R15.png","R16.png","R17.png","R18.png","R19.png","R20.png","R21.png","R22.png","R23.png","R24.png","R25.png","R26.png"]
    
    var PowerBallArray:[Int]=[0,0,0,0,0]
    var RedBallNumber=0
    
    var BallSumLowerValue:Int=90
    var BallSumUpperValue:Int=240
    
    var OddNumber=2
    var EvenNumber=3
    
    let rangeSilder = RangeSlider(frame: CGRectZero)
    
    var WhiteBallpickerView:UIPickerView!
    var RedBallpickerView:UIPickerView!
    
    var WhiteBallPickerArray:[String]=["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69"]
    var RedBallPickerArray:[String]=["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26"]
    var PowerBallStringArray:[String]=["0"]

    var PowerBallList=[["W4.png","W9.png","W24.png","W38.png","W54.png","R8.png"]]
    
    
    var WhiteBall1Switch=false
    var WhiteBall2Switch=false
    var WhiteBall3Switch=false
    var WhiteBall4Switch=false
    var WhiteBall5Switch=false
    
    var WhiteBall1Valued=false
    var WhiteBall2Valued=false
    var WhiteBall3Valued=false
    var WhiteBall4Valued=false
    var WhiteBall5Valued=false
    
    var WhiteBallPickerLock=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.Box1.image=UIImage(named: "Ballbox.png")
        self.Box2.image=UIImage(named: "Ballbox.png")
        self.Box3.image=UIImage(named: "Ballbox.png")
        self.Box4.image=UIImage(named: "Ballbox.png")
        self.Box5.image=UIImage(named: "Ballbox.png")
        self.Box6.image=UIImage(named: "Ballbox.png")
        
        rangeSilder.trackHighlightTintColor = UIColor.orangeColor()
        
        view.addSubview(rangeSilder)
        
        rangeSilder.addTarget(self, action: "rangeSliderValueChanged:", forControlEvents: .ValueChanged)
        
        WhiteBall1.userInteractionEnabled=true
        WhiteBall2.userInteractionEnabled=true
        WhiteBall3.userInteractionEnabled=true
        WhiteBall4.userInteractionEnabled=true
        WhiteBall5.userInteractionEnabled=true
        
        RedBall.userInteractionEnabled=true
        
        let tapWhiteBall1=UITapGestureRecognizer(target: self, action: Selector("tapWhiteBall1Handler:"))
        let tapWhiteBall2=UITapGestureRecognizer(target: self, action: Selector("tapWhiteBall2Handler:"))
        let tapWhiteBall3=UITapGestureRecognizer(target: self, action: Selector("tapWhiteBall3Handler:"))
        let tapWhiteBall4=UITapGestureRecognizer(target: self, action: Selector("tapWhiteBall4Handler:"))
        let tapWhiteBall5=UITapGestureRecognizer(target: self, action: Selector("tapWhiteBall5Handler:"))
        let tapRedBall=UITapGestureRecognizer(target: self, action: Selector("tapRedBallHandler:"))
        
        WhiteBall1.addGestureRecognizer(tapWhiteBall1)
        WhiteBall2.addGestureRecognizer(tapWhiteBall2)
        WhiteBall3.addGestureRecognizer(tapWhiteBall3)
        WhiteBall4.addGestureRecognizer(tapWhiteBall4)
        WhiteBall5.addGestureRecognizer(tapWhiteBall5)
        
        RedBall.addGestureRecognizer(tapRedBall)
        
        
    }
    
    func tapWhiteBall1Handler(sender:UITapGestureRecognizer){
        WhiteBall1Switch=true
        WhiteBall2Switch=false
        WhiteBall3Switch=false
        WhiteBall4Switch=false
        WhiteBall5Switch=false
        
        arrow1.image=UIImage(named: "arrow.png")
        arrow2.image=UIImage(named: "")
        arrow3.image=UIImage(named: "")
        arrow4.image=UIImage(named: "")
        arrow5.image=UIImage(named: "")
        
        if(WhiteBallPickerLock==false){
        WhiteBallpickerView=UIPickerView(frame: CGRect(x: 0,y: self.view.frame.height-100,width: self.view.frame.width,height: 100))
        WhiteBallpickerView.delegate=self
        WhiteBallpickerView.dataSource=self
        WhiteBallpickerView.showsSelectionIndicator=false
        
        self.view.addSubview(WhiteBallpickerView)
        WhiteBallPickerLock=true
        }
    }
    
    func tapWhiteBall2Handler(sender:UITapGestureRecognizer){
        WhiteBall1Switch=false
        WhiteBall2Switch=true
        WhiteBall3Switch=false
        WhiteBall4Switch=false
        WhiteBall5Switch=false
        
        arrow1.image=UIImage(named: "")
        arrow2.image=UIImage(named: "arrow.png")
        arrow3.image=UIImage(named: "")
        arrow4.image=UIImage(named: "")
        arrow5.image=UIImage(named: "")
    }
    
    func tapWhiteBall3Handler(sender:UITapGestureRecognizer){
        WhiteBall1Switch=false
        WhiteBall2Switch=false
        WhiteBall3Switch=true
        WhiteBall4Switch=false
        WhiteBall5Switch=false
        
        arrow1.image=UIImage(named: "")
        arrow2.image=UIImage(named: "")
        arrow3.image=UIImage(named: "arrow.png")
        arrow4.image=UIImage(named: "")
        arrow5.image=UIImage(named: "")
    }
    
    func tapWhiteBall4Handler(sender:UITapGestureRecognizer){
        WhiteBall1Switch=false
        WhiteBall2Switch=false
        WhiteBall3Switch=false
        WhiteBall4Switch=true
        WhiteBall5Switch=false
        
        arrow1.image=UIImage(named: "")
        arrow2.image=UIImage(named: "")
        arrow3.image=UIImage(named: "")
        arrow4.image=UIImage(named: "arrow.png")
        arrow5.image=UIImage(named: "")

    }
    
    func tapWhiteBall5Handler(sender:UITapGestureRecognizer){
        WhiteBall1Switch=false
        WhiteBall2Switch=false
        WhiteBall3Switch=false
        WhiteBall4Switch=false
        WhiteBall5Switch=true
        
        arrow1.image=UIImage(named: "")
        arrow2.image=UIImage(named: "")
        arrow3.image=UIImage(named: "")
        arrow4.image=UIImage(named: "")
        arrow5.image=UIImage(named: "arrow.png")
    }
    
    func tapRedBallHandler(sender:UITapGestureRecognizer){
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return WhiteBallPickerArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return WhiteBallPickerArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(WhiteBall1Switch==true){
            WhiteBall1.image=UIImage(named: "W"+WhiteBallPickerArray[row]+".png")
            PowerBallArray[0]=Int(WhiteBallPickerArray[row])!-1
            WhiteBall1Valued=true
        }
        if(WhiteBall2Switch==true){
            WhiteBall2.image=UIImage(named: "W"+WhiteBallPickerArray[row]+".png")
            PowerBallArray[1]=Int(WhiteBallPickerArray[row])!-1
            WhiteBall2Valued=true
        }
        if(WhiteBall3Switch==true){
            WhiteBall3.image=UIImage(named: "W"+WhiteBallPickerArray[row]+".png")
            PowerBallArray[2]=Int(WhiteBallPickerArray[row])!-1
            WhiteBall3Valued=true
        }
        if(WhiteBall4Switch==true){
            WhiteBall4.image=UIImage(named: "W"+WhiteBallPickerArray[row]+".png")
            PowerBallArray[3]=Int(WhiteBallPickerArray[row])!-1
            WhiteBall4Valued=true
        }
        if(WhiteBall5Switch==true){
            WhiteBall5.image=UIImage(named: "W"+WhiteBallPickerArray[row]+".png")
            PowerBallArray[4]=Int(WhiteBallPickerArray[row])!-1
            WhiteBall5Valued=true
        }
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 70.0
        let width = view.bounds.width - 2.2 * margin
        rangeSilder.frame = CGRect(x:margin, y: margin + topLayoutGuide.length - 18,
            width: width, height: 31.0)
    }
    
    func rangeSliderValueChanged(rangeSlider: RangeSlider) {
        print("Range slider value changed: (\(rangeSlider.lowerValue) , \(rangeSlider.upperValue))")
        MinValueLabel.text="\(Int(rangeSlider.lowerValue))"
        MaxValueLabel.text="\(Int(rangeSlider.upperValue))"
        BallSumLowerValue=Int(rangeSlider.lowerValue)
        BallSumUpperValue=Int(rangeSlider.upperValue)
    }
    
    @IBAction func sliderValueChanged(sender: UISlider){
        let currentValue = Int(sender.value*5)
        OddNumberLabel.text = "\(currentValue)"
        EvenNumberLabel.text = "\(5-currentValue)"
        OddNumber=currentValue
        EvenNumber=5-currentValue
    }
    
    @IBAction func GetBallNumber(){
        if(PowerBallArray[0]+PowerBallArray[1]+PowerBallArray[2]+PowerBallArray[3]+PowerBallArray[4]>BallSumUpperValue){
            let alertController=UIAlertController(title: "Caution", message: "Check the Sum Range", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }else{
        var BallSum=0
        var CheckOddNumber=0
        repeat{
        CheckOddNumber=0
        var j=0
            
        if(WhiteBall1Valued==false){
        PowerBallArray[0]=Int(arc4random_uniform(69))
        }
        
        if(WhiteBall2Valued==false){
        repeat{PowerBallArray[1]=Int(arc4random_uniform(69))}while(PowerBallArray[1]==PowerBallArray[0])
        }
        
        if(WhiteBall3Valued==false){
        repeat{PowerBallArray[2]=Int(arc4random_uniform(69))}while(PowerBallArray[2]==PowerBallArray[1]||PowerBallArray[2]==PowerBallArray[0])
        }
        
        if(WhiteBall4Valued==false){
        repeat{PowerBallArray[3]=Int(arc4random_uniform(69))}while(PowerBallArray[3]==PowerBallArray[2]||PowerBallArray[3]==PowerBallArray[1]||PowerBallArray[3]==PowerBallArray[0])
        }
        
        if(WhiteBall5Valued==false){
        repeat{PowerBallArray[4]=Int(arc4random_uniform(69))}while(PowerBallArray[4]==PowerBallArray[3]||PowerBallArray[4]==PowerBallArray[2]||PowerBallArray[4]==PowerBallArray[1]||PowerBallArray[4]==PowerBallArray[0])
        }
            
        BallSum = PowerBallArray[0] + PowerBallArray[1] + PowerBallArray[2] + PowerBallArray[3] + PowerBallArray[4]
            
        while(j<5){
            let n=PowerBallArray[j]
            if(n%2 == 0){
                 CheckOddNumber++
            }
            j++
        }
        
        }while(BallSum<BallSumLowerValue||BallSum>BallSumUpperValue||CheckOddNumber != OddNumber)

        PowerBallArray.sortInPlace()
        
        RedBallNumber=Int(arc4random_uniform(26))
        
        let WhiteBallString1:String=self.WhiteBallImageArray[PowerBallArray[0]]
        let WhiteBallString2:String=self.WhiteBallImageArray[PowerBallArray[1]]
        let WhiteBallString3:String=self.WhiteBallImageArray[PowerBallArray[2]]
        let WhiteBallString4:String=self.WhiteBallImageArray[PowerBallArray[3]]
        let WhiteBallString5:String=self.WhiteBallImageArray[PowerBallArray[4]]
        
        let RedBallString:String=self.RedBallImageArray[RedBallNumber]
        
        self.WhiteBall1.image=UIImage(named: WhiteBallString1)
        self.WhiteBall2.image=UIImage(named: WhiteBallString2)
        self.WhiteBall3.image=UIImage(named: WhiteBallString3)
        self.WhiteBall4.image=UIImage(named: WhiteBallString4)
        self.WhiteBall5.image=UIImage(named: WhiteBallString5)
        
        self.RedBall.image=UIImage(named: RedBallString)
    
        PowerBallStringArray=[WhiteBallString1,WhiteBallString2,WhiteBallString3,WhiteBallString4,WhiteBallString5,RedBallString]
        }
    }
    
    @IBAction func SaveBall(){
        if(PowerBallArray[0]==0||PowerBallArray[1]==0||PowerBallArray[2]==0||PowerBallArray[3]==0||PowerBallArray[4]==0||RedBallNumber==0){
             let alertController=UIAlertController(title: "Caution", message: "Can not save an empty Powerball", preferredStyle: UIAlertControllerStyle.Alert)
             alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
             self.presentViewController(alertController, animated: true, completion: nil)
        }else{
        PowerBallList.append(PowerBallStringArray)
        self.performSegueWithIdentifier("ToSavedList", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ToSavedList"){
            let sv = segue.destinationViewController as! SavedBallViewController
            sv.SavedBallList=PowerBallList
        }
    }
    
    @IBAction func ClearBall(){
        PowerBallArray[0]=0
        PowerBallArray[1]=0
        PowerBallArray[2]=0
        PowerBallArray[3]=0
        PowerBallArray[4]=0
        RedBallNumber=0
        
        WhiteBall1Valued=false
        WhiteBall2Valued=false
        WhiteBall3Valued=false
        WhiteBall4Valued=false
        WhiteBall5Valued=false
        
        self.WhiteBall1.image=UIImage(named: "")
        self.WhiteBall2.image=UIImage(named: "")
        self.WhiteBall3.image=UIImage(named: "")
        self.WhiteBall4.image=UIImage(named: "")
        self.WhiteBall5.image=UIImage(named: "")
        
        self.RedBall.image=UIImage(named: "")
        
        arrow1.image=UIImage(named: "")
        arrow2.image=UIImage(named: "")
        arrow3.image=UIImage(named: "")
        arrow4.image=UIImage(named: "")
        arrow5.image=UIImage(named: "")
       
        if(WhiteBall1Switch==true||WhiteBall2Switch==true||WhiteBall3Switch==true||WhiteBall4Switch==true||WhiteBall5Switch==true){
        WhiteBallpickerView.removeFromSuperview()
        WhiteBallPickerLock=false
        }
    }
    
//    func selectorGroup(tag:Int,W1:Int,W2:Int,W3:Int,W4:Int,W5:Int,UPV:Int,LOV:Int) throws{
//        switch tag{
//            case 1:
//                if(W1+W2+W3+W4+W5<LOV||W1+W2+W3+W4+W5>UPV){
//                    throw GroupError.OutOfSum
//                }
//                break
//            default:
//                if(W1==0){
//                    throw GroupError.NullInput
//                }
//                break
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

class CustomUISlider:UISlider {
    override func trackRectForBounds(bounds: CGRect) -> CGRect {
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 10.0))
        super.trackRectForBounds(customBounds)
        return customBounds
    }
    
    override func awakeFromNib() {
        self.setThumbImage(UIImage(named: "customThumb"), forState: .Normal)
        super.awakeFromNib()
    }
}

extension ViewController:updatesavelistdelegete{
    func Updatesavelist(list:[Array<String>]) {
        PowerBallList=list
    }
}