package com.example.room.ui.reserve;

import android.app.DatePickerDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.Spinner;
import android.widget.TextView;
import android.content.ContentValues.*;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProvider;

import com.example.room.R;
import com.example.room.adapter.RoomSpinnerAdapter;
import com.example.room.databinding.FragmentReserveBinding;
import com.example.room.db.Schema;
import com.example.room.gateways.Gateway;
import com.example.room.model.Customer;
import com.example.room.model.Room;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class ReserveFragment extends Fragment {

    private ReserveViewModel reserveViewModel;
    private FragmentReserveBinding binding;

    private TextView datePicker;
    private Button dateButton;
    private DatePickerDialog.OnDateSetListener dateSetListener;
    private ArrayList<String> roomName;
    private ArrayList<Integer> roomId;
    private Button reservationButton;
    private Spinner roomSpinner;
    private RoomSpinnerAdapter adapter;
    private Context context;
    private int currentPosition;
    private String selectedDate;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        context = getActivity();

       reserveViewModel =
                new ViewModelProvider(this).get(ReserveViewModel.class);

        binding = FragmentReserveBinding.inflate(inflater, container, false);
        View root = binding.getRoot();

        reservationButton = root.findViewById(R.id.reservationButton);
        roomSpinner = root.findViewById(R.id.roomSpinner);


        roomId = new ArrayList<>();
        roomName = new ArrayList<>();

        Gateway gateway = new Gateway();
        SharedPreferences preferences = getActivity().getSharedPreferences("myPrefs", Context.MODE_PRIVATE);
        String token = preferences.getString("token", null);
        int userId = preferences.getInt("userId", 0);
        Customer customer = gateway.getCustomer(token, userId);
        List<Room> rooms = gateway.getAllRooms(token);
        parseRoomData(rooms);

        ArrayAdapter<String> spinnerAdapter = new ArrayAdapter<String> (context,
                android.R.layout.simple_spinner_dropdown_item, roomName);

        roomSpinner.setAdapter(spinnerAdapter);

        roomSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()
        {
            public void onItemSelected(AdapterView<?> parent, View view, int position, long arg3)
            {
                currentPosition = roomSpinner.getSelectedItemPosition();
                System.out.println(roomSpinner.getSelectedItem() + " .Position: " +  roomSpinner.getSelectedItemPosition());

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });


        datePicker = root.findViewById(R.id.datePicker);
        dateButton = root.findViewById(R.id.dateButton);

        dateButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Calendar calendar = Calendar.getInstance();

                int year = calendar.get(Calendar.YEAR);
                int month = calendar.get(Calendar.MONTH);
                int day = calendar.get(Calendar.DAY_OF_MONTH);

                DatePickerDialog dialog = new DatePickerDialog(getContext(), android.R.style.Theme_DeviceDefault_Dialog,
                        dateSetListener, year, month + 1, day);

                dialog.show();
            }
        });

        dateSetListener = new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker view, int year, int month, int day) {
                month += 1;
                Log.d("", "OnDateSet: yyyy-mm-dd: " + year + "-" + month + "-" + day);
                String date = year + "-" + month + "-" + day;
                datePicker.setText(date);
                selectedDate = datePicker.getText().toString();
            }
        };


        reservationButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                gateway.addReservation(token, selectedDate, roomId.get(currentPosition), customer.getId());
                Toast.makeText(context, "Successful!", Toast.LENGTH_SHORT).show();
            }
        });




        /*Room[] rooms = new Room[2];

        rooms[0] = new Room();
        rooms[0].setId(1);
        rooms[0].setName("TEST1");

        rooms[1] = new Room();
        rooms[1].setId(2);
        rooms[1].setName("TEST2");

        adapter = new RoomSpinnerAdapter(getActivity().getApplicationContext(),
                                         android.R.layout.simple_spinner_item, rooms);
        roomSpinner = (Spinner) root.findViewById(R.id.roomSpinner);
        roomSpinner.setAdapter(adapter);

        roomSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {

            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view,
                                       int position, long id) {
                Room room = adapter.getItem(position);
                // Here you can do the action you want to...
                Toast.makeText(getContext(), "ID: " + room.getId() + "\nName: " + room.getName(),
                        Toast.LENGTH_SHORT).show();
            }
            @Override
            public void onNothingSelected(AdapterView<?> adapter) {  }
        });*/


        //List<Room> rooms = Room.all();
        //ArrayAdapter userAdapter = new ArrayAdapter(getContext().getApplicationContext(), R.layout.room_spinner, rooms);

        /*Spinner roomSpinner = (Spinner) root.findViewById(R.id.spinner);
        roomSpinner.setAdapter(userAdapter);
        roomSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                Room user = (Room) parent.getSelectedItem();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });*/


        return root;
    }

    private void parseRoomData(List<Room> rooms) {
        for(int i = 0; i <= rooms.size() - 1; i++) {
            roomId.add(rooms.get(i).getId());
            roomName.add(rooms.get(i).getName());
        }
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }
}