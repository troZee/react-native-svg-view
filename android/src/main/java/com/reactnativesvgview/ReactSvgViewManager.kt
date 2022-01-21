package com.reactnativesvgview

import android.graphics.drawable.PictureDrawable
import android.net.Uri
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi
import androidx.appcompat.widget.AppCompatImageView
import com.bumptech.glide.Glide
import com.bumptech.glide.RequestBuilder
import com.caverock.androidsvg.SVG
import com.facebook.react.bridge.UiThreadUtil
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp
import com.reactnativesvgview.glide.GlideApp
import com.reactnativesvgview.glide.GlideRequests
import com.reactnativesvgview.glide.SvgSoftwareLayerSetter
import java.io.ByteArrayInputStream
import java.nio.charset.StandardCharsets
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors


class ReactSvgViewManager: SimpleViewManager<AppCompatImageView>() {


  private lateinit var mainRequestBuilder: GlideRequests
  private lateinit var svgProcessingRequestBuilder: RequestBuilder<PictureDrawable>
  private val backgroundExecutor: ExecutorService = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors())

  override fun createViewInstance(reactContext: ThemedReactContext): AppCompatImageView {
    svgProcessingRequestBuilder = GlideApp.with(reactContext)
      .`as`(PictureDrawable::class.java)
      .listener(SvgSoftwareLayerSetter())
     mainRequestBuilder = GlideApp.with(reactContext)

    return AppCompatImageView(reactContext)
  }

  override fun getName(): String {
    return "SvgView"
  }

  @ReactProp(name = "source")
  fun setSource(view: AppCompatImageView, source: String?) {
    try {
      val uri: Uri = Uri.parse(source)
      backgroundExecutor.execute {
        val file = svgProcessingRequestBuilder.load(uri).submit().get()
        UiThreadUtil.runOnUiThread {
          mainRequestBuilder.load(file).into(view)
        }
      }
    } catch (e:Exception){
      Log.d("", "setSource: " + e.stackTrace)
    }
  }

  @RequiresApi(Build.VERSION_CODES.KITKAT)
  @ReactProp(name = "stringSource")
  fun setStringSource(view: AppCompatImageView, source: String?) {
    try {

      if(source == null){
        return
      }
//      val stream = ByteArrayInputStream(source.toByteArray(StandardCharsets.UTF_8));
//      Glide.with(view).load(stream).into(view)

      val svg = SVG.getFromString(source)
      val drawable = PictureDrawable(svg.renderToPicture())
      Glide.with(view)
        .load(drawable)
        .into(view)

    } catch (e:Exception){
      Log.d("", "setSource: " + e.stackTrace)
    }
  }

}
