public class StringListTest {
    public static List<String> generateStringList(Integer listLength) {
        List<String> resultList = new List<String>();
        for (Integer i = 0; i < listLength; i++) {
            resultList.add('Test ' + i);
        }
        return resultList;
    }
}
