//
//  ViewController.swift
//  CurrentWeather
//
//  Created by BibiX  on 02/03/2016.
//  Copyright © 2016 BibiX . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cityTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func weather(sender: AnyObject) {
   
        var wasSuccessful = false
        
        let attemptUrl = NSURL(string: "http://fr.weather-forecast.com/locations/" + cityTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest") //start with the url
        
        if let url = attemptUrl {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                
                if let urlContent = data {
                    
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    
                    let websiteArray = webContent!.componentsSeparatedByString("Prévisions Météo Pour Paris 1 &ndash; 3 Jours</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                    
                    // print(webSiteArray![1])
                    

        
        if websiteArray.count > 1 {
            
            let weatherArray = websiteArray[1].componentsSeparatedByString("</span>")
            
            if weatherArray.count > 1 {
                
                wasSuccessful = true
                
                let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.resultLabel.text = weatherSummary
                    
                    
                })
                
                
                
                
            }
            
        }
        
        
        
    }
    
    if wasSuccessful == false {
    
    self.resultLabel.text = "Couldn't find the weather for that city - please try again."
    
    
    }
    
}

task.resume()

} else {
    
    self.resultLabel.text = "Could't find the weather for that city - please try again."
    
    
}

}

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


}
