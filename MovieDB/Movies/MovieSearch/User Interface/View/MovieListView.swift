//
//  MovieSearchView.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 09/12/2025.
//

import UIKit

class MovieListView: UIView {
    
    //MARK: UI Properties
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.separatorInset = .zero
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.contentInset.top = 16
        return tableView
    }()

    lazy var searchContainer = UIFactory.getView(color: .background)
    
    fileprivate lazy var searchField: SearchTextFields = {
        let textField = SearchTextFields()
        textField.backgroundColor = .cardBG
        textField.tintColor = .tint
        textField.textColor = .text
        textField.lineLayer.removeFromSuperlayer()
        textField.addCornerRadius(radius: 24)
        textField.rightView = nil
        textField.rightViewMode = .never
        return textField
    }()
    
    var onTextChange: ((String) -> ())?
        
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        self.backgroundColor = UIColor.white
        
        searchContainer.setupForAutolayout(in: self)
        searchContainer.pinLeadingToLeading(of: self, constant: 0)
        searchContainer.pinTrailingToTrailing(of: self, constant: 0)
        searchContainer.pinTopToTopSafeArea(of: self, constant: 0)
        searchContainer.pinHeight(constant: 64)
        
        searchField.setupForAutolayout(in: searchContainer)
        searchField.pinToCenterVertically(in: searchContainer)
        searchField.pinLeadingToLeading(of: searchContainer, constant: 16)
        searchField.pinTrailingToTrailing(of: searchContainer, constant: 16)
        searchField.pinHeight(constant: 48)
        
        tableView.setupForAutolayout(in: self)
        tableView.pinTopToBottom(of: searchContainer, constant: 0)
        tableView.pinLeadingToLeading(of: self, constant: 0)
        tableView.pinTrailingToTrailing(of: self, constant: 0)
        tableView.pinBottomToBottom(of: self, constant: 0)
        tableView.backgroundColor = .bodyBg
        
        searchField.addTarget(self, action: #selector(didEditTextField(_:)), for: .editingChanged)
    }
    
    @objc func didEditTextField(_ textField: UITextField) {
        onTextChange?(textField.text ?? "")
    }
}
