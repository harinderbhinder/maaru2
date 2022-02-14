// Code generated by moshi-kotlin-codegen. Do not edit.
package app.loup.geolocation.data

import com.squareup.moshi.JsonAdapter
import com.squareup.moshi.JsonReader
import com.squareup.moshi.JsonWriter
import com.squareup.moshi.Moshi
import com.squareup.moshi.internal.Util
import java.lang.NullPointerException
import java.lang.reflect.Constructor
import kotlin.Any
import kotlin.Boolean
import kotlin.Int
import kotlin.String
import kotlin.Suppress
import kotlin.collections.emptySet
import kotlin.jvm.Volatile
import kotlin.text.buildString

@Suppress("DEPRECATION", "unused", "ClassName", "REDUNDANT_PROJECTION")
class ResultJsonAdapter(
  moshi: Moshi
) : JsonAdapter<Result>() {
  private val options: JsonReader.Options = JsonReader.Options.of("isSuccessful", "data", "error")

  private val booleanAdapter: JsonAdapter<Boolean> = moshi.adapter(Boolean::class.java, emptySet(),
      "isSuccessful")

  private val nullableAnyAdapter: JsonAdapter<Any?> = moshi.adapter(Any::class.java, emptySet(),
      "data")

  private val nullableErrorAdapter: JsonAdapter<Result.Error?> =
      moshi.adapter(Result.Error::class.java, emptySet(), "error")

  @Volatile
  private var constructorRef: Constructor<Result>? = null

  override fun toString(): String = buildString(28) {
      append("GeneratedJsonAdapter(").append("Result").append(')') }

  override fun fromJson(reader: JsonReader): Result {
    var isSuccessful: Boolean? = null
    var data: Any? = null
    var error: Result.Error? = null
    var mask0 = -1
    reader.beginObject()
    while (reader.hasNext()) {
      when (reader.selectName(options)) {
        0 -> isSuccessful = booleanAdapter.fromJson(reader) ?:
            throw Util.unexpectedNull("isSuccessful", "isSuccessful", reader)
        1 -> {
          data = nullableAnyAdapter.fromJson(reader)
          // $mask = $mask and (1 shl 1).inv()
          mask0 = mask0 and 0xfffffffd.toInt()
        }
        2 -> {
          error = nullableErrorAdapter.fromJson(reader)
          // $mask = $mask and (1 shl 2).inv()
          mask0 = mask0 and 0xfffffffb.toInt()
        }
        -1 -> {
          // Unknown name, skip it.
          reader.skipName()
          reader.skipValue()
        }
      }
    }
    reader.endObject()
    @Suppress("UNCHECKED_CAST")
    val localConstructor: Constructor<Result> = this.constructorRef ?:
        Result::class.java.getDeclaredConstructor(Boolean::class.javaPrimitiveType, Any::class.java,
        Result.Error::class.java, Int::class.javaPrimitiveType,
        Util.DEFAULT_CONSTRUCTOR_MARKER).also { this.constructorRef = it }
    return localConstructor.newInstance(
        isSuccessful ?: throw Util.missingProperty("isSuccessful", "isSuccessful", reader),
        data,
        error,
        mask0,
        null
    )
  }

  override fun toJson(writer: JsonWriter, value: Result?) {
    if (value == null) {
      throw NullPointerException("value was null! Wrap in .nullSafe() to write nullable values.")
    }
    writer.beginObject()
    writer.name("isSuccessful")
    booleanAdapter.toJson(writer, value.isSuccessful)
    writer.name("data")
    nullableAnyAdapter.toJson(writer, value.data)
    writer.name("error")
    nullableErrorAdapter.toJson(writer, value.error)
    writer.endObject()
  }
}