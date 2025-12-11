//
//  MovieListViewController.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//
//

import UIKit

class MovieListViewController: RootViewController {
    
    var movies: MovieList?
    var filteredMovies: MovieList?
    
    private var debounceWorkItem: DispatchWorkItem?
    // MARK: Properties
    
    var presenter: MovieListModuleInterface?
    
    // MARK: IBOutlets
    let movieSearchView = MovieListView()
    
    // MARK: VC's Life cycle
    override func loadView() {
        super.loadView()
        let newView = movieSearchView
        self.view = newView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupDefaultNavigationBarAppearance()
        self.hideLeftBarButtonItemInNavigationItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MovieDB"
        self.setup()
        self.presenter?.fetchMovies()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
       
        movieSearchView.tableView.delegate = self
        movieSearchView.tableView.dataSource = self
        
        movieSearchView.onTextChange = { [weak self] text in
            guard let self else { return }
            let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
               
            guard !trimmedText.isEmpty else {
                self.debounceWorkItem?.cancel()
                self.filteredMovies = movies
                self.movieSearchView.tableView.reloadData()
                return
            }
            self.debounceWorkItem?.cancel()
            print("text" + text)
            let workItem = DispatchWorkItem { [weak self] in
                guard let self else { return }
                self.presenter?.fetchSearchedMovie(query: text)
            }
            
            self.debounceWorkItem = workItem
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: workItem)
        }
        
    }
}

// MARK: MovieListViewInterface
extension MovieListViewController: MovieListViewInterface {
    func didFetchSearchedMovies(movies: MovieList) {
        self.filteredMovies = movies
        self.movieSearchView.tableView.reloadData()
    }
    
    func didFetchMovies(movies: MovieList) {
        self.movies = movies
        self.filteredMovies = movies
        self.movieSearchView.tableView.reloadData()
    }
    
    func didFailWithError(error: any Error) {
        self.showToastMessage(message: error.localizedDescription)
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: MovieTableViewCell.self, indexPath: indexPath)
        if let movie = filteredMovies?.results?[indexPath.row] {
            cell.config(movie: movie)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let movieId = filteredMovies?.results?[indexPath.row].id {
            presenter?.openMovieDetails(id: movieId)
        }
    }
}
