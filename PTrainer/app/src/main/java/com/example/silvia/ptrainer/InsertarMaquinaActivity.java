package com.example.silvia.ptrainer;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;
import org.xmlpull.v1.XmlPullParserException;

import java.io.IOException;


public class InsertarMaquinaActivity extends Activity {

    private Button btnInsertarMaquina;
    private EditText inputMaquina;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_insertar_maquina);

        inputMaquina= (EditText) findViewById(R.id.txtMachineName);
        btnInsertarMaquina = (Button) findViewById(R.id.btnInsertarMaquina);
        btnInsertarMaquina.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {
                insertarMaquina();
            }
        });
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.insertar_maquina, menu);
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

    public void insertarMaquina(){

        Thread nt= new Thread(){
            String res;
            String machine = inputMaquina.getText().toString();

            @Override
            public void run (){
                String NAMESPACE="http://tempuri.org/";
                String URL="http://wsptrainer.azurewebsites.net/WebService.asmx";
                String METHOD_NAME="insertarMaquina";
                String SOAP_ACTION="http://tempuri.org/insertarMaquina";

                SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME);
                request.addProperty("nombre",machine);


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
                        //Toast.makeText(SinginActivity.this, res, Toast.LENGTH_LONG).show();
                        if(Integer.parseInt(res)==1)
                        {
                            Toast.makeText(InsertarMaquinaActivity.this,"Record Save",Toast.LENGTH_LONG).show();


                        }
                        else
                        {
                            Toast.makeText(InsertarMaquinaActivity.this,"Maquina ya Existe!",Toast.LENGTH_LONG).show();

                        }
                    }
                });

            }
        };

        nt.start();

    }
}
