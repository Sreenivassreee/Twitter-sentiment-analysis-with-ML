//
//  ViewController.swift
//  Twitter-Sentiment
//
//  Created by Sreenivas k on 13/05/21.
//

import UIKit
import CoreML
import SwifteriOS

class ViewController: UIViewController {
    
    let swifter = Swifter(consumerKey: "user key", consumerSecret: "your key")
    let sentimentClassifier = TweetClassifier()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swifter.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
            print(results)
        
        }){(e) in
            print(e)
        }

    }
    @IBAction func PredictBtn(_ sender: Any) {
    }
    
    @IBOutlet weak var emoji: UILabel!
    
   

    @IBOutlet weak var text: UITextField!
    
    func fetchTweets() {
        
        if let searchText = text.text {
            
            swifter.searchTweet(using: searchText, lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
                
                var tweets = [TweetClassifierInput]()
                
                for i in 0..<100 {
                    if let tweet = results[i]["full_text"].string {
                        let tweetForClassification = TweetClassifierInput(text: tweet)
                        tweets.append(tweetForClassification)
                    }
                }
                
                self.makePrediction(with: tweets)
                
            }) { (error) in
                print("There was an error with the Twitter API Request, \(error)")
            }
        }
        
    }
    func makePrediction(with tweets: [TweetClassifierInput]) {
        
        do {
            
            let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
            
            var sentimentScore = 0
            
            for pred in predictions {
                let sentiment = pred.label
                
                if sentiment == "Pos" {
                    sentimentScore += 1
                } else if sentiment == "Neg" {
                    sentimentScore -= 1
                }
            }
            
//            updateUI(with: sentimentScore)
            
        } catch {
            print("There was an error with making a prediction, \(error)")
        }
        
    }
    

}

