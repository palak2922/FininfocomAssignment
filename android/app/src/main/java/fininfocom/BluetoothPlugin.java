//package fininfocom;
//
//import android.bluetooth.BluetoothAdapter;
//import io.flutter.plugin.common.MethodCall;
//import io.flutter.plugin.common.MethodChannel;
//import io.flutter.embedding.engine.plugins.FlutterPlugin;
//import io.flutter.embedding.engine.plugins.activity.ActivityAware;
//import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
//import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding.OnSaveInstanceStateListener;
//import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding.OnRestoreInstanceStateListener;
//
//public class BluetoothPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
//
//    private static final String CHANNEL_NAME = "your_package_name/bluetooth";
//    private MethodChannel methodChannel;
//    private BluetoothAdapter bluetoothAdapter;
//
//    @Override
//    public void onAttachedToEngine(FlutterPluginBinding binding) {
//        methodChannel = new MethodChannel(binding.getBinaryMessenger(), CHANNEL_NAME);
//        methodChannel.setMethodCallHandler(this);
//    }
//
//    @Override
//    public void onDetachedFromEngine(FlutterPluginBinding binding) {
//        methodChannel.setMethodCallHandler(null);
//        methodChannel = null;
//    }
//
//    @Override
//    public void onAttachedToActivity(ActivityPluginBinding binding) {
//        binding.addOnSaveInstanceStateListener(new OnSaveInstanceStateListener() {
//            @Override
//            public void onSaveInstanceState(Bundle bundle) {
//                // Save any required instance state here
//            }
//        });
//
//        binding.addOnRestoreInstanceStateListener(new OnRestoreInstanceStateListener() {
//            @Override
//            public void onRestoreInstanceState(Bundle bundle) {
//                // Restore any required instance state here
//            }
//        });
//
//        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
//    }
//
//    @Override
//    public void onDetachedFromActivity() {
//        bluetoothAdapter = null;
//    }
//
//    @Override
//    public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
//        // This method is called when the activity is reattached due to configuration changes.
//        // You can handle it if needed.
//    }
//
//    @Override
//    public void onDetachedFromActivityForConfigChanges() {
//        // This method is called when the activity is detached due to configuration changes.
//        // You can handle it if needed.
//    }
//
//    @Override
//    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
//        if (call.method.equals("enableBluetooth")) {
//            enableBluetooth(result);
//        } else {
//            result.notImplemented();
//        }
//    }
//
//    private void enableBluetooth(MethodChannel.Result result) {
//        if (bluetoothAdapter != null) {
//            if (!bluetoothAdapter.isEnabled()) {
//                bluetoothAdapter.enable();
//            }
//            result.success(true);
//        } else {
//            result.error("BLUETOOTH_UNAVAILABLE", "Bluetooth is not available on this device.", null);
//        }
//    }
//}
