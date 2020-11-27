//
//  SequentialQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Milo Wyner on 11/23/20.
//

public class SequentialQuestionStrategy: BaseQuestionStrategy {
    public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
        let questions = questionGroup.questions
        self.init(questionGroupCaretaker: questionGroupCaretaker, questions: questions)
    }
}
