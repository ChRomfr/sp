<form method="post" action="" id="addQuestion" class="form">
	<h1>{$lang.Nouvelle_question}</h1>
	<dl>
		<dt><label for="question">{$lang.Question} :</label></dt>
		<dd><input type="text" name="Question[question]" id="question" class="validate[required]" size="60"/></dd>
	</dl>	
	<dl>
		<dt><label for="reply_choice">{$lang.Reponses} :</label></dt>
		<dd><input type="text" name="Question[reply_choice]" id="reply_choice" size="60"/><br/><span><small>{$lang.Explication_reply_choice}</small></span></dd>
	</dl>
	<dl>
		<dt><label for="multi_reply">{$lang.Plusieurs_reponses_possible} :</label></dt>
		<dd><input type="checkbox" name="Question[multi_reply]" id="multi_reply" /></dd>
	</dl>
	<div class="center">
		<input type="hidden" name="Question[questionnaire_id]" value="{$questionnaire_id}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>