
$(function() {
  function BucketViewModel(element, json_elements, game) {
    var self = this;
    ko.mapping.fromJS(element, {}, self);
    
    self.size_px = ko.computed(function(){
      return game.sequence_size() + 'px'
    });
    self.image = ko.observable(json_elements[element.key]);
  }

  function OptionViewModel(element, game) {
    var self = this;
    ko.mapping.fromJS(element, {}, self);

    self.hightlight = ko.observable(false);

    self.choosed = function() {
      game.process_user_response(self.key());
    };

    self.size_px = ko.computed(function(){
      return game.sequence_size() + 'px'
    });
  }

  function GameViewModel() {
    var self = this;

    self.sequence = ko.observableArray();
    self.elements = ko.observableArray();
    self.original_data = null;
    self.timeout_timer = null;
    self.sequence_size = ko.observable(128);

    self.restart = function() {
      self.load_sequence(self.original_data);
    };

    self.invalidate_timeout_timer = function() {
      if (self.timeout_timer != null) {
        clearTimeout(self.timeout_timer);
        self.timeout_timer = null;
      }
    }

    self.initialize_timeout_timer = function() {
      self.invalidate_timeout_timer();
      self.timeout_timer = window.setTimeout(function(){
        self.process_user_response(null);
      }, self.original_data.timeout_sec * 1000);
    }

    self.load_sequence = function(data) {
      self.hint_used = false;
      self.original_data = data;

      self.elements.removeAll();
      $.each(data.elements, function(key, image){
        self.elements.push(new OptionViewModel({key : key, image: image}, self));
      });

      self.sequence.removeAll();
      $.each(data.goal, function(i, e){
        self.sequence.push(new BucketViewModel(e, data.elements, self));
      });

      self.initialize_timeout_timer();
    };

    self.process_user_response = function(key) {
      var guess = self.current_guess();

      if (guess.key() == key) {
        guess.visible(true);

        // ensure no option is highlighted (actual the one that has been pressed)
        self.get_option_for_key(guess.key()).hightlight(false);

      } else {
        self.hint_used = true;
        self.get_option_for_key(guess.key()).hightlight(true);
        window.stats['hints'] += 1;
        if (key == null) window.playSound('call-to-action');
      }

      if (self.finished()) {
        self.invalidate_timeout_timer();
        window.playSound('iteration-complete', function() {
          if (self.hint_used && window.stats['attempts'] < 2) {
            window.stats['attempts'] += 1;
            window.setTimeout(function(){
              self.restart();
            }, 1500);
          } else {
            game_finished_success();
          }
        })
      } else {
        if (guess.key() == key)
          window.playSound('correct')
        else
          window.stats['errors'] = window.stats['errors'] + 1;

        if (window.stats['errors'] > 5) window.game_finished_too_many_attempts();

        // play small reinforcement
        self.initialize_timeout_timer();
      }
    };

    self.current_guess = function() {
      var res = null;
      $.each(self.sequence(), function(i, e) {
        if (!e.visible()) {
          res = e;
          return false;
        }
      });
      return res;
    };

    self.finished = function() {
      return self.current_guess() == null;
    }

    self.get_option_for_key = function(key) {
      var res = null;
      $.each(self.elements(), function(i,e) {
        if (e.key() == key) {
          res = e;
          return false;
        }
      });
      return res;
    };
  }

  window.play_sequence = function(data) {
    var view_model = new GameViewModel();
    view_model.load_sequence(data);
    window.foo = view_model;
    var perform_layout = function(){
      view_model.sequence_size(Math.floor($(".row.sequence").width() / view_model.sequence().length) - 10);
    };
    perform_layout();
    $(window).resize(perform_layout);
        
    ko.applyBindings(view_model, $("#sequence-board")[0]);
    
    $('html, body').scrollTop($("#sequence-board").offset().top);
  }

});
