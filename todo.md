todo

BEST ANSWER

<!-- make a form button -->
<!-- only visible to question author -->

<!-- button sets answer.best_answer = true -->

<!-- can only be set once for a question -->

<!-- validates_uniqueness_of :user_id, :scope => :question_id -->


<!-- show which answer is selected as best answer
 -->

<!-- next: display best answer at top -->

<!-- 
the creator can
chose the best answer
 -->
<!-- add questions on home page

add scores to question page -->

Stretch:
Responses should be sorted chronologically, with oldest first.

Answers should be sorted by "the best" first, followed by most highly-voted.
HOW TO GET THE MOST HIGHLY VOTED

Users should be able to see questions sorted three ways: highest-voted, most recent, and "trending."


For later
in answers model - add validation of only one best answer per question