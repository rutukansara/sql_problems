class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        hashmap = {}
        for i, n in enumerate(nums):
            number = target - n
            if number in hashmap:
                return [hashmap[number], i]
            else:
                hashmap[n] = i