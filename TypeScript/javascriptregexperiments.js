var stringToSearch ="john jones john"
var valueToFind="john"
var valueToReplace="jim"
var pattern =new RegExp(valueToFind)
var result=stringToSearch.split(valueToFind).join(valueToReplace)
console.log(result)


function getMatches(string, regex, index) {
    index || (index = 1); // default to the first capturing group
    var matches = [];
    var match;
    while (match = regex.exec(string)) {
      matches.push(match[index]);
    }
    return matches;
  }
  
  
  // Example :
  var myString = 'something format_abc something format_def something format_ghi';
  var myRegEx = /(?:^|\s)format_(.*?)(?:\s|$)/g;

// Get an array containing the first capturing group for every match
var matches = getMatches(myString, myRegEx, 1);

// Log results
console.log(matches.length + ' matches found: ' + JSON.stringify(matches))
console.log(matches);