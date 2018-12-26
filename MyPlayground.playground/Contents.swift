import UIKit

var myAge : Int = 32

myAge = 33

let myName : String = "Abdul"

let myNameAndAge = "\(myName) , \(myAge)"


func loveCalculator(yourName: String , theirName : String) -> String{
   let loveScore = Int.random(in: 0 ... 100)
   
    if loveScore == 100{
        return "Prefect\(loveScore) !"
    } else if loveScore > 100{
        return "not\(loveScore) bad"
    }else{
        return "You Missed it \(loveScore)"
    }
    

    
}
print(loveCalculator(yourName :  "dd",theirName : "dsd"))


