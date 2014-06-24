var _ = function() {
  var removeDups = function(arr) {
    for (var i = 0; i < arr.length; i++) {
      var lastIndex;
      while ((lastIndex = arr.lastIndexOf(arr[i])) !== i) {
        arr.splice(lastIndex, 1);
      }
    }
    return arr;
  };
  var getAllKeys = function(obj) {
    var _ret = Object.keys(obj).concat(Object.getOwnPropertyNames(obj));
    for (var key in obj) {
      _ret.push(key);
    }
    _ret = _ret.map(function(e) {
      if (typeof obj[e] === 'function') {
        return e + '(';
      }
      return e;
    });
    if (obj.hasOwnProperty('prototype')) {
      _ret = _ret.concat(getAllKeys(obj.prototype));
    }
    return _ret;
  };
  var roots = Array.prototype.slice.call(arguments);
  var _ret = [];
  for (var i = 0; i < roots.length; i++) {
    _ret = _ret.concat(removeDups(getAllKeys(roots[i])));
  }
  _ret = removeDups(_ret
  .filter(function(e) {
    return e.charAt(0) !== '_' && e.charAt(0) !== '$';
  })
  .sort());
  console.log(_ret);
  copy('[\'' + _ret.join('\', \'') + '\']');
};
