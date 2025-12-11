//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    private lazy var containerView = UIFactory.getView(color: .white, radius: 16)
    
    private lazy var labelsStackView = UIFactory.getStackView(axis: .vertical, spacing: 8, subViews: [titleLabel, releaseDateLabel, overViewLabel])

    private lazy var titleLabel = UIFactory.appLabel(text: "", font: .h3Bold, color: .text)
    private lazy var releaseDateLabel = UIFactory.appLabel(text: "", font: .h4SemiBold, color: .tint)
    private lazy var overViewLabel = UIFactory.appLabel(text: "", font: .bodyRegular, color: .gray)
    
    private lazy var movieImageView = UIFactory.getImageView(contentMode: .scaleAspectFill, radius: 32)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
           containerView.addDropShadow()
       }

    override func prepareForReuse() {
        super.prepareForReuse()
        movieImageView.cancelImageLoad()
    }

    private func setUp() {
        selectionStyle = .none
        contentView.backgroundColor = .bodyBg
        containerView.setupForAutolayout(in: self.contentView)
        containerView.pin(left: 16, right: 16, top: 32, bottom: 16, toView: contentView)
        
        movieImageView.setupForAutolayout(in: self.contentView)
        movieImageView.pinLeadingToLeading(of: containerView, constant: 0)
        movieImageView.pinTopToTop(of: containerView, constant: -32)
        movieImageView.pinBottomToBottom(of: containerView, constant: 32)
        movieImageView.pinWidth(constant: 150)
        movieImageView.pinHeight(constant: 200)
        
        labelsStackView.setupForAutolayout(in: containerView)
        labelsStackView.pinLeadingToTrailing(of: movieImageView, constant: 16)
        labelsStackView.pinTrailingToTrailing(of: containerView, constant: 16)
        labelsStackView.pinTopToTop(of: containerView, constant: 32)
        labelsStackView.pinBottomToBottom(of: containerView, constant: 32)
    }

    func config(movie: Movie) {
        titleLabel.text = movie.originalTitle ?? ""
        releaseDateLabel.text = (movie.releaseDate ?? "").formatDate()
        movieImageView.loadImage(from: movie.imageUrl)
        overViewLabel.text = movie.overview ?? ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

