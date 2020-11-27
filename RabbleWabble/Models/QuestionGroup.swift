//
//  QuestionGroup.swift
//  RabbleWabble
//
//  Created by Milo Wyner on 11/18/20.
//

import Foundation

public class QuestionGroup: Codable {
    public class Score: Codable {
        public var correctCount = 0
        public var incorrectCount = 0
        public init() {}
    }
    public let questions: [Question]
    public var score: Score
    public let title: String
    
    public init(questions: [Question], score: Score = Score(), title: String) {
        self.questions = questions
        self.score = score
        self.title = title
    }
}
