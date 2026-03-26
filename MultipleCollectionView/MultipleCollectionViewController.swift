//
//  MultipleCollectionViewController.swift
//  MultipleCollectionView
//
//  Created by Aditya Machhaiya on 30/12/25.
//

import UIKit

final class MultipleCollectionViewController: UIViewController {

    private let singers = ["Charlie Puth", "Sabrina Carpenter", "Linkin Park", "Nirvana", "Avicii","Red hot chilli peppers","My Chemical Romance"]
    private let songs = ["The Nights", "Cigaro", "Chop Suey", "Dead!", "Numb","Na Na","Snow (Hey oh)","Dead!"]

    private lazy var singerCollectionView = makeCollectionView()
    private lazy var songCollectionView = makeCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI()  {
        addCollectionViewForSingers()
        addCollectionViewForSongs()

    }
    
    private func addCollectionViewForSingers() {
        view.addSubview(singerCollectionView)
        singerCollectionView.register(MultipleCollectionTableViewCellForSinger.self, forCellWithReuseIdentifier: MultipleCollectionTableViewCellForSinger.identifier)
        
        
        NSLayoutConstraint.activate([
            singerCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            singerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            singerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            singerCollectionView.heightAnchor.constraint(equalToConstant: 100)
                ])
    }
    
    private func addCollectionViewForSongs() {
        view.addSubview(songCollectionView)
        
        songCollectionView.register(MultipleCollectionTableViewCellForSong.self, forCellWithReuseIdentifier: MultipleCollectionTableViewCellForSong.identifier)

        NSLayoutConstraint.activate([
            songCollectionView.topAnchor.constraint(equalTo: singerCollectionView.bottomAnchor, constant: 24),
            songCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            songCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            songCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }

    private func makeCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }
    
    private func songCellWidth(text: String) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 15, weight: .medium)
        let padding: CGFloat = 16 * 2 // left + right padding

        let textWidth = (text as NSString)
            .size(withAttributes: [.font: font])
            .width

        return textWidth + padding
    }
    
}

extension MultipleCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == singerCollectionView ? singers.count : songs.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if collectionView == singerCollectionView {
               let cell = collectionView.dequeueReusableCell(
                   withReuseIdentifier: MultipleCollectionTableViewCellForSinger.identifier,
                   for: indexPath
               ) as! MultipleCollectionTableViewCellForSinger
               cell.configure(singers[indexPath.item])
               return cell
           } else {
               let cell = collectionView.dequeueReusableCell(
                   withReuseIdentifier: MultipleCollectionTableViewCellForSong.identifier,
                   for: indexPath
               ) as! MultipleCollectionTableViewCellForSong
               cell.configure(songs[indexPath.item])
               return cell
           }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        if collectionView == singerCollectionView {
            return CGSize(width: 120, height: 80)
        } else {
            let title = songs[indexPath.item]
            let width = songCellWidth(text: title)
            return CGSize(width: width, height: 80)
        }
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == singerCollectionView {
            print("Singer selected:", singers[indexPath.item])
        } else {
            print("Song selected:", songs[indexPath.item])
        }
    }
    
    
}

