public class WikipediaMapReduceByKey {
    public static void main(String[] args) {
        SparkConf conf = new SparkConf()
                .setAppName("wikipedia-mapreduce-by-key");
        JavaSparkContext sc = new JavaSparkContext(conf);
        sc.textFile("/Users/aseigneurin/dev/spark-sandbox/data/wikipedia-pagecounts/pagecounts-20141101-*")
                .map(line -> line.split(" "))
                .mapToPair(s -> new Tuple2<String, Long>(s[0], Long.parseLong(s[2])))
                .reduceByKey((x, y) -> x + y)
                .sortByKey()
                .foreach(t -> System.out.println(t._1 + " -> " + t._2));
    }
} 

// import static spark.Spark.*;

// public class Main {
//     public static void main(String[] args) {
//         get("/hello", (req, res) -> "Hello World");
//     }
// }