
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
    }
  };

  function BucketViewModel(element, json_elements) {
    var self = this;
    ko.mapping.fromJS(element, {}, self);
    
    self.image = ko.observable(json_elements[element.key]);
  }
  
  function OptionViewModel(element, game) {
    var self = this;
    ko.mapping.fromJS(element, {}, self);
    
    self.choosed = function() {
      game.process_user_response(self.key());
    };
  }
  
  function GameViewModel() {
    var self = this;
    
    self.sequence = ko.observableArray();
    self.elements = ko.observableArray();
    
    self.load_sequence = function(data) {
      self.elements.removeAll();
      $.each(data.elements, function(key, image){
        self.elements.push(new OptionViewModel({key : key, image: image}, self));
      });
            
      self.sequence.removeAll();
      $.each(data.goal, function(i, e){
        self.sequence.push(new BucketViewModel(e, data.elements));
      });
    };
    
    self.process_user_response = function(key) {
      var guess = self.current_guess();
      
      if (guess.key() == key) {
        guess.visible(true);
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
    }
  }
  
  var view_model = new GameViewModel();
  view_model.load_sequence(sequence_data);
  
  ko.applyBindings(view_model, $("#sequence-board")[0]);
  
});