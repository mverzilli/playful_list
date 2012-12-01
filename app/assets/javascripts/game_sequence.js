
$(function() {
  var sequence_data = {
    goal : [ 
      { key : "a", visible : true },
      { key : "b", visible : true },
      { key : "a", visible : true },
      { key : "b", visible : false },
      { key : "a", visible : false },
      { key : "b", visible : false },
    ],
    elements : {
      "a" : "/assets/square-red.png",
      "b" : "/assets/square-green.png"
    },
    timeout_sec : 10,
  };

  function BucketViewModel(element, json_elements) {
    var self = this;
    ko.mapping.fromJS(element, {}, self);
    
    self.image = ko.observable(json_elements[element.key]);
  }
  
  function OptionViewModel(element, game) {
    var self = this;
    ko.mapping.fromJS(element, {}, self);
    
    self.hightlight = ko.observable(false);
    
    self.choosed = function() {
      game.process_user_response(self.key());
    };
  }
  
  function GameViewModel() {
    var self = this;
    
    self.sequence = ko.observableArray();
    self.elements = ko.observableArray();
    self.original_data = null;
    self.timeout_timer = null;
    
    self.restart = function() {
      self.invalidate_timeout_timer();
      self.load_sequence(self.original_data);
    };
    
    self.invalidate_timeout_timer = function() {
      if (self.timeout_timer != null) {
        clearTimeout(self.timeout_timer);
        self.timeout_timer = null;
      }
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
        self.sequence.push(new BucketViewModel(e, data.elements));
      });
      
      self.invalidate_timeout_timer();
      self.timeout_timer = window.setTimeout(window.game_finished_timeout, data.timeout_sec * 1000);
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
      }
      
      if (self.finished()) {
        self.invalidate_timeout_timer();
        
        if (self.hint_used) {
          window.setTimeout(function(){
            self.restart();
          }, 1500);
        } else {
          game_finished_success();
        }
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
  
  var view_model = new GameViewModel();
  view_model.load_sequence(sequence_data);
  
  ko.applyBindings(view_model, $("#sequence-board")[0]);
  
});