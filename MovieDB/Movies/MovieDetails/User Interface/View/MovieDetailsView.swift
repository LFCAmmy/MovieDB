//
//  MovieDetailsView.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import UIKit

class MovieDetailsView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()

    private lazy var containerView = UIFactory.getView(color: .bodybg)
    private lazy var imgView = UIFactory.getImageView(image: UIImage(named: ""), contentMode: .scaleAspectFill, radius: 32)
    private lazy var titleLabel = UIFactory.appLabel(text: "", font: .h2Bold, color: .white)
    
    private lazy var collectionRatingStackView = UIFactory.getStackView(axis: .horizontal, spacing: 8, subViews: [ratingStackView, budgetStackView, collectionStackView])
    
    private lazy var ratingStackView = UIFactory.getStackView(axis: .vertical, spacing: 8, subViews: [ratingLabel, ratingTitleLabel])
    
    private lazy var ratingLabel = UIFactory.appLabel(text: "", font: .h3Bold, color: .text, alignment: .center)
    private lazy var ratingTitleLabel = UIFactory.appLabel(text: "IMDB", font: .h4Regular, color: .text, alignment: .center)
    
    private lazy var budgetStackView = UIFactory.getStackView(axis: .vertical, spacing: 8, subViews: [budgetLabel, budgetTitleLabel])
    
    private lazy var budgetLabel = UIFactory.appLabel(text: "", font: .h3Bold, color: .text, alignment: .center)
    private lazy var budgetTitleLabel = UIFactory.appLabel(text: "Budget", font: .h4Regular, color: .text, alignment: .center)
    
    private lazy var collectionStackView = UIFactory.getStackView(axis: .vertical, spacing: 8, subViews: [collectionLabel, collectionTitleLabel])
    
    private lazy var collectionLabel = UIFactory.appLabel(text: "", font: .h3Bold, color: .text, alignment: .center)
    private lazy var collectionTitleLabel = UIFactory.appLabel(text: "Revenue", font: .h4Regular, color: .text, alignment: .center)
    
    private lazy var labelStackView = UIFactory.getStackView(axis: .vertical, spacing: 32, subViews: [tagLineLabel, releaseDateLabel,  watchDurationLabel])
        
    private lazy var tagLineLabel = UIFactory.appLabel(text: "", font: .bodyBold, color: .text)
    
    private lazy var releaseDateLabel = UIFactory.appLabel(text: "", font: .bodyBold, color: .text)

    private lazy var posterImgView = UIFactory.getImageView(image: UIImage(named: ""), contentMode: .scaleAspectFill, radius: 32)
   
    private lazy var watchDurationLabel = UIFactory.appLabel(text: "", font: .body2Regular, color: .text)
    
    private lazy var overViewTitleLabel = UIFactory.appLabel(text: "Overview", font: .h2Bold, color: .text)
    private lazy var overViewLabel = UIFactory.appLabel(text: "", font: .h4SemiBold, color: .gray)

    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        self.backgroundColor = .bodyBg
        scrollView.setupForAutolayout(in: self)
        scrollView.pin(left: 0, right: 0, top: 0, bottom: 0, toView: self)
        scrollView.contentInsetAdjustmentBehavior = .never
        
        containerView.setupForAutolayout(in: scrollView)
        containerView.pin(left: 0, right: 0, top: 0, bottom: 0, toView: scrollView)
        containerView.pinEqualWidth(to: self)
        
        imgView.setupForAutolayout(in: containerView)
        imgView.pinTopToTop(of: containerView, constant: 0)
        imgView.pinLeadingToLeading(of: containerView, constant: 0)
        imgView.pinTrailingToTrailing(of: containerView, constant: 0)
        imgView.pinHeight(constant: 300)
        
        titleLabel.setupForAutolayout(in: containerView)
        titleLabel.pinBottomToBottom(of: imgView, constant: 16)
        titleLabel.pinLeadingToLeading(of: containerView, constant: 16)
        titleLabel.pinTrailingToTrailing(of: containerView, constant: 16)
        
        collectionRatingStackView.setupForAutolayout(in: containerView)
        collectionRatingStackView.pinTopToBottom(of: imgView, constant: 16)
        collectionRatingStackView.pinTrailingToTrailing(of: containerView, constant: 16)
        collectionRatingStackView.pinLeadingToLeading(of: containerView, constant: 16)
        
        posterImgView.setupForAutolayout(in: containerView)
        posterImgView.pinTopToBottom(of: collectionRatingStackView, constant: 32)
        posterImgView.pinTrailingToTrailing(of: containerView, constant: 16)
        posterImgView.pinWidth(constant: 120)
        posterImgView.pinHeight(constant: 200)
        
        labelStackView.setupForAutolayout(in: containerView)
        labelStackView.pinTopToTop(of: posterImgView, constant: 0)
        labelStackView.pinLeadingToLeading(of: containerView, constant: 16)
        labelStackView.pinTrailingToLeading(of: posterImgView, constant: -16)
        
        overViewTitleLabel.setupForAutolayout(in: containerView)
        overViewTitleLabel.pinLeadingToLeading(of: containerView, constant: 16)
        overViewTitleLabel.pinTrailingToTrailing(of: containerView, constant: 16)
        overViewTitleLabel.pinTopToBottom(of: posterImgView, constant: 40)
        
        overViewLabel.setupForAutolayout(in: containerView)
        overViewLabel.pinLeadingToLeading(of: containerView, constant: 16)
        overViewLabel.pinTrailingToTrailing(of: containerView, constant: 16)
        overViewLabel.pinTopToBottom(of: overViewTitleLabel, constant: 16)
        overViewLabel.pinBottomToBottomSafeArea(of: containerView, constant: 16)

    }
    
    func config(movie: Movie) {
        let budget = movie.budget ?? 0
        let revenue = movie.revenue ?? 0
        let tagline = movie.tagline ?? ""
        
        titleLabel.text = "\(movie.originalTitle ?? "") (\((movie.releaseDate ?? "").formatDate(toFormat: .yyyy)))"
        tagLineLabel.setBoldNormalText(boldText: tagline, normalText: "Tagline: ", boldFont: .bodyBold, normalFont: .bodyRegular, boldTextColor: .text, normalTextColor: .text)
        overViewLabel.text = movie.overview
        releaseDateLabel.setBoldNormalText(boldText: (movie.releaseDate ?? "").formatDate(), normalText: "Release Date: ", boldFont: .bodyBold, normalFont: .bodyRegular, boldTextColor: .text, normalTextColor: .text)
        watchDurationLabel.setBoldNormalText(boldText: (movie.runtime ?? 0).minutesToHoursMinutes(), normalText: "Duration: ", boldFont: .bodyBold, normalFont: .bodyRegular, boldTextColor: .text, normalTextColor: .text)
        imgView.loadImage(from: movie.backdropImageUrl)
        posterImgView.loadImage(from: movie.imageUrl)
        ratingLabel.text = String(format: "%.1f", movie.voteAverage ?? 0) + "/10"
        
        budgetLabel.text = budget.formatNumberToShort()
        collectionLabel.text = revenue.formatNumberToShort()
        
        budgetStackView.isHidden = budget == 0
        collectionStackView.isHidden = revenue == 0
        tagLineLabel.isHidden = tagline == ""
        
    }
    
    
}

