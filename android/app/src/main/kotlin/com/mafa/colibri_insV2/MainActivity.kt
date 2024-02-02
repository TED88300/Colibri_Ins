package com.mafa.colibri_insV2


import android.Manifest
import android.annotation.SuppressLint
import android.annotation.TargetApi
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister
import io.flutter.plugin.common.MethodChannel
import java.util.HashMap
import android.content.pm.PackageManager

import android.content.pm.ApplicationInfo
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.os.Build
import android.os.Bundle
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import org.json.JSONException
import org.json.JSONObject
import java.lang.StringBuilder
import java.util.ArrayList

import com.cloudpos.POSTerminal
import com.cloudpos.printer.Format
import com.cloudpos.printer.PrinterDevice
//import sun.audio.AudioDevice.device



class MainActivity: FlutterActivity() {
    companion object {
        const val TAG = "MainActivity"
        const val CHANNEL = "com.kmtvision.pfo_enrolment_test"
    }
    private var activityCompletedCallBack: ActivityCompletedCallBack? = null

    var locationManager: LocationManager? = null
    var gps = false
    var network = false
    val LOCATION_CODE = 301

    var list: ArrayList<Any?> = ArrayList<Any?>()

    private val Px400_PrintCHANNEL = "Px400_Print"
    private var device: PrinterDevice? = null


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        Log.d(TAG, "configureFlutterEngine")
        GeneratedPluginRegister.registerGeneratedPlugins(flutterEngine)

/*        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, Px400_PrintCHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "Edition") {

                val PrintText = call.argument<String>("PrintText")
                val Fmt = call.argument<String>("Fmt")
                if (device == null) {
                    device = POSTerminal.getInstance(context)
                        .getDevice("cloudpos.device.printer") as PrinterDevice
                }

                device!!.open()

                try {
                    val format = Format()
                    format.setParameter(Format.FORMAT_FONT_SIZE, Format.FORMAT_FONT_SIZE_MEDIUM)
                    if (Fmt == "A")
                    {
                        format.setParameter(Format.FORMAT_FONT_SIZE, Format.FORMAT_FONT_SIZE_MEDIUM)
                        format.setParameter(Format.FORMAT_ALIGN, Format.FORMAT_ALIGN_CENTER)
                        format.setParameter(Format.FORMAT_DENSITY, Format.FORMAT_FONT_BOLD)

                    }
                    else if (Fmt == "B")
                    {
                        format.setParameter(Format.FORMAT_FONT_SIZE, Format.FORMAT_FONT_SIZE_MEDIUM)
                        format.setParameter(Format.FORMAT_ALIGN, Format.FORMAT_ALIGN_LEFT)
                    }


                    device!!.printText(format,  PrintText)


                } catch (e: java.lang.Exception) {

                }

                device!!.close()


                val iPrintText = PrintText?.length
                result.success(iPrintText)



            } else {
                result.notImplemented()
            }
        }*/

