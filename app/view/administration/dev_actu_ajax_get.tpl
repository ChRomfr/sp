<div class="showData">
  <h1>History of Goliath-software dev</h1>
  {foreach $Actus as $Row}
    <fieldset>
    <h4>{$Row.nom}</h4>
    {$Row.description}
    <div>Update : {$Row.date}</div>
    </fieldset>
  {/foreach}
</div>