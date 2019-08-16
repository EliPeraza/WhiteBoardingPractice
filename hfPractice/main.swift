//
//  main.swift
//  hfPractice
//
//  Created by Elizabeth Peraza  on 8/15/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import Foundation

func isAnagram(firstWord: String, secondWord: String) -> Bool{
  guard firstWord.count == secondWord.count else {return false}
  return firstWord.sorted() == secondWord.sorted()
}
print(isAnagram(firstWord: "eli", secondWord: "lie"))

var xx = [1, 2, 7, 3, 9, 5]
func findGreatestProduct(arr: [Int]) -> Int {
  guard !arr.isEmpty else {return -1}
  var result = Int()
  var shadow = arr
  shadow.sort()
  result = shadow[shadow.count - 1] * shadow[shadow.count - 2]
  return result
}
print("Using sort on shadow variable: \(findGreatestProduct(arr: xx))")

func findGreatestProductSorted(arr: [Int]) -> Int {
  guard !arr.isEmpty else {return -1}
  var result = Int()
  var sortedArray = arr.sorted{$0<$1}
  result = sortedArray[sortedArray.count - 1] * sortedArray[sortedArray.count - 2]
  return result
}
print("Using HOF sorted: \(findGreatestProductSorted(arr: xx))")

func longWayToFindGreatest(arr: [Int]) -> Int {
  guard !arr.isEmpty else {return -1}
  var greatest = Int.min
  var secondGreatest = Int.min
  var result = Int()
  for number in arr {
    if number > greatest {
      greatest = number
    }
  }
  for number in arr where number != greatest {
    if number > secondGreatest {
      secondGreatest = number
    }
  }
  result = greatest * secondGreatest
  return result
}

print("Long way: \(longWayToFindGreatest(arr: xx))")

var x = [3, 4, 6, 10, 11, 15]
var y = [1, 5, 8, 12, 14, 19, 31]
func sortedArrays(arr1: [Int], arr2: [Int]) -> [Int] {
  var sortedArray = [Int]()
  var firstIndex = 0
  var secondIndex = 0
  while firstIndex < arr1.count && secondIndex < arr2.count {
    if arr1[firstIndex] < arr2 [secondIndex]{
      sortedArray.append(arr1[firstIndex])
      firstIndex += 1
    } else if arr1[firstIndex] > arr2[secondIndex] {
      sortedArray.append(arr2[secondIndex])
      secondIndex += 1
    } else {
      sortedArray.append(arr1[firstIndex])
      firstIndex += 1
      sortedArray.append(arr2[secondIndex])
      secondIndex += 1
    }
  }
  if firstIndex != arr1.count {
    sortedArray.append(contentsOf: arr1[firstIndex..<arr1.count])
  }
  if secondIndex != arr2.count {
    sortedArray.append(contentsOf: arr2[secondIndex..<arr2.count])
  }
  return sortedArray
}
print(sortedArrays(arr1: x, arr2: y))

var duplicateArray = [1,2,3,2,4,1]
func removeDuplicates(arr: [Int]) -> [Int]{
  let arrayNonDuplicates = Array(Set(arr))
  return arrayNonDuplicates
}
print("Removal of duplicates with sets: \(removeDuplicates(arr: duplicateArray))")

func genericNonDuplicates<T: Hashable>(arr: [T]) -> [T]{
  var arrayNonDuplicates = [T]()
  arrayNonDuplicates = Array(Set(arr))
  return arrayNonDuplicates
}
print("Removal of duplicates using set and generics: \(genericNonDuplicates(arr: duplicateArray))")

func longDuplicateRemoval(arr: [Int]) -> [Int] {
  var arrayNonDuplicates = [Int]()
  var dict = [Int: Int]()
  for num in arr {
    if dict[num] == nil {
      dict[num] = 1
      arrayNonDuplicates.append(num)
    }
  }
  return arrayNonDuplicates
}
print("Removal of duplicates using dictionary: \(longDuplicateRemoval(arr: duplicateArray))")

class Node<T>: CustomStringConvertible {
  var value: T
  var next: Node<T>?
  var description: String {
    guard let next = next else {return "\(value) is nil"}
    return "\(value) -> \(next)"
  }
  init(_ value:T){
    self.value = value
  }
}

var nodeA = Node("A")
var nodeB = Node("B")
var nodeC = Node("C")
var nodeD = Node("D")
nodeA.next = nodeB
nodeB.next = nodeC
nodeC.next = nodeD

func printNodes<T>(node: Node<T>){
  var currentNode = node
  while currentNode.next != nil {
    print(currentNode.value)
    if let nextNode = currentNode.next{
      currentNode = nextNode
    }
  }
}

print(printNodes(node: nodeA))

func mergeSort(arr: [Int]) -> [Int] {
  guard arr.count > 1 else {return arr}
  let middle = arr.count / 2
  let leftArray = mergeSort(arr: Array(arr[..<middle]))
  let rightArray = mergeSort(arr: Array(arr[middle...]))
  return merge(leftArray, rightArray)
}

func merge(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
  var sortedArray = [Int]()
  var leftIndex = 0
  var rightIndex = 0
  while leftIndex < leftArray.count && rightIndex < rightArray.count {
    if leftArray[leftIndex] < rightArray[rightIndex]{
      sortedArray.append(leftArray[leftIndex])
      leftIndex += 1
    } else if rightArray[rightIndex] < leftArray[leftIndex]{
      sortedArray.append(rightArray[rightIndex])
      rightIndex += 1
    } else {
      sortedArray.append(leftArray[leftIndex])
      leftIndex += 1
      sortedArray.append(rightArray[rightIndex])
      rightIndex += 1
    }
  }
  if leftIndex < leftArray.count {
    sortedArray.append(contentsOf: leftArray[leftIndex..<leftArray.count])
  }
  if rightIndex < rightArray.count {
    sortedArray.append(contentsOf: rightArray[rightIndex..<rightArray.count])
  }
  return sortedArray
}
var mergeTest = [10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26]
print(mergeSort(arr: mergeTest))

