//
//  DetailViewController.swift
//  SnapKit_t
//
//  Created by Curry Lee on 2020/06/23.
//  Copyright © 2020 wanseok lee. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
  
    // 상단메뉴
    lazy var headerMenuView = UIView()
    // 하단메뉴
    lazy var footerMenuView = UIView()
    // 내부 컨텐츠
    lazy var cScrollView = UIScrollView()
    lazy var contentsView = UIView()
    lazy var cSlideView = UIView()
    lazy var cSlideCollectionView = UICollectionView()
    // 레이블
    let nameLabel = UILabel()
    let ageLabel = UILabel()
    let locationLabel = UILabel()
    let distanceLabel = UILabel()
    let heightLabel = UILabel()
    let bloodtypeLabel = UILabel()
    let verifymobileLabel = UILabel()
    let educationLabel = UILabel()
    let occupationLabel = UILabel()
    let descriptionLabel = UILabel()
    let religionLabel = UILabel()
    let smokeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataNode()
        initViewNode()
    }
    
    // 뷰컨 데이터 관련 로드및 초기화
    func initDataNode(){
    }
    //뷰컨 UI요소들 초기화
    func initViewNode(){
        initHeaderMenu()
        initFotterMenu()
        initContentView()
        initTopSlideView()
    }
    
    func initHeaderMenu(){
        // 상단 메뉴 생성및 초기화
        //baseView 생성
        self.view.addSubview(headerMenuView)
        headerMenuView.snp_makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(60)
        }
        
        //back 버튼 생성
        let backButton = UIButton()
        backButton .setImage(UIImage.init(named: "back_btn.png"), for: UIControl.State.normal)
        headerMenuView.addSubview(backButton)
        backButton.snp_makeConstraints { (make) in
            make.centerY.equalTo(headerMenuView)
            make.leading.equalTo(12)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        //신고 버튼 생성
        let reportButton = UIButton()
        reportButton .setImage(UIImage.init(named: "voice_talk_report_icon.png"), for: UIControl.State.normal)
        headerMenuView.addSubview(reportButton)
        reportButton.snp_makeConstraints { (make) in
            make.centerY.equalTo(headerMenuView)
            make.trailing.equalTo(-12)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        //레이블 생성
        let headerLabel = UILabel()
        headerLabel.text = "프로필"
        headerLabel.textColor = .black
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        headerMenuView.addSubview(headerLabel)
        headerLabel.snp_makeConstraints { (make) in
            make.leading.equalTo(backButton.snp_trailingMargin).offset(10)
            make.centerY.equalTo(headerMenuView)
            make.height.equalTo(30)
            
        }
    }
    
    func initFotterMenu(){
        //하단 메뉴 생성및 초기화
        //baseView 생성
        self.view.addSubview(footerMenuView)
        footerMenuView.backgroundColor = .clear
        footerMenuView.snp_makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottomMargin)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(100)
        }
        
        //별로에요 버튼
        let noButton = UIButton()
        noButton .setImage(UIImage.init(named: "profile_bad_btn_off.png"), for: UIControl.State.normal)
        noButton.imageView?.contentMode = .scaleAspectFit
        footerMenuView.addSubview(noButton)
        noButton.snp_makeConstraints { (make) in
            make.centerY.equalTo(footerMenuView)
            make.leading.equalTo(0)
            make.height.equalTo(footerMenuView)
            make.width.equalTo(footerMenuView).dividedBy(2)
        }
        
        //괜찮아요 버튼
        let yesButton = UIButton()
        yesButton .setImage(UIImage.init(named: "profile_good_btn_off.png"), for: UIControl.State.normal)
        yesButton.imageView?.contentMode = .scaleAspectFit
        footerMenuView.addSubview(yesButton)
        yesButton.snp_makeConstraints { (make) in
            make.centerY.equalTo(footerMenuView)
            make.trailing.equalTo(0)
            make.height.equalTo(footerMenuView)
            make.width.equalTo(footerMenuView).dividedBy(2)
        }
    }
    
    func initContentView(){
        // 스크롤뷰 생성
        self.view.addSubview(cScrollView)
        cScrollView.backgroundColor = .white
        cScrollView.snp_makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(headerMenuView.snp_bottom)
            make.bottom.equalTo(footerMenuView.snp_top)
        }
        
        cScrollView.addSubview(contentsView)
        contentsView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(cScrollView)
            make.left.right.equalTo(self.view)
            make.width.equalTo(cScrollView)
            make.height.equalTo(cScrollView).priorityLow()
            make.edges.equalTo(cScrollView)
        }
        
        // 상단 슬라이드뷰
        contentsView.addSubview(cSlideView)
        cSlideView.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.right.equalTo(contentsView)
            make.width.equalTo(contentsView)
            make.height.equalTo(contentsView.snp_width)
        }
        
        // 정보1 뷰 (이름,나이,지역,거리,키,혈액형)
        let cinfo1View = UIView()
        contentsView.addSubview(cinfo1View)
        cinfo1View.snp.makeConstraints { (make) in
            make.top.equalTo(cSlideView.snp_bottom)
            make.left.right.equalTo(contentsView)
            make.width.equalTo(contentsView)
            make.height.equalTo(120)
        }
        
        // 이름
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.text = "이무명"
        cinfo1View.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.leading.equalTo(12)
            make.height.equalTo(20)
        }
        
        // 나이
        ageLabel.font = UIFont.boldSystemFont(ofSize: 18)
        ageLabel.text = "32" + "살"
        cinfo1View.addSubview(ageLabel)
        ageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.leading.equalTo(nameLabel.snp_trailingMargin).offset(15)
            make.height.equalTo(20)
        }
        
        // 지역
        locationLabel.font = UIFont.systemFont(ofSize: 15)
        locationLabel.text = "화성"
        cinfo1View.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(45)
            make.leading.equalTo(12)
            make.height.equalTo(20)
        }
        
        // 거리
        distanceLabel.font = UIFont.systemFont(ofSize: 15)
        distanceLabel.text = ""
        cinfo1View.addSubview(distanceLabel)
        distanceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(45)
            make.leading.equalTo(locationLabel.snp_trailingMargin).offset(15)
            make.height.equalTo(20)
        }
        
        // 키
        heightLabel.font = UIFont.systemFont(ofSize: 15)
        heightLabel.text = "172" + "cm"
        cinfo1View.addSubview(heightLabel)
        heightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(75)
            make.leading.equalTo(12)
            make.height.equalTo(20)
        }
        
        // 혈액형
        bloodtypeLabel.font = UIFont.systemFont(ofSize: 15)
        bloodtypeLabel.text = "O" + "형"
        cinfo1View.addSubview(bloodtypeLabel)
        bloodtypeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(75)
            make.leading.equalTo(heightLabel.snp_trailingMargin).offset(15)
            make.height.equalTo(20)
        }
        
        // 전화번호 인증
        verifymobileLabel.font = UIFont.systemFont(ofSize: 13)
        cinfo1View.addSubview(verifymobileLabel)
        verifymobileLabel.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.trailing.equalTo(-12)
            make.height.equalTo(20)
        }
        
        let verifymobileImgV = UIButton()
        verifymobileImgV .setImage(UIImage.init(named: "profile_phone_mark_icon.png"), for: UIControl.State.normal)
        cinfo1View.addSubview(verifymobileImgV)
        verifymobileImgV.snp.makeConstraints { (make) in
            make.centerY.equalTo(verifymobileLabel)
            make.trailing.equalTo(verifymobileLabel.snp_leading).offset(-10)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        // 밑줄
        let underLine = UIView()
        cinfo1View.addSubview(underLine)
        underLine.backgroundColor = .lightGray
        underLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(cinfo1View.snp_bottomMargin)
            make.trailing.equalTo(0)
            make.leading.equalTo(0)
            make.height.equalTo(0.5)
        }
        
        // 정보2 뷰 (학교,직업,내소개)
        let cinfo2View = UIView()
        contentsView.addSubview(cinfo2View)
        cinfo2View.snp.makeConstraints { (make) in
            make.top.equalTo(cinfo1View.snp_bottomMargin)
            make.left.right.equalTo(contentsView)
            make.width.equalTo(contentsView)
        }
        
        // 학교
        educationLabel.font = UIFont.systemFont(ofSize: 18)
        educationLabel.text = "ㅇㅇ대학교"
        cinfo2View.addSubview(educationLabel)
        educationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.leading.equalTo(cinfo2View.snp_leadingMargin).offset(120)
            make.height.equalTo(20)
        }
        let teducationLabel = UILabel()
        teducationLabel.font = UIFont.systemFont(ofSize: 14)
        teducationLabel.textColor = .lightGray
        teducationLabel.text = "학교"
        cinfo2View.addSubview(teducationLabel)
        teducationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(educationLabel)
            make.leading.equalTo(20)
            make.height.equalTo(20)
        }
        
        // 직업
        occupationLabel.font = UIFont.systemFont(ofSize: 18)
        occupationLabel.text = "개발자"
        cinfo2View.addSubview(occupationLabel)
        occupationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(educationLabel.snp_bottom).offset(20)
            make.leading.equalTo(cinfo2View.snp_leadingMargin).offset(120)
            make.height.equalTo(20)
        }
        let toccupationLabel = UILabel()
        toccupationLabel.font = UIFont.systemFont(ofSize: 14)
        toccupationLabel.textColor = .lightGray
        toccupationLabel.text = "직업"
        cinfo2View.addSubview(toccupationLabel)
        toccupationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(teducationLabel.snp_bottom).offset(20)
            make.leading.equalTo(20)
            make.height.equalTo(20)
        }
        
        // 내소개
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.text = "내소개 내소개 내소개 내소개 내소개내소개 내소개내소개 내소개내소개내소개 내소개내소개내소개"
        cinfo2View.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(occupationLabel.snp_bottom).offset(20)
            make.leading.equalTo(cinfo2View.snp_leadingMargin).offset(120)
            //make.height.equalTo(50)
            make.width.equalTo(250)
            make.bottom.equalTo(cinfo2View.snp_bottomMargin).offset(-20)
        }
        let tdescriptionLabel = UILabel()
        tdescriptionLabel.font = UIFont.systemFont(ofSize: 14)
        tdescriptionLabel.textColor = .lightGray
        tdescriptionLabel.text = "내 소개"
        cinfo2View.addSubview(tdescriptionLabel)
        tdescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(toccupationLabel.snp_bottom).offset(20)
            make.leading.equalTo(20)
            make.height.equalTo(20)
        }
        
        // 밑줄2
        let underLine2 = UIView()
        cinfo2View.addSubview(underLine2)
        underLine2.backgroundColor = .lightGray
        underLine2.snp.makeConstraints { (make) in
            make.bottom.equalTo(cinfo2View.snp_bottomMargin)
            make.trailing.equalTo(0)
            make.leading.equalTo(0)
            make.height.equalTo(0.5)
        }
        
        // 정보3 뷰 (종교,흡연)
        let cinfo3View = UIView()
        contentsView.addSubview(cinfo3View)
        cinfo3View.snp.makeConstraints { (make) in
            make.top.equalTo(cinfo2View.snp_bottom)
            make.left.right.equalTo(contentsView)
            make.width.equalTo(contentsView)
            make.height.equalTo(100)
            make.bottom.equalTo(contentsView.snp_bottom)
        }
        
        // 종교
        religionLabel.font = UIFont.systemFont(ofSize: 18)
        religionLabel.text = "무교"
        cinfo3View.addSubview(religionLabel)
        religionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.leading.equalTo(cinfo3View.snp_leadingMargin).offset(120)
            make.height.equalTo(20)
        }
        let treligionLabel = UILabel()
        treligionLabel.font = UIFont.systemFont(ofSize: 14)
        treligionLabel.textColor = .lightGray
        treligionLabel.text = "종교"
        cinfo3View.addSubview(treligionLabel)
        treligionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.leading.equalTo(20)
            make.height.equalTo(20)
        }
        
        // 흡연
        smokeLabel.font = UIFont.systemFont(ofSize: 18)
        smokeLabel.text = "비흡연"
        cinfo3View.addSubview(smokeLabel)
        smokeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(religionLabel.snp_bottomMargin).offset(30)
            make.leading.equalTo(cinfo3View.snp_leadingMargin).offset(120)
            make.height.equalTo(20)
        }
        let tsmokeLabel = UILabel()
        tsmokeLabel.font = UIFont.systemFont(ofSize: 14)
        tsmokeLabel.textColor = .lightGray
        tsmokeLabel.text = "흡연"
        cinfo3View.addSubview(tsmokeLabel)
        tsmokeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(treligionLabel.snp_bottomMargin).offset(30)
            make.leading.equalTo(20)
            make.height.equalTo(20)
        }
    }
    
    func initTopSlideView(){
        //cSlideCollectionView
        let flowLayout = UICollectionViewFlowLayout()
        let cellSize: CGRect = UIScreen.main.bounds
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: cellSize.size.width, height: cellSize.size.width)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.minimumInteritemSpacing = 0.0
        
        cSlideCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        cSlideCollectionView.isPagingEnabled = true
        
        cSlideCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "slideCell")
        cSlideCollectionView.delegate = self
        cSlideCollectionView.dataSource = self
        cSlideCollectionView.backgroundColor = UIColor.cyan
        
        cSlideView .addSubview(cSlideCollectionView)
        
        cSlideCollectionView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(cSlideView)
            make.leading.trailing.equalTo(cSlideView)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slideCell", for: indexPath)
        cell.backgroundColor = UIColor.gray
        if indexPath.row == 1 {
            cell.backgroundColor = UIColor.darkGray
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let screenSize: CGRect = UIScreen.main.bounds
        
        let width = (screenSize.width)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
