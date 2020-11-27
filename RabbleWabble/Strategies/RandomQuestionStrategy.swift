//
//  RandomQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Milo Wyner on 11/23/20.
//

public class RandomQuestionStrategy: BaseQuestionStrategy {
    public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
        let questions = questionGroup.questions.shuffled()
        self.init(questionGroupCaretaker: questionGroupCaretaker, questions: questions)
    }
}
