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
  <!-- You can add classes to this just don't remove the action -->
  <button data-action="click->display-modal#show">BUTTON-TEXT</button>

  <!-- This needs to go at the very bottom of the page -->
  <!-- and change the data-modal attribute to be the name of the modal partial you created -->
  <div class="modal-root" data-display-modal-target="root" data-modal="MODALNAME"></div>
</div>
```

Then in the `modals_controller.rb` you need to add a method that renders the partial, matching the name of that partial, this is documented in that file.

And afterwards you need to add a route to that modal, this is also documented in `routes.rb`

With the way the modal is structured, clicking on the darkened background will close the modal and so will pressing the ESC key. If you want to add a close button, just create a `<button></button>` with `data-action="click->display-modal#hide"` attribute:

```html
<button data-action="click->display-modal#hide">Close</button>
```

If all goes well, you should have the modals automatically handled (if I didn't write stupid buggy code)
