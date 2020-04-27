public class KeyGenerator {


    private int[] asciiArray = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' ',',','.','!','-','?'};
    private int state = 1;
    private int bit = 1;
    private final int FIVE_BIT_MASK = 0x0000001f;
    private final int THRITY_BIT_MASK = 0x3fffffff;
    private Integer[] key = {0x48756c6b,0x20697320,0,0}; //first two Integers are "Hulk is "
    private int lfsr(){
        bit = ((state >>> 0) ^ (state >>> 1) ^ (state >>> 4) ^ (state >>> 6));
        this.state =  (state >>> 1) | (bit << 29) & THRITY_BIT_MASK;
        return this.state;
    }

    public Integer[] generateKeyLowerCase(){

        int tmp = lfsr();
        key[2] = 0;
        key[3] = 0;
        for (int i=0;i<3;i++){
            key[3] += asciiArray[(tmp & FIVE_BIT_MASK)];
            tmp = tmp >>> 5;
            key[3] = key[3] << 8;
        }
        key[3] += asciiArray[(tmp & FIVE_BIT_MASK)];
        tmp = tmp >>> 5;
        key[2] += asciiArray[(tmp & FIVE_BIT_MASK)];
        tmp = tmp >>> 5;
        key[2] = key[2] << 8;
        key[2] += asciiArray[(tmp & FIVE_BIT_MASK)];
        key[2] += 0x74680000;

        return key;
    }

/*    public static void main(String[] args){
        System.out.println(new KeyGenerator().asciiArray.length);
        KeyGenerator keygen = new KeyGenerator();
        int counter = 0;
        int check = 0;
        do {
            check = keygen.lfsr();
            counter++;
            System.out.println(check);
        }
        while(check != 1);
        System.out.println(counter);
    }*/

}
