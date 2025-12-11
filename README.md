MovieDB iOS App

MovieDB is an iOS application that displays movie details, search functionality, and additional information like genres, release dates, budget, and duration.

⸻

Features
	•	Browse and search movies using TMDB API
	•	View movie details: title, overview, genres, release date, duration, budget
	•	High-quality movie images
	•	Dynamic UI with scrollable and responsive views
	•	Multi-line genre tags
	•	Bold/normal formatting for labels

⸻

Screenshots

(Add your app screenshots here)

⸻

Requirements
	•	Xcode 15 or later
	•	iOS 16.0+
	•	Swift 5+
	•	Internet connection for TMDB API

⸻

Setup Instructions

1. Clone the repository
git clone git@github.com:LFCAmmy/MovieDB.git
cd MovieDB
2. Open in Xcode
open MovieDB.xcodeproj
3. Build and Run
	1.	Select the target device or simulator in Xcode.
	2.	Press Cmd + R to build and run the app.

⸻

Project Structure
	•	MovieDetailsViewController.swift → Shows movie details
	•	MovieDetailsView.swift → Custom view with scrollView, image, labels
	•	UIFactory.swift → Factory methods for reusable UI components
	•	Movie.swift → Movie model
	•	MoviePresenter.swift → Handles fetching data from API
	•	Extensions/ → Helper extensions for UILabels, date formatting, number formatting

⸻

Notes
	•	Navigation bar is transparent to allow the image to start from the top.
	•	Labels support bold/normal text formatting.
	•	Genre tags wrap into multiple lines dynamically.
	•	Budget, duration, and release date are formatted for readability.

⸻

Contributing
	1.	Fork the repository
	2.	Create a feature branch: git checkout -b feature-name
	3.	Commit your changes: git commit -m "Add some feature"
	4.	Push to the branch: git push origin feature-name
	5.	Open a Pull Request

⸻

License

MIT License © 2025 LFCAmmy
