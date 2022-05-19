//
//  RecordViewController.swift
//  Delivery Tracking
//
//  Created by Koh Boon Yeow on 2022/4/22.
//

import UIKit

class RecordViewController: UIViewController {
    var timer : Timer?
    var counter  = 0
    var delivery = 0
    
    @IBOutlet weak var addDelivery: UIButton!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var deliveryTextField: UILabel!
    @IBOutlet weak var totalTimeTexField: UILabel!
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var `break`: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer();
        stop.alpha = 0
        `break`.alpha = 0
        addDelivery.alpha = 0
        cancel.alpha = 0
        // Do any additional setup after loading the view.
    }
    @IBAction func addDelivery(_ sender: Any) {
        delivery = delivery + 1
        deliveryTextField.text = String(delivery)
    }
    
    @IBAction func start(_ sender: Any) {
        start.alpha = 0
        stop.alpha = 1
        `break`.alpha = 1
        addDelivery.alpha=1
        cancel.alpha = 1
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(RecordViewController.count), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        timer?.invalidate()
        counter = 0
        totalTimeTexField.text  = "00:00:00"
        delivery = 0
        deliveryTextField.text = "0"
        start.alpha = 1
        stop.alpha = 0
        cancel.alpha = 0
        
    }
    @IBAction func stop(_ sender: Any) {
        timer?.invalidate()
    }

    @objc func count()
    {
        counter = counter + 1
        let hours = Int(counter) / 3600
        let minutes = Int(counter) / 60 % 60
        let seconds = Int(counter) % 60
        totalTimeTexField.text  = String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
