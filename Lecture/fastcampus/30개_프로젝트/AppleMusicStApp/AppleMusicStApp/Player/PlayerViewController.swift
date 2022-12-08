//
//  PlayerViewController.swift
//  AppleMusicStApp
//
//  Created by joonwon lee on 2020/01/12.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var playControlButton: UIButton!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalDurationLabel: UILabel!
    
    //TODO: SimplePlayer 만들고 프로퍼티 추가
    let simplePlayer = SimplePlayer.shared
    
    var timeObserver: Any?
    var isSeeking: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatePlayButton()
        updateTime(time: CMTime.zero)
        // TODO: TimeObserver 구현
        // 곡을 재생할 때, 재생되는 녀석의 시간을 일정하게 관찰하겠다
        // addPeriodicTimeObserver : 일정 간격으로 시간을 관찰하는 녀석을 더하겠다
        // CMTime : Core Media Time / AVFoundation 밑에 있는 녀석 / seconds: 초 PreferredTimescale: 몇 번 쪼갤꺼야?
        // DispatchQueue : 0.1초마다 UILabel을 계속 업데이트 시키려고 합니다. 그 때 UILabel은 mainThread라는 곳에서 변경이 되어야하는데, mainThread한테 0.1초마다 알려주는 역할을 합니다.
        timeObserver = simplePlayer.addPeriodicTimeObserver(forInterval:CMTime(seconds: 1, preferredTimescale: 10) ,queue: DispatchQueue.main ,using: { time in
            self.updateTime(time: time)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTintColor()
        updateTrackInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // TODO: 뷰나갈때 처리 > 심플플레이어
        simplePlayer.pause()
        simplePlayer.replaceCurrentItem(with: nil)
    }
    
    @IBAction func beginDrag(_ sender: UISlider) {
        isSeeking = true
    }
    
    @IBAction func endDrag(_ sender: UISlider) {
        isSeeking = false
    }
    
    @IBAction func seek(_ sender: UISlider) {
        // TODO: 시킹 구현
        guard let currentItem = simplePlayer.currentItem else { return }
        let postion = Double(sender.value) // 0...1 > 0.5
        let seconds = postion * currentItem.duration.seconds
        let time = CMTime(seconds: seconds, preferredTimescale: 100)
        
        simplePlayer.seek(to: time)
    }
    
    @IBAction func togglePlayButton(_ sender: UIButton) {
        // TODO: 플레이버튼 토글 구현
        if simplePlayer.isPlaying {
            simplePlayer.pause()
        } else {
            simplePlayer.play()
        }
        updatePlayButton()
    }
}

extension PlayerViewController {
    func updateTrackInfo() {
        // TODO: 트랙 정보 업데이트
        guard let track = simplePlayer.currentItem?.convertToTrack() else { return }
        thumbnailImageView.image = track.artwork
        titleLabel.text = track.title
        artistLabel.text = track.artist
    }
    
    func updateTintColor() {
        playControlButton.tintColor = DefaultStyle.Colors.tint
        timeSlider.tintColor = DefaultStyle.Colors.tint
    }
    
    func updateTime(time: CMTime) {
        // print(time.seconds)
        // currentTime label, totalduration label, slider
        
        // TODO: 시간정보 업데이트, 심플플레이어 이용해서 수정
        currentTimeLabel.text = secondsToString(sec: simplePlayer.currentTime)   // 3.1234 >> 00:03
        totalDurationLabel.text = secondsToString(sec: simplePlayer.totalDurationTime)  // 39.2045  >> 00:39
        
        if isSeeking == false {
            // 노래 들으면서 시킹하면, 자꾸 슬라이더가 업데이트 됨, 따라서 시킹아닐때마 슬라이더 업데이트하자
            // TODO: 슬라이더 정보 업데이트
            timeSlider.value = Float(simplePlayer.currentTime/simplePlayer.totalDurationTime)
            
        }
    }
    
    func secondsToString(sec: Double) -> String {
        guard sec.isNaN == false else { return "00:00" }
        let totalSeconds = Int(sec)
        let min = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", min, seconds)
    }
    
    func updatePlayButton() {
        // TODO: 플레이버튼 업데이트 UI작업 > 재생/멈춤
        if simplePlayer.isPlaying {
            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
            let image = UIImage(systemName: "pause.fill", withConfiguration: configuration)
            playControlButton.setImage(image, for: .normal)
        } else {
            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
            let image = UIImage(systemName: "play.fill", withConfiguration: configuration)
            playControlButton.setImage(image, for: .normal)
        }
    }
}
