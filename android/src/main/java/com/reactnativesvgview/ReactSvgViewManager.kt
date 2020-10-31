package com.reactnativesvgview

import android.graphics.drawable.PictureDrawable
import android.net.Uri
import androidx.appcompat.widget.AppCompatImageView
import com.bumptech.glide.RequestBuilder
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp
import com.reactnativesvgview.glide.GlideApp
import com.reactnativesvgview.glide.SvgSoftwareLayerSetter


class ReactSvgViewManager: SimpleViewManager<AppCompatImageView>() {

  private lateinit var requestBuilder: RequestBuilder<PictureDrawable>

  override fun createViewInstance(reactContext: ThemedReactContext): AppCompatImageView {
    requestBuilder = GlideApp.with(reactContext)
      .`as`(PictureDrawable::class.java)
      .listener(SvgSoftwareLayerSetter())
    return AppCompatImageView(reactContext);
  }

  override fun getName(): String {
    return "SvgView"
  }

  @ReactProp(name = "source")
  fun setSource(view: AppCompatImageView, source: String?) {
    val uri: Uri = Uri.parse(source)
    requestBuilder.load(uri).into(view)
  }
}
