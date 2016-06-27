$(document).ready(function(){
  if ($('#negative-cloud').length > 0) {
    /*!
     * Create an array of word objects, each representing a word in the cloud
     */
    negWords = $('#negative-cloud').attr('neg-words')
    posWords = $('#positive-cloud').attr('pos-words')

    var negArray = negWords.split('-');
    var posArray = posWords.split('-');

    var negOccurences = {};
    var posOccurences = {};

    for(var i = 0; i < negArray.length; i++) {
      negOccurences[negArray[i]] = (negOccurences[negArray[i]] || 0) + 1;
    }

    for(var i = 0; i < posArray.length; i++) {
      posOccurences[posArray[i]] = (posOccurences[posArray[i]] || 0) + 1;
    }

    var negCloudArray = []
    for (var i = 0; i < Object.keys(negOccurences).length; i++) {
      negCloudArray[i] = {text: Object.keys(negOccurences)[i], weight: negOccurences[Object.keys(negOccurences)[i]]}
    }

    var posCloudArray = []
    for (var i = 0; i < Object.keys(posOccurences).length; i++) {
      posCloudArray[i] = {text: Object.keys(posOccurences)[i], weight: posOccurences[Object.keys(posOccurences)[i]]}
    }

    $(function() {
      // When DOM is ready, select the container element and call the jQCloud method, passing the array of words as the first argument.
      $("#negative-cloud").jQCloud(negCloudArray);
      $("#positive-cloud").jQCloud(posCloudArray);
    });
  }
});
