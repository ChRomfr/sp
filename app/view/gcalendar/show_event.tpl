<div class="well">
	<h4>{$event->title}</h4>
	<div>{$event->content}</div>
	<div>{$event->when[0]->startTime|date_google_to_sql}</div>
	<div>{$event->when[0]->endTime|date_google_to_sql}</div>
</div>