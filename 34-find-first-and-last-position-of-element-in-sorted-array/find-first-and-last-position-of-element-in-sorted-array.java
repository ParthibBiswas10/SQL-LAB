class Solution {
    public int[] searchRange(int[] nums, int target) {
       
        /*for(int i=0;i<nums.length;i++){
            if(nums[i]==target){
                if(count==0){
                    min=i;
                    max=i;
                }
                else
                    max=i;
                count++;
            }
            
        }
        if (count==0) return new int[]{-1,-1};
        else return new int[]{min,max};*/

        //leftmosrt
        int b=0;
        int e=nums.length-1;
        int mid=0;
        int[] ans={-1,-1};
        int count=0;
        while(b<=e){
            mid=b+(e-b)/2;
            if(target>nums[mid]){
                b=mid+1;
            }
            else if(target<nums[mid]){
                e=mid-1;
            }
            else if(target==nums[mid]){
               
                    ans[0]=mid;
                   e=mid-1;
              
            }
        }

        //rightmost

         b=0;
         e=nums.length-1;
         
        while(b<=e){
            mid=b+(e-b)/2;
            if(target>nums[mid]){
                b=mid+1;
            }
            else if(target<nums[mid]){
                e=mid-1;
            }
            else if(target==nums[mid]){
               
                    ans[1]=mid;
                   b=mid+1;
   
            }
        }

    return ans;
    }
}