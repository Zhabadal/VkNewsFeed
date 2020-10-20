//
//  NewsfeedInteractor.swift
//  VkNewsFeed
//
//  Created by Alexandr Badmaev on 09.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
    func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {
    
    var presenter: NewsfeedPresentationLogic?
    var service: NewsfeedService?
        
    func makeRequest(request: Newsfeed.Model.Request.RequestType) {
        if service == nil {
            service = NewsfeedService()
        }
        
        switch request {
        case .getNewsfeed:
            service?.getFeed(completion: { [weak self] (revealedPostIds, feedResponse) in
                self?.presenter?.presentData(response: .presentNewsfeed(feedResponse: feedResponse, revealedPostIds: revealedPostIds))
            })
        case .getUser:
            service?.getUser(completion: { [weak self] (userResponse) in
                self?.presenter?.presentData(response: .presentUserInfo(userResponse: userResponse))
            })
        case .revealPostIds(let postId):
            service?.revealPostIds(forPostId: postId, completion: { [weak self] (revealedPostIds, feedResponse) in
                self?.presenter?.presentData(response: .presentNewsfeed(feedResponse: feedResponse, revealedPostIds: revealedPostIds))
            })
        case .getNextBatch:
            self.presenter?.presentData(response: .presentFooterLoader)
            service?.getNextBatch(completion: { [weak self] (revealedPostIds, feedResponse) in
                self?.presenter?.presentData(response: .presentNewsfeed(feedResponse: feedResponse, revealedPostIds: revealedPostIds))
            })
        }
    }
        
}