        // Channel
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "$CHANNEL/intent_result").setMethodCallHandler { call, result ->
            when(call.method) {

                "EditionON" -> {

                    Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", ">>>> EditionON")



                    if (device == null) {
                        Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "Edition: getDevice >")
                        device = POSTerminal.getInstance(context).getDevice("cloudpos.device.printer") as PrinterDevice
                        Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "Edition: getDevice <")
                    }
                    else
                    {
                        Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "device not NULL")

                    }





                    device!!.open()
                    Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "Edition: open")


                    Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "<<<< EditionON")

                }


                "EditionOFF" -> {

                    Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", ">>>> EditionOFF")

                    device!!.close()


                    Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "<<<< EditionOFF")

                }


                "Edition" ->{

                    val PrintText = call.argument<String>("PrintText")

                    val Size = call.argument<String>("Size")
                    val Align = call.argument<String>("Align")
                    val Density = call.argument<String>("Density")




                    try {

                        if (device == null) {
                            Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "Edition: getDevice >")
                            device = POSTerminal.getInstance(context).getDevice("cloudpos.device.printer") as PrinterDevice


                            Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "Edition: getDevice <")
                        }
                        else
                        {
                            Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "device not NULL")

                        }





                        device!!.open()
                        Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "Edition: open")


                        val format = Format()
                        format.setParameter(Format.FORMAT_FONT_SIZE, Format.FORMAT_FONT_SIZE_MEDIUM)
                        format.setParameter(Format.FORMAT_ALIGN, Format.FORMAT_ALIGN_LEFT)
                        format.setParameter(Format.FORMAT_DENSITY, Format.FORMAT_FONT_BOLD)

                        if (Size == "S")
                        {
                            format.setParameter(Format.FORMAT_FONT_SIZE, Format.FORMAT_FONT_SIZE_SMALL)
                        }
                        else if (Size == "M")
                        {
                            format.setParameter(Format.FORMAT_FONT_SIZE, Format.FORMAT_FONT_SIZE_MEDIUM)
                        }
                        else if (Size == "L")
                        {
                            format.setParameter(Format.FORMAT_FONT_SIZE, Format.FORMAT_FONT_SIZE_LARGE)
                        }

                        if (Align == "L")
                        {
                            format.setParameter(Format.FORMAT_ALIGN, Format.FORMAT_ALIGN_LEFT)
                        }
                        else if (Align == "C")
                        {
                            format.setParameter(Format.FORMAT_ALIGN, Format.FORMAT_ALIGN_CENTER)
                        }
                        else if (Align == "R")
                        {
                            format.setParameter(Format.FORMAT_ALIGN, Format.FORMAT_ALIGN_RIGHT)
                        }

                        if (Density == "B")
                        {
                            format.setParameter(Format.FORMAT_DENSITY, Format.FORMAT_FONT_BOLD )
                        }


                        Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "Edition: print >>>>")
                        device!!.printText(format,  PrintText)
                        Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "Edition: print <<<<")
                        device!!.close()


                    } catch (e: java.lang.Exception) {

                        Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "Edition: Exception")

                    }



                    val iPrintText = PrintText?.length
                    result.success(iPrintText)



                }
                

                "getLocation" ->{
                    val isOpen = isOPen

                    Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ MainActivity", "getLocation: ${isOpen}")


                    if (isOpen) {
                        Log.d("MainActivity", "getLocation: isOpen")
                        initLocation()
                        Log.d("MainActivity", "getLocation: retour initLocation")
                        object : Thread() {
                            override fun run() {
                                super.run()
                                try {
                                    sleep(1000)
                                } catch (e: InterruptedException) {
                                    e.printStackTrace()
                                }


                            }
                        }.start()

                        Log.d("MainActivity", "getLocation: list ${list}")

                        result.success(list)
                    }


                }
                "startEnrol" -> {
                    activityCompletedCallBack = object : ActivityCompletedCallBack {
                        override fun sendResult(data: Any) {
                            result.success(data)
                        }
                    }

                    val activityIdentifierCode = 10098
                    val enrolIntent = Intent()
                    enrolIntent.action = "android.intent.action.VIEW"
                    enrolIntent.`package` = "com.kmtvision.iddoc_data_collector"
                    enrolIntent.addCategory("android.intent.category.DEFAULT")
                    enrolIntent.putExtra("package", BuildConfig.APPLICATION_ID)
                    enrolIntent.putExtra("SHOW_CREATE_BTN", true)
                    enrolIntent.putExtra("EMAIL", "mafa@kmtvision.com")
                    enrolIntent.putExtra("PASSWORD", "Ma7A@2023")

                    try {
                        activity.startActivityForResult(enrolIntent, activityIdentifierCode)
                    } catch (e: Exception) {
                        result.error("Error", e.toString(), null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        when (requestCode) {
            10098 -> {
                if (resultCode == RESULT_OK) {
                    val result = data?.getStringExtra("result")

                    if (result != null && result.isNotEmpty()) {

                       // val enrolData = Gson().fromJson<HashMap<String, Any>>(jsonData, HashMap::class.java)
                        val kycData = Gson().fromJson<HashMap<String, Any>>(result, HashMap::class.java)
                        /*
                        Log.d("MainActivity", "message: ${kycData["message"]}")
                        Log.d("MainActivity", "document_code: ${kycData["document_code"]}")
                        Log.d("MainActivity", "document_number: ${kycData["document_number"]}")
                        Log.d("MainActivity", "first_name: ${kycData["first_name"]}")
                        Log.d("MainActivity", "last_name: ${kycData["last_name"]}")
                        Log.d("MainActivity", "gender: ${kycData["gender"]}")
                        Log.d("MainActivity", "country_code: ${kycData["country_code"]}")
                        Log.d("MainActivity", "nationality: ${kycData["nationality"]}")
                        Log.d("MainActivity", "personal_number: ${kycData["personal_number"]}")
                        Log.d("MainActivity", "profession: ${kycData["profession"]}")
                        Log.d("MainActivity", "permanent_address: ${kycData["permanent_address"]}")
                        Log.d("MainActivity", "image: ${kycData["image"]}")
*/
                        activityCompletedCallBack?.sendResult(hashMapOf<String, Any>(
                                "isError" to false,
                                "data" to kycData,
                                "message" to "OK"
                        ))

                    } else {
                        activityCompletedCallBack?.sendResult(hashMapOf<String, Any>(
                                "isError" to true,
                                "data" to "",
                                "message" to "PB null"
                        ))
                    }
                }
            }

        }
    }

    private fun bundleToMap(extras: Bundle?): Map<String, Any?> {
        val map: MutableMap<String, Any?> = HashMap()

        if (extras != null) {
            val ks = extras.keySet()
            val iterator: Iterator<String> = ks.iterator()
            while (iterator.hasNext()) {
                val key = iterator.next()
                map[key] = extras.get(key)
            }
        } /*from   w ww .j  a  v  a 2s .c  o m*/

        return map
    }

    private fun getApplicationName(
            context: Context,
            data: String,
            flag: Int
    ): String {
        val pckManager: PackageManager = context.packageManager
        val applicationInformation: ApplicationInfo? = try {
            pckManager.getApplicationInfo(data, flag)
        } catch (e: PackageManager.NameNotFoundException) {
            null
        }
        return (if (applicationInformation != null) pckManager.getApplicationLabel(
                applicationInformation
        ) else "(unknown)") as String
    }

    private val isOPen: Boolean
        private get() {
            locationManager = getSystemService(LOCATION_SERVICE) as LocationManager
            gps = locationManager!!.isProviderEnabled(LocationManager.GPS_PROVIDER)
            network = locationManager!!.isProviderEnabled(LocationManager.NETWORK_PROVIDER)


            Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ isOPen", "locationManager: ${locationManager}")
            Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ isOPen", "gps: ${gps}")
            Log.d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ isOPen", "network: ${network}")



            return if (gps) {
                true
            } else false
        }





    @TargetApi(Build.VERSION_CODES.M)
    private fun initLocation() {


        val listener: LocationListener = object : LocationListener {
            override fun onLocationChanged(location: Location) {
//                Log.d("MainActivity", "onLocationChanged ")
                updateShow(location)
            }

            override fun onStatusChanged(provider: String, status: Int, extras: Bundle) {
  //              Log.d("MainActivity", "onStatusChanged")
            }

            @SuppressLint("MissingPermission")
            override fun onProviderEnabled(provider: String) {
    //            Log.d("MainActivity", "onProviderEnabled ")
            }

            override fun onProviderDisabled(provider: String) {
      //          Log.d("MainActivity", " onProviderDisabled")
            }
        }




            locationManager!!.requestLocationUpdates(

                    LocationManager.NETWORK_PROVIDER,
                    500,
                    8f,
                    listener
            ) // network locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 500, 8, listener); // gps




            Log.d("MainActivity", "Request >>>>>>>> locationManager C")

            locationManager!!.requestLocationUpdates(
                    LocationManager.GPS_PROVIDER,
                    500,
                    1f,
                    listener
            ) // g







    }

    private fun updateShow(location: Location?): List<*>? {
  //      Log.d("MainActivity", "updateShow ")

        if (location != null) {
//            Log.d("MainActivity", "updateShow ${location} ${location.getAccuracy()}")
            list.clear()
            list.add(location.longitude)
            list.add(location.latitude)
            list.add(location.getAccuracy())


            return list
        }
        return null
    }

}

interface ActivityCompletedCallBack {
    fun sendResult(data: Any)
}