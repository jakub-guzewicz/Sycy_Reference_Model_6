public class SycyReferenceModelTest {


    public static void main(String[] args) throws Exception {
        KeyGenerator keygen = new KeyGenerator();
        String text = "%PDF-1.3";
        Integer[] realKey = TEA.stringToAsciiArray("Hulk is the best", 4);
        Integer[] desiredValue = TEA.stringToAsciiArray(text,2);
        Integer[] v = TEA.stringToAsciiArray(text,2);
        for(int n : v){
            System.out.print(Integer.toHexString(n));
        }
        TEA.encryptTEA(v, realKey);
        Integer[] tmp = {0,0};
        Integer[] key = new Integer[4];
        int counter = 0;
        System.out.println();
        long startTime = System.nanoTime();
        while (!tmp[0].equals(desiredValue[0]) || !tmp[1].equals(desiredValue[1])){
            key = keygen.generateKeyLowerCase();
            tmp = TEA.decryptTEA(v,key);
            counter++;
//            System.out.println(counter + " " + key[2] + "" + key[3]);
//            if(counter++ > 1080000000)
//                throw new Exception("Counter out of range D:");
        }
        long endTime = System.nanoTime();
        System.out.println("Time in seconds: "+((endTime-startTime)/1_000_000_000));
        System.out.println("Number of iterations: "+counter);
        System.out.print("\nKey that we are looking for: ");
        for (Integer i : realKey){
            System.out.print(Integer.toHexString(i)+" ");
        }
        System.out.print("\nKey that we achieved:        ");
        for (Integer i : key){
            System.out.print(Integer.toHexString(i)+" ");
        }
    }

}
