// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

import SlimSelect from 'slim-select'


// on document ready

document.addEventListener("turbo:load", function() {
  new SlimSelect({
    select: '#user_categories_list'
  })
});
