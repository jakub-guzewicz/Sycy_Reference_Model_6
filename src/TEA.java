public class TEA {


    public static void encryptTEA (Integer[] v, Integer[] k) { //v[2] k[4]
        Integer v0=v[0], v1=v[1], sum=0, i;           /* set up */
        Integer delta=0x9E3779B9;                     /* a key schedule constant */
        Integer k0=k[0], k1=k[1], k2=k[2], k3=k[3];   /* cache key */
        for (i=0; i<32; i++) {                         /* basic cycle start */
            sum += delta;
            v0 += ((v1<<4) + k0) ^ (v1 + sum) ^ ((v1>>>5) + k1);
            v1 += ((v0<<4) + k2) ^ (v0 + sum) ^ ((v0>>>5) + k3);
        }                                              /* end cycle */
        v[0]=v0; v[1]=v1;
    }

    public static Integer[] decryptTEA (Integer[] v, Integer[] k) {
        Integer[] vr = new Integer[2];
        vr[0]=v[0];
        vr[1]=v[1];
        Integer sum=0xC6EF3720;                       /* set up; sum is 32*delta */
        Integer delta=0x9E3779B9;                     /* a key schedule constant */
        Integer k0=k[0], k1=k[1], k2=k[2], k3=k[3];   /* cache key */
        for (int i=0; i<32; i++) {                         /* basic cycle start */
            vr[1] -= ((vr[0]<<4) + k2) ^ (vr[0] + sum) ^ ((vr[0]>>>5) + k3);
            vr[0] -= ((vr[1]<<4) + k0) ^ (vr[1] + sum) ^ ((vr[1]>>>5) + k1);
            sum -= delta;
        }                                              /* end cycle */
        return vr;
    }


    public static Integer[] stringToAsciiArray(String str, int size){
        Integer[] result = new Integer[size];
        for (int i=0;i<result.length;i++){
            result[i]=0;
            for(int j=0;j<4;j++){
                char tmpChar = str.charAt(i*4+j);
                int tmpInt = tmpChar << (24-j*8);
                result[i] += tmpInt;
            }
        }
        return result;
    }
/*
    public static void main(String[] args){
        System.out.println("Test\nPrzed zakodowaniem:");
        String text = "%PDF-1.3";
        String key = "Hulk is the strongest";
        Integer[] v = stringToAsciiArray(text, 2);
        Integer[] k = stringToAsciiArray(key, 4);
        for(int n : v){
           System.out.print(Integer.toHexString(n));
        }
        System.out.println();
        for (int n : k){
            System.out.print(Integer.toHexString(n));
        }
        System.out.println();
        encryptTEA(v,k);
        System.out.println("Po zakodowaniu:");
        for(int n : v){
            System.out.print(Integer.toHexString(n));
        }
        System.out.println();
        for (int n : k){
            System.out.print(Integer.toHexString(n));
        }
        System.out.println("\nPo odkodowaniu:");
        decryptTEA(v,k);
        for(int n : v){
            System.out.print(Integer.toHexString(n));
        }
        System.out.println();
        for (int n : k){
            System.out.print(Integer.toHexString(n));
        }

    }*/
}
