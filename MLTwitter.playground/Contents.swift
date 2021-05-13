import Cocoa
import CreateML
do{
let data = try MLDataTable(contentsOf: URL(fileURLWithPath:"/Users/sreenivask/Documents/WorkSpace/IOS/twitter/twitter-sanders-apple3.csv"))
let (trainingData,testingData) = data.randomSplit(by:0.8,seed:5)
let sentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")
let evaluationMatrics = sentClassifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")
let accuracy=(1.0 - evaluationMatrics.classificationError)*100
let metadeta=MLModelMetadata(author: "Sreenivas", shortDescription: "This is tained sentimates", version: "1.0")
try sentClassifier.write(to: URL(fileURLWithPath: "/Users/sreenivask/Documents/WorkSpace/IOS/twitter/TweetClassifier.mlmodel"))
    
try sentClassifier.prediction(from:"@apple is waste company")
try sentClassifier.prediction(from: "@apple is love")
}catch{
    
}


