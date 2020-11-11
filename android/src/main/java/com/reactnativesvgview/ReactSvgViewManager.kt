package com.reactnativesvgview

import android.graphics.drawable.PictureDrawable
import android.net.Uri
import androidx.appcompat.widget.AppCompatImageView
import com.bumptech.glide.RequestBuilder
import com.facebook.react.bridge.UiThreadUtil
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp
import com.reactnativesvgview.glide.GlideApp
import com.reactnativesvgview.glide.GlideRequests
import com.reactnativesvgview.glide.SvgSoftwareLayerSetter
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
    val uri: Uri = Uri.parse(source)
    backgroundExecutor.execute {
      val file = svgProcessingRequestBuilder.load(uri).submit().get()
      UiThreadUtil.runOnUiThread {
        mainRequestBuilder.load(file).into(view)
      }
    }
  }
}
