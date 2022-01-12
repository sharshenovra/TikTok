//
//  CustomTTCell.swift
//  TikTok
//
//  Created by Ruslan Sharshenov on 12.01.2022.
//

import BMPlayer
import SnapKit
import UIKit

class CustomTTCell: UITableViewCell {
    
    private var link: String
    private var player = BMPlayer()
    
    private lazy var musicButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "image-removebg-preview-5"), for: .normal)
        return view
    }()
    
    private lazy var replyButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "image-removebg-preview"), for: .normal)
        return view
    }()
    
    private lazy var commentButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "image-removebg-preview-2"), for: .normal)
        return view
    }()
    
    private lazy var likeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "image-removebg-preview-3"), for: .normal)
        return view
    }()
    
    private lazy var imageButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "image-removebg-preview-4"), for: .normal)
        return view
    }()
    
    init(link: String) {
        self.link = link
        super.init(style: .default, reuseIdentifier: "cell")
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        player.isUserInteractionEnabled = false
        BMPlayerConf.enableVolumeGestures = false
        BMPlayerConf.enableBrightnessGestures = false
        BMPlayerConf.enablePlaytimeGestures = false
        BMPlayerConf.shouldAutoPlay = true
     
        let resource = BMPlayerResource(url: URL(string: link)!)
        player.setVideo(resource: resource)
        self.contentView.addSubview(player)
        player.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        player.addSubview(musicButton)
        musicButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(((UIScreen.main.bounds.height) / (-5)))
            make.right.equalToSuperview().offset(((UIScreen.main.bounds.width) / (-40)))
            make.height.equalTo(UIScreen.main.bounds.height / 20)
            make.width.equalTo(UIScreen.main.bounds.width / 9)
        }
        player.addSubview(replyButton)
        replyButton.snp.makeConstraints { make in
            make.bottom.equalTo(musicButton.snp.top).offset(((UIScreen.main.bounds.height) / (-40)))
            make.centerX.equalTo(musicButton)
            make.height.equalTo(UIScreen.main.bounds.height / 20)
            make.width.equalTo(UIScreen.main.bounds.width / 9)
        }
        player.addSubview(commentButton)
        commentButton.snp.makeConstraints { make in
            make.bottom.equalTo(replyButton.snp.top).offset(((UIScreen.main.bounds.height) / (-40)))
            make.centerX.equalTo(musicButton)
            make.height.equalTo(UIScreen.main.bounds.height / 20)
            make.width.equalTo(UIScreen.main.bounds.width / 9)
        }
        player.addSubview(likeButton)
        likeButton.snp.makeConstraints { make in
            make.bottom.equalTo(commentButton.snp.top).offset(((UIScreen.main.bounds.height) / (-40)))
            make.centerX.equalTo(musicButton)
            make.height.equalTo(UIScreen.main.bounds.height / 20)
            make.width.equalTo(UIScreen.main.bounds.width / 9)
        }
        player.addSubview(imageButton)
        imageButton.snp.makeConstraints { make in
            make.bottom.equalTo(likeButton.snp.top).offset(((UIScreen.main.bounds.height) / (-40)))
            make.centerX.equalTo(musicButton)
            make.height.equalTo(UIScreen.main.bounds.height / 20)
            make.width.equalTo(UIScreen.main.bounds.width / 9)
        }
        
    }
    
}
