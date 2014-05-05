package teammates.common.datatransfer;

import teammates.common.util.StringHelper;

public class FeedbackNumericalScaleResponseDetails extends
        FeedbackAbstractResponseDetails {
    private double answer;
    
    public FeedbackNumericalScaleResponseDetails() {
        super(FeedbackQuestionType.NUMSCALE);
    }
    
    public FeedbackNumericalScaleResponseDetails(double answer) {
        super(FeedbackQuestionType.NUMSCALE);
        this.answer = answer;
    }
    
    @Override
    public String getAnswerString() {
        return StringHelper.toDecimalFormatString(answer);
    }

    @Override
    public String getAnswerHtml() {
        return getAnswerString();
    }

    @Override
    public String getAnswerCsv(FeedbackAbstractQuestionDetails questionDetails) {
        return getAnswerString();
    }

}
