Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

# How to use the modals:

When you want to add a modal all you need to do is create a partial erb in `views/modals` with the modal structure in that file, like this:
```html
<div class="modal-wrapper">
  <div class="modal-content">
    <!-- Your modal stuff goes here -->
  </div>
</div>
```
and in the page where you want to show that modal, you need to update your HTML structure to be like so:
```html
<!-- The data-controller attribute needs to go on the highest parent of the page -->
<div data-controller="display-modal">
  <!-- data-modal needs to have it's value replaced by the modal of the same name as you created the partial, if you created a partial with spaces in the name (_edit_game.html.erb) you exclude the first underscore and keep the rest (data-modal="edit_game") -->
  <!-- You can add classes to this just don't remove the action or 'data-modal' -->
  <button data-action="click->display-modal#show" data-modal="MODALNAME">BUTTON-TEXT</button>
</div>
```
With the way the modal is structured, clicking on the darkened background will close the modal and so will pressing the ESC key. If you want to add a close button, just create a `<button></button>` with `data-action="click->display-modal#hide"` attribute:

```html
<button data-action="click->display-modal#hide">Close</button>
```

If all goes well, you should have the modals automatically handled (if I didn't write stupid buggy code)
