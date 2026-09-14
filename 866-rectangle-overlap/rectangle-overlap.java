class Solution {
    public boolean isRectangleOverlap(int[] rec1, int[] rec2) {
        int ws=Math.max(rec1[0],rec2[0]);
        int wf=Math.min(rec1[2],rec2[2]);

        int hs=Math.max(rec1[1],rec2[1]);
        int hf=Math.min(rec1[3],rec2[3]);

        int width=wf-ws;
        int height=hf-hs;

        int area=height*width;
        
        return width > 0 && height > 0;
    }
}