/*

Understanding the Problem and Requirements

  -Input and Output
    -Input: two version numbers in string representation, version1 and version2
    -Output: one of the numbers [1, 0, -1]; or null for invalid inputs
  -Definitions and Rules
    -If any inputs contain invalid characters, return null
    -any characte4rs other than digits and . are conisered invalid
  -Compare the two input versions
    -if version1 > version 2, return 1
    -if ''       < ''       , return -1
    -if ''       = ''       , return 0

  -Specifics of comparison.
    -Check the first number of each version number.
      -If 1st.v1 < 1st.v2, return -1
      -If 1st.v1 > 1st.v2, return 1
      -If 1st.v1 = 1st.v2, check 2nd version number.
  Generalize:
    -Check the nth place of the version number.
      if both DNE: return 0.
      if only one of nth v1 or nth v2 DNE: assume 0.
      if nth v1 > nth v2 return 1
      if nth v1 < nth v2 return -1
      if nth v1 = nth v2 check (n+1)th version number.


*/

function validVersion(vn) {
  return /^\d+(\.\d+)*$/.test(vn);
}

function compareVersions(version1, version2) {
  if (!validVersion(version1) || !validVersion(version2)) return null;
  let array1 = version1.split('.').map(Number);
  let array2 = version2.split('.').map(Number);
  while (array1[0] !== undefined || array2[0] !== undefined) {
    let sv1 = array1[0] === undefined ? 0 : array1.shift();
    let sv2 = array2[0] === undefined ? 0 : array2.shift();
    if (sv1 < sv2) return -1;
    if (sv2 < sv1) return 1;
  }
  return 0;
}
console.log(compareVersions('0.1', '1'));
console.log(compareVersions('1', '1.0'));
console.log(compareVersions('1.0', '1.1'));
console.log(compareVersions('1.1', '1.2'));
console.log(compareVersions('1.2', '1.2.0.0'));
console.log(compareVersions('1.2.0.0', '1.18.2'));
console.log(compareVersions('1.18.2', '1.2.0.0'));
console.log(compareVersions('1.18.2', '13.37'));

