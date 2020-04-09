//
//  ViewController.swift
//  SimpsonBook
//
//  Created by MAKAN on 8.04.2020.
//  Copyright © 2020 YUNUS MAKAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    //Simpson objects
        
        let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Safety!" , simpsonImage: UIImage(named: "Homer")!)
        let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "Student!" , simpsonImage: UIImage(named: "Bart")!)
        let maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "Baby!" , simpsonImage: UIImage(named: "Maggie")!)
        let abraham = Simpson(simpsonName: "Abraham Simpson", simpsonJob: "Retired!" , simpsonImage: UIImage(named: "Abraham")!)
        let mona = Simpson(simpsonName: "Mona Simpson", simpsonJob: "Criminal!" , simpsonImage: UIImage(named: "Mona")!)
        let patty = Simpson(simpsonName: "Patty Simpson", simpsonJob: "Student!" , simpsonImage: UIImage(named: "Patty")!)
        let selma = Simpson(simpsonName: "Selma Simpson", simpsonJob: "Student!" , simpsonImage: UIImage(named: "Selma")!)
        let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student!" , simpsonImage: UIImage(named: "Lisa")!)
        let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "House Wife!" , simpsonImage: UIImage(named: "Marge")!)

        mySimpsons.append(homer)
        mySimpsons.append(bart)
        mySimpsons.append(maggie)
        mySimpsons.append(abraham)
        mySimpsons.append(mona)
        mySimpsons.append(patty)
        mySimpsons.append(selma)
        mySimpsons.append(lisa)
        mySimpsons.append(marge)
        
        

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name // satirlarda ismi gormek istedigimiz icin .name yaptik.
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSimpson = chosenSimpson
            
        }
    }
}

