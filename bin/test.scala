import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._

  def main(args: Array[String]) {
    val sc = new SparkContext()
    sc.stop()
  }