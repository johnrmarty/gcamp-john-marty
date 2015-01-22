class FaqController < ApplicationController

    def index
      @question1 = Question.new
      @question1.question= "What is gCamp?"
      @question1.answer= "gCamp is an awesome tool that is going to change your life.  gCamp is your one stop shop to organize all your tasks.  You'll also be able to track comments that you and others make.  gCamp may eventually replace all need for paper and pens in the entire world.  Well, maybe not, but it's going to be pretty cool."
      @question1.slug= "What is gCamp?"

      @question2 = Question.new
      @question2.question= "How do I join gCamp?"
      @question2.answer= "As soon as it's ready for the public, you'll see a signup link in the upper right.  Once that's there, just click it and fill in the form!"
      @question2.slug= "How do I join gCamp?"


      @question3 = Question.new
      @question3.question= "When will gCamp be finished"
      @question3.answer= "As soon as it's ready for the public, you'll see a signup link in the upper right.  Once that's there, just click it and fill in the form!"
      @question3.slug= "When will gCamp be finished"

      @common_questions = [@question1, @question2, @question3 ]
end
end
