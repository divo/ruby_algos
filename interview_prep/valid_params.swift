class Solution {
    func isValid(_ s: String) -> Bool {
    var parens: [Character] = []
    for char in s {
      let last = parens.last
      
      if (last == "(" && char == ")") ||
          (last == "{" && char == "}") ||
          (last == "[" && char == "]") {
        parens.removeLast()
      } else {
        parens.append(char)
      }
    }
    
    return parens.count == 0
  }
}
