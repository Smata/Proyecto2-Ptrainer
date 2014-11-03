package com.example.silvia.ptrainer;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;
import org.xmlpull.v1.XmlPullParserException;

import java.io.IOException;


public class SinginActivity extends Activity {

    private TextView lblGotoLogin;
    private Button btnRegister;
    private EditText inputFullName;
    private EditText inputUsername;
    private EditText inputPassword;
    private TextView registerErrorMsg;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_singin);

        inputFullName = (EditText) findViewById(R.id.txtName);
        inputUsername = (EditText) findViewById(R.id.txtUsername);
        inputPassword = (EditText) findViewById(R.id.txtPass);
        btnRegister = (Button) findViewById(R.id.btnRegister);


        registerErrorMsg = (TextView) findViewById(R.id.register_error);

        btnRegister.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                registrarUsuario();

            }
        });

        lblGotoLogin = (TextView) findViewById(R.id.link_to_login);
        lblGotoLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {Intent itemintent = new Intent(SinginActivity.this, LoginActivity.class);
                SinginActivity.this.startActivity(itemintent);}
        });
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.singin, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }



    public void registrarUsuario(){

        Thread nt= new Thread(){
            String res;

            String name = inputFullName.getText().toString();
            String user = inputUsername.getText().toString();
            String password = inputPassword.getText().toString();


            @Override
            public void run (){
                String NAMESPACE="http://tempuri.org/";
                String URL="http://wsptrainer.azurewebsites.net/WebService.asmx";
                String METHOD_NAME="insertarUsuario";
                String SOAP_ACTION="http://tempuri.org/insertarUsuario";

                SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME);
                request.addProperty("nombre",name);
                request.addProperty("usuario",user);
                request.addProperty("password",password);

                SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
                envelope.dotNet=true;
                envelope.setOutputSoapObject(request);

                HttpTransportSE transporte = new HttpTransportSE(URL);
                try {
                    transporte.call(SOAP_ACTION,envelope);
                    SoapPrimitive resultado_xml= (SoapPrimitive)envelope.getResponse();
                    res= resultado_xml.toString();
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (XmlPullParserException e) {
                    e.printStackTrace();
                }

                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(SinginActivity.this, res, Toast.LENGTH_LONG).show();
                    }
                });

            }
        };

        nt.start();

    }
}
