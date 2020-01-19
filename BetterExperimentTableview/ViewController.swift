////
//ViewController.swift
//BetterExperimentTableview
//
//Created by Basel Baragabah on 16/01/2020.
//Copyright © 2020 Basel Baragabah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayData = [String]()
    
    var didScrollingToTop:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

      setUpData()
   
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        returnBackToLastPosition(false)
    }
    
  

    func setUpData(){
        
        for n in 0...200 {
            arrayData.append("Cell Number: \(n)")
        }
    }
    
    func returnBackToLastPosition(_ animated:Bool){
           
           if let indexPathRow = UserDefaultsModel.getScrollingIndexRow() {
               let indexPath = IndexPath(row: indexPathRow, section: 0)
               tableView.scrollToRow(at: indexPath, at: .top, animated: animated)
               
           }
       }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)

        cell.textLabel?.text = arrayData[indexPath.row]

        return cell

        
    }
}

extension ViewController:UITableViewDelegate{
    
     func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
            
         if didScrollingToTop{
             returnBackToLastPosition(true)
             didScrollingToTop = false

             return false
             
         }else if didScrollingToTop == false {
             didScrollingToTop = true
             return true
         }
        
        return true
     }
    
    func helperScrollEnd(){
        let visibleCells = tableView.visibleCells
        if let firstCell = visibleCells.first {
            if let indexPath = tableView.indexPath(for: firstCell) {
                
                UserDefaultsModel.setScrollingIndexRow(indexPath.row)
                
                print("lastScrollingIndex = \(indexPath)")
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
          helperScrollEnd()
      }
      

      
      func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
          helperScrollEnd()
      }
    
}

struct UserDefaultsModel {

    private static let scrollingIndexRowKey = "scrollingIndexRowKey"

    static var getScrollingIndexRow = {
            UserDefaults.standard.value(forKey: scrollingIndexRowKey) as? Int
        }
       
       static var setScrollingIndexRow = { (scrollingIndexRow: Int) in
           UserDefaults.standard.set(scrollingIndexRow, forKey: scrollingIndexRowKey)
       }
}
