//
//  ViewController.swift
//  SearchingBySport
//
//  Created by Jasmine on 13/12/2019.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import UIKit

var eventList: [Event] = [Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "Football", place: "Parc de Sceaux"), Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "Running", place: "Parc Monceau")]


class ViewController: UIViewController {
    
    var selection: String?

  
//    MARK: 1 INSTANCE USER ET 1 INSTANCE EVENT
    
    
    var user1 = User(gender: .female, mailAdress: "yoplait@yop.co", firstname: "Meriam", xpCategory: .aguerrie, motivationCategory: .fun)
    

    
    
        // MARK: - SearchingBySport

    
    var searchController: UISearchController!
    
//    var eventList: [String] = ["football", "rugby", "pingpong", "basketball", "swimming", "bowling", "judo", "martialArts", "yoga", "baseball", "volleyball", "handball", "running", "cycling", "climbing", "karting", "rollerblade", "horseRiding", "boxing", "tennis", "chess", "gymnastic", "dance"]
    
    
    var currentDataSource: [String] = []
    
    
    @IBOutlet weak var searchContainerView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addSportToDataSource(sportCount: 25, sport: "Running")
//        addSportToDataSource(sportCount: 20, sport: "Yoga")
//        addSportToDataSource(sportCount: 30, sport: "Boxing")

        //    car results envoyés sur le même écran =
        tableView.delegate = self
        tableView.dataSource = self
        //!\ comment envoyer vers second écran ??? voir exo continents ??
    
    
        currentDataSource = listKeywords()
        
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchContainerView.addSubview(searchController.searchBar)
        searchController.searchBar.delegate = self
        // Do any additional setup after loading the view.

    }
    
    func listKeywords() -> [String] {
        var result = [String]()
        for event in eventList {
            result.append(event.titleEvent)
        }
        return result
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
//    func addSportToDataSource(sportCount: Int, sport: String) {
//        for index in 1...sportCount {
//            eventList.append("\(sport) #\(index)")
//        }
//    }
    
    func filterCurrentDataSource(searchTerm: String) {
        
        if searchTerm.count > 0 {
            
            let filteredResults = currentDataSource.filter { $0.replacingOccurrences(of: " ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: " ", with: "").lowercased())
                
            }
            
            currentDataSource = filteredResults
            tableView.reloadData()
        }
    }
    
    
    func restoreCurrentDataSource() {
        
        currentDataSource = listKeywords()
        tableView.reloadData()
    }
    

//    Button "Clear research"
    @IBAction func restoreData(_ sender: Any) {
        restoreCurrentDataSource()
    }
    
}


// fin de la classe






extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text {
            filterCurrentDataSource(searchTerm: searchText)
        }
        
    
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        if let searchText = searchBar.text {
            filterCurrentDataSource(searchTerm: searchText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        if let searchText = searchBar.text, searchText.isEmpty {
            restoreCurrentDataSource()
        
    }
        
  }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // SELECTION de la cellule => écran du détail de l'event sélectionné
        
        let cell = tableView.cellForRow(at: indexPath)
        selection = cell?.textLabel?.text
        print(cell?.textLabel?.text)
        performSegue(withIdentifier: "showSelected", sender: nil)
//
        
        
        
        
        // SELECTION = alert message
        
//        let alertController = UIAlertController(title: "Selection", message: "Selected \(currentDataSource[indexPath.row])", preferredStyle: .alert)
//
//        searchController.isActive = false
//
//
//        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
//        alertController.addAction(okAction)
//
//        present(alertController, animated: true, completion: nil)
//
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = currentDataSource[indexPath.row]
        return cell
    }
    
}
