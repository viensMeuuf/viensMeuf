//
//  ViewController.swift
//  SearchingBySport
//
//  Created by Jasmine on 13/12/2019.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import UIKit
import MapKit

var eventList: [Event] = [Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "Football", place: "Parc de Sceaux" ), Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "Running", place: "Parc de la Villette", coordinate: CLLocationCoordinate2D(latitude: 8.8938278, longitude: 2.3203915)), Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "Football à 5", place: "Parce de Sceaux", coordinate: CLLocationCoordinate2D(latitude: 48.7737751, longitude: 2.2613253)), Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "Chat-Basket", place: "Parc de Montsouris", coordinate: CLLocationCoordinate2D(latitude: 48.7737751, longitude: 2.2613253)), Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "BasketBall", place: "Pigalle", coordinate: CLLocationCoordinate2D(latitude: 48.8824243, longitude: 2.3364403)), Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "Natation", place: "Piscine Saint-Louis", coordinate: CLLocationCoordinate2D(latitude: 48.8824582, longitude: 2.3233081)), Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "Tennis", place: "Tennis Henry de Montherlant", coordinate: CLLocationCoordinate2D(latitude: 48.8745162, longitude: 2.2556663)), Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "Boxe", place: "CercleBoxe", coordinate: CLLocationCoordinate2D(latitude: 48.8842328, longitude: 2.2772101)), Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "Volley", place: "Bois de Boulogne", coordinate: CLLocationCoordinate2D(latitude: 48.8842328, longitude: 2.2622324)), Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "Gymnastique", place: "Centre sportif Denise et Robert Gamzon", coordinate: CLLocationCoordinate2D(latitude: 48.8639498, longitude: 2.3447333))]


//PDS
//latitude: 48.7737751, longitude: 2.2613253

//Event(creator: nil, eventGroup: nil, date: nil, titleEvent: "Ping-Pong", place: "Square", coordinate: CLLocationCoordinate2D(latitude: <#T##CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>))

//@48.8842328,2.2772101,
//1er c le "CERCLERBOXE


//2e centre sportif Roger le Gall
//@48.8682215,2.3447333,

//Centre sportif Denise et Robert Gamzon  : @48.8639498,2.3447333,
//Pigalle Basketball : @48.8824243,2.3364403,1

//La Piscine Saint-Louis : @48.8824582,2.3233081

//Volley Bois De Boulogne : @48.8744989,2.2622324


//Tennis Henry de Montherlant : @48.8745162,2.2556663,


//Coulée verte René-Dumont, Coulée verte René-Dumont, : /@48.8493863,2.3692773,





class ViewController: UIViewController {
    
    
    @IBOutlet weak var map: MKMapView!
    var selection: String?
    
    
    //    MARK: 1 INSTANCE USER ET 1 INSTANCE EVENT
    
    
    var user1 = User(gender: .female, mailAdress: "yoplait@yop.co", firstname: "Meriam", xpCategory: .aguerrie, motivationCategory: .fun)
    
    
    
    
    // MARK: - SearchingBySport
    
    
    var searchController: UISearchController!
    
    var currentDataSource: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //    car results envoyés sur le même écran =
        tableView.delegate = self
        tableView.dataSource = self
        //!\ comment envoyer vers second écran ??? voir exo continents ??
        
        
        currentDataSource = listKeywords()
        
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        // Do any additional setup after loading the view.
        searchController.hidesNavigationBarDuringPresentation = false
        
        // - Map
        //important
        
        map.delegate = self
        
        map.register(myAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        setupUI()
        
        
        self.navigationItem.searchController = searchController
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
        setupUI()
    }
    
    
    var isSearching: Bool = false
    func filterCurrentDataSource(searchTerm: String) {
        
        if searchTerm.count > 0 {
            isSearching = true
            let filteredResults = listKeywords().filter { $0.replacingOccurrences(of: " ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: " ", with: "").lowercased())
                
            }
            
            currentDataSource = filteredResults
            tableView.reloadData()
        } else {
            isSearching = false
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
    
    
    
    
    @IBOutlet weak var CalendarFilterbutton: UIButton!
    
    @IBAction func unwindToMap(_ segue: UIStoryboardSegue) {
        // nothing
    }
    
    
    
    //    MARK: - MAP FUNCTIONS
    
    
    // adding an annotation
    
    func setupUI() {
        map.removeAnnotations(map.annotations)
        // TODO: creer annotation depuis event
        var annotations = [MyAnnotation]()
        for event in eventList {
            annotations.append(event.annotation())
        }
        map.addAnnotations(annotations)
        let initialLocation = eventList.last?.coordinate ?? CLLocation(latitude: 48.886162, longitude: 2.3581928).coordinate
        centerMapOnLocation(coordinate: initialLocation)
        
        //
        //        var result = [String]()
        //         for event in eventList {
        //             result.append(event.titleEvent)
        //         }
        //         return result
        
        
        
        
        //        let _annotation0 = MyAnnotation(title: "Football à 5", locationName: "Rue Riquet", discipline: "Football à 5", coordinate: CLLocationCoordinate2D(latitude: 48.886162, longitude: 2.3581928))
        //        map.addAnnotation(_annotation0)
        //
        //        let _annotation1 = MyAnnotation(title: "Running", locationName: "Parc de Sceaux", discipline: "Footing", coordinate: CLLocationCoordinate2D(latitude: 48.7737751, longitude: 2.2613253))
        //        map.addAnnotation(_annotation1)
        //
        //        let _annotation2 = MyAnnotation(title: "Ping-Pong", locationName: "Parc de Montsouris", discipline: "Ping-Pong", coordinate: CLLocationCoordinate2D(latitude: 48.8248858, longitude: 2.2677934))
        //        map.addAnnotation(_annotation2)
        //
        //        let _annotation3 = MyAnnotation(title: "Badminton", locationName: "Parc de la Villette", discipline: "Badminton", coordinate: CLLocationCoordinate2D(latitude: 8.8938278, longitude: 2.3203915))
        //        map.addAnnotation(_annotation3)
        //
        //        let _annotation4 = MyAnnotation(title: "Running", locationName: "Buttes-Chaumont", discipline: "Running", coordinate: CLLocationCoordinate2D(latitude: 48.8823028, longitude: 2.3117112))
        //        map.addAnnotation(_annotation4)
    }
    
    
    
    // Helper Functions
    let regionRadius: CLLocationDistance = 30000
    func centerMapOnLocation(coordinate: CLLocationCoordinate2D){
        
        let coordinateRegion = MKCoordinateRegion.init(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        map.setRegion(coordinateRegion, animated: true)
        
        
    }
    
}

// MARK: - 1 extension Map

// To configure the Annotation View -> return a instance of MKAnnotationView

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->
        MKAnnotationView? {
            guard let _annotation = annotation as? MyAnnotation else {return nil}
            let _identifier = "marker"
            var view: MKAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: _identifier) as? MKMarkerAnnotationView
            {
                dequeuedView.annotation = annotation
                view = dequeuedView
            }
                
            else
            {
                view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: _identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            return view
            
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
        if isSearching {
            return currentDataSource.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = currentDataSource[indexPath.row]
        return cell
    }
    
}
