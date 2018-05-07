import Foundation



//classes

class Player{
    var luckTest: Int
    var traitor:Bool
    var posX:Int
    var posY:Int
    var mazeScore:Int
    var playerColor:String
    
    init(luckTest:Int, traitor:Bool, posX:Int, posY:Int, mazeScore:Int, playerColor:String){
        self.luckTest = luckTest
        self.traitor = traitor
        self.posX = posX
        self.posY = posY
        self.mazeScore = mazeScore
        self.playerColor = playerColor
    }
}





var response:String?

//functions

// clear functions
func clear(){
    for _ in 0...20{
        print("")
    }
}
func beginning(){
    print("supfaggot u are palying da quest to da queen\nI will show u da way\nare u da queen\n")
    print("+--------------+")
    print("| 1: yes 2: no |")
    print("+--------------+")
    
    response = readLine()
}




func areYouATraitor(){
    
    
    switch response {
    case "1"?:
        clear()
        print("u are a traitor\n\ni will teach u da wae traitor")
        player.traitor = true
    case "2"?:
        clear()
        print("i teach u")
        player.traitor = false
    default:
        print("+--------------+")
        print("| press 1 or 2 |")
        print("+--------------+")
        response = readLine()
        areYouATraitor()
    }
}

func firstact(){
    print("first u need to have da luck of da pricense")
    print("\nfirst u need to pick da number im thinking")
    print("+-----------------+")
    print("| between 1 and 5 |")
    print("+-----------------+")
    
    var number = arc4random_uniform(5)+1
    //var number:String = "1" //------------------------------------------- debugging
    
    // lucktest
    func tryAgian(){
        response = readLine()
        if number == UInt32(response!){
            // if number == response{   //------------------------------------ debugging
            if player.luckTest == 0{
                clear()
                print("you have da luck of a real queen\nyou can pass!")
                
            }else {
                clear()
                print("you lucky you can pass")
                
                
                
            }
        }else{
            clear()
            print("u not lucky try agian")
            player.luckTest += 1
            tryAgian()
        }
    }
    
    tryAgian()
}
func secondAct(){
    func maze(){
        
        
        
        // functions
        // map udprintning
        func printMap(map :                                           [[String]]){
            for x in map {
                var string = ""
                for y in x {
                    string += y
                }
                print(string)
            }
        }
        
        print("you read a rock on the castle wall that tells u, 'use da wasd'")
        print("press enter to continue... ")
        readLine()
        clear()
        
        
        
        var pointArray:[[Int]] = []
        
        let mapColor = " ⚫️ "
        // map
        var map1:[[String]] = [[ player.playerColor, mapColor, mapColor, mapColor, mapColor, mapColor, mapColor, mapColor],[ mapColor,mapColor, mapColor, mapColor, mapColor, mapColor, mapColor, mapColor],[ mapColor,mapColor, mapColor, mapColor, mapColor, mapColor, mapColor, mapColor],[ mapColor,mapColor, mapColor, mapColor, mapColor, mapColor, mapColor, mapColor],[ mapColor,mapColor, mapColor, mapColor, mapColor, mapColor, mapColor, mapColor],[ mapColor,mapColor, mapColor, mapColor, mapColor, mapColor, mapColor, mapColor],[ mapColor,mapColor, mapColor, mapColor, mapColor, mapColor, mapColor, mapColor],[ mapColor,mapColor, mapColor, mapColor, mapColor, mapColor, mapColor, mapColor]]
        
        // movement functions
        func moveRight(){
            if  player.posX <= map1[1].count-2{
                    map1[player.posY][player.posX] = mapColor
                    player.posX = player.posX + 1
                    map1[player.posY][player.posX] = player.playerColor
                    clear()
                
                    printMap(map: map1)
                    getScore()
            }else{
                clear()
                printMap(map: map1)
                getScore()
            }
        }
        func moveLeft(){
            if  player.posX > 0{
                map1[player.posY][player.posX] = mapColor
                player.posX = player.posX - 1
                map1[player.posY][player.posX] = player.playerColor

                clear()
                printMap(map: map1)
                getScore()
            }else{
                clear()
                printMap(map: map1)
                getScore()
            }
        }
        func moveUp(){
            if  player.posY > 0 {
                map1[player.posY][player.posX] = mapColor
                player.posY = player.posY - 1
                map1[player.posY][player.posX] = player.playerColor

                clear()
                printMap(map: map1)
                getScore()
            }else{
                clear()
                printMap(map: map1)
                getScore()
            }
        }
        func moveDown(){
            if  player.posY <= map1.count-2  {
                map1[player.posY][player.posX] = mapColor
                player.posY = player.posY + 1
                map1[player.posY][player.posX] = player.playerColor

                clear()
                printMap(map: map1)
                getScore()
            }else{
                clear()
                printMap(map: map1)
                getScore()
                
            }
        }
        // point placement
        func pointPlacement(){
            let pointColor = " 🔴 "
           
            
            for _ in 0..<9 {
                let randX = arc4random_uniform(7)
                let randY = arc4random_uniform(7)
                
                pointArray.append([Int(randY), Int(randX)])
                //pointArray[i].append(Int(randY))
                //pointArray[i].append(Int(randX))
            
                //map1[Int(randX)][Int(randY)] = pointColor
                map1[Int(randY)][Int(randX)] = pointColor
            
            }
            
            
            
        }
        // score + placerigns sammenlgining eg. antal points
        func getScore(){
            for i in (0..<pointArray.count).reversed() {
                if player.posX == pointArray[i][1] && player.posY == pointArray[i][0] {
                    player.mazeScore += 1
                    pointArray.remove(at: i)
                }
            }
        }
        
        
        pointPlacement()
        getScore()
        print(player.mazeScore)
        printMap(map : map1)
        // gameloop win get score 9
        while player.mazeScore < 9{
            var move:String? = readLine()
            switch move {
            case "d"?:
                moveRight()
                print(player.mazeScore)
            case "a"?:
                moveLeft()
                print(player.mazeScore)
            case "s"?:
                moveDown()
                print(player.mazeScore)
            case "w"?:
                moveUp()
                print(player.mazeScore)
                
                
            default:
                print("press agian")
            }
        }
        
        
        
    }
    print("now yah need to know da way of da queen")
    print("escape da castle")
    print("u ready?")
    print("+--------------+")
    print("| 1: yes 2: no |")
    print("+--------------+")
    
    response = readLine()
    func agian(){
        switch response {
        case "1"?:
            clear()
            maze()
        case "2"?:
            clear()
            print("well i beleave in force")
            maze()
            
        default:
            print("+--------------+")
            print("| press 1 or 2 |")
            print("+--------------+")
            response = readLine()
            agian()
            
            
            
        }
    }
    agian()
    
}
func ending(){
    print("Congratz u won da game, you aare now a grownwaman")
    print("u have dis stats:\(player.luckTest + player.mazeScore)")
    print("u wanna tryagian?")
    print("try agian: 1  Quit: 2")
    response = readLine()
    func agian1(){
        switch response {
        case "2"?:
            print("bye")
        case "1"?:
            print("ty fam")
            beginning()
            
            
        default:
            print("+--------------+")
            print("| press 1 or 2 |")
            print("+--------------+")
            response = readLine()
            agian1()
            
            
            
        }
    }
    agian1()
    
    
}


//program
var player = Player(luckTest: 0, traitor: true, posX: 0, posY: 0, mazeScore: 0, playerColor:" 🔵 ")

    beginning()
    areYouATraitor()
    firstact()
    secondAct()
    ending()




