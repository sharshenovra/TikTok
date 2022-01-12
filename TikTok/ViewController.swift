//
//  ViewController.swift
//  TikTok
//
//  Created by Ruslan Sharshenov on 12.01.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView = UITableView()
    private var videoLinks: [String] = ["https://v16-webapp.tiktok.com/434bc1866ca2b79e39e29351c778fdfc/61de38e9/video/tos/alisg/tos-alisg-pve-0037c001/045e863d804040978a71197f7b5efdee/?a=1988&br=2898&bt=1449&cd=0%7C0%7C1&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=Yu12_FBWkag3-I&l=20220111201144010245040111166556E5&lr=tiktok_m&mime_type=video_mp4&net=0&pl=0&qs=0&rc=Mzxxcjk6Zms8OTMzODczNEApODs4OTg8OmVnNzs6ZGQ7NWc1YGcwcjRvLnBgLS1kMS1zc2BeMy0zYmJgXjNeLjY0YV86Yw%3D%3D&vl=&vr=","https://v16-webapp.tiktok.com/69e2af0828d2b162da429783f89c4702/61de38e8/video/tos/alisg/tos-alisg-pve-0037c001/d44a01703cd443b19d04890866b46b12/?a=1988&br=2034&bt=1017&cd=0%7C0%7C1&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=Yu12_FBWkag3-I&l=20220111201144010245040111166556E5&lr=tiktok_m&mime_type=video_mp4&net=0&pl=0&qs=0&rc=ajgzZTQ6Zmd3OTMzODczNEApOzY5ODs4Nzw6N2g4ZzQzZmdvb2NicjRnbmZgLS1kMS1zc19jX15gLzAxLS8xMjZjM2I6Yw%3D%3D&vl=&vr=","https://v16-webapp.tiktok.com/2b782dd37886e7249e80d05fb125e3b9/61de38eb/video/tos/alisg/tos-alisg-pve-0037c001/891a052638d84fb992c82ed464ec905e/?a=1988&br=1662&bt=831&cd=0%7C0%7C1&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=Yu12_FBWkag3-I&l=20220111201144010245040111166556E5&lr=tiktok_m&mime_type=video_mp4&net=0&pl=0&qs=0&rc=ank5aTo6Zm9xOjMzODczNEApOjszN2dpNTtlN2g1M2U4OmdxMTVpcjQwcjRgLS1kMS1zc2EtX2AuYjUxNTU0YTM0YWA6Yw%3D%3D&vl=&vr=","https://v16-webapp.tiktok.com/9b033007f6e71a0743ee3afc43202b92/61de38e8/video/tos/alisg/tos-alisg-pve-0037c001/e1cb5d4205a74996af57fc1097c51a62/?a=1988&br=2560&bt=1280&cd=0%7C0%7C1&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=Yu12_FBWkag3-I&l=20220111201144010245040111166556E5&lr=tiktok_m&mime_type=video_mp4&net=0&pl=0&qs=0&rc=ajVreDY6ZnVnOjMzODczNEApOztnNWhkZmQ0N2RnNjxpNWc2cGdrcjRnXmFgLS1kMS1zczQuMjVjYi41YWIxLjNfNTE6Yw%3D%3D&vl=&vr=","https://v16-webapp.tiktok.com/c191e71d44ae2425a8914add33c4af75/61de38eb/video/tos/alisg/tos-alisg-pve-0037c001/90d25fa2252d4aada7530d624ae3602d/?a=1988&br=1116&bt=558&cd=0%7C0%7C1&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=Yu12_FBWkag3-I&l=20220111201144010245040111166556E5&lr=tiktok_m&mime_type=video_mp4&net=0&pl=0&qs=0&rc=M3JubTs6Zjs4OjMzODczNEApOThpZTQ8Ojw4Nzk7OTw7OmdzYDZycjRncjNgLS1kMS1zczIvMDIwYzQvYy9gLmA1LTU6Yw%3D%3D&vl=&vr="]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isPagingEnabled = true
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        let blackView = UIView()
        blackView.backgroundColor = .black
        view.addSubview(blackView)
        blackView.snp.makeConstraints { maker in
            maker.left.right.bottom.equalToSuperview()
            maker.height.equalToSuperview().dividedBy(10)
        }
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        let btn1 = UIButton()
        btn1.setImage(UIImage(named: "Home"), for: .normal)
        let btn2 = UIButton()
        btn2.setImage(UIImage(named: "Discover"), for: .normal)
        let btn3 = UIButton()
        btn3.setImage(UIImage(named: "Button Shape"), for: .normal)
        let btn4 = UIButton()
        btn4.setImage(UIImage(named: "Inbox"), for: .normal)
        let btn5 = UIButton()
        btn5.setImage(UIImage(named: "Me"), for: .normal)
        
        stackView.addArrangedSubview(btn1)
        stackView.addArrangedSubview(btn2)
        stackView.addArrangedSubview(btn3)
        stackView.addArrangedSubview(btn4)
        stackView.addArrangedSubview(btn5)
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { maker in
            maker.left.right.bottom.equalToSuperview().inset(15)
            maker.height.equalToSuperview().dividedBy(10)
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoLinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return CustomTTCell(link: videoLinks[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }

}

