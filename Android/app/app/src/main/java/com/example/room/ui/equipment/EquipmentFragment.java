package com.example.room.ui.equipment;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProvider;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.room.R;
import com.example.room.activity.EquipmentInstrumentActivity;
import com.example.room.activity.ReservationActivity;
import com.example.room.adapter.EquipmentRoomAdapter;
import com.example.room.adapter.RoomsInstrumentAdapter;
import com.example.room.databinding.FragmentEquipmentBinding;
import com.example.room.db.Schema;
import com.example.room.gateways.Gateway;
import com.example.room.model.Customer;
import com.example.room.model.Reservation;
import com.example.room.model.Room;

import java.util.ArrayList;
import java.util.List;

public class EquipmentFragment extends Fragment {

    private EquipmentViewModel notificationsViewModel;
    private FragmentEquipmentBinding binding;
    private Context context;

    private RecyclerView recyclerView;
    private Schema schema;
    private ArrayList<String> roomName, roomPrice, roomDescription, instrumentName, instrumentDescription;
    private EquipmentRoomAdapter roomAdapter;
    private ImageView emptyImageView;
    private TextView emptyTextView;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        context = getActivity();

        notificationsViewModel =
                new ViewModelProvider(this).get(EquipmentViewModel.class);

        binding = FragmentEquipmentBinding.inflate(inflater, container, false);
        View root = binding.getRoot();

        recyclerView = root.findViewById(R.id.user_rooms_instrument_recyclerview);
        emptyImageView = root.findViewById(R.id.empty2_imageView);
        emptyTextView = root.findViewById(R.id.empty2_textView);

        roomName = new ArrayList<>();
        roomPrice = new ArrayList<>();
        roomDescription = new ArrayList<>();

        Gateway gateway = new Gateway();
        SharedPreferences preferences = getActivity().getSharedPreferences("myPrefs", Context.MODE_PRIVATE);
        String token = preferences.getString("token", null);
        List<Room> rooms = gateway.getAllRooms(token);

        setRooms(rooms);

        roomAdapter = new EquipmentRoomAdapter(getActivity(), roomName, roomDescription, roomPrice);
        recyclerView.setAdapter(roomAdapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(getActivity()));

        roomAdapter.setOnItemClickListener(new EquipmentRoomAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(int position) {
                System.out.println("================================CLICK ON RECYCLEVIEW=====================" + position);

                Intent intent = new Intent(getActivity(), EquipmentInstrumentActivity.class);
                Bundle bundle = new Bundle();
                bundle.putInt("roomId", rooms.get(position).getId());
                intent.putExtras(bundle);
                startActivity(intent);
            }
        });






        /*schema = new Schema(context);

        roomName = new ArrayList<>();
        roomPrice = new ArrayList<>();
        roomDescription = new ArrayList<>();
        instrumentName = new ArrayList<>();
        instrumentDescription = new ArrayList<>();

        storeRoomsInstrument();*/

        /*roomsInstrumentAdapter = new RoomsInstrumentAdapter(getActivity(), roomName, roomPrice,
                roomDescription, instrumentName, instrumentDescription);
        recyclerView.setAdapter(roomsInstrumentAdapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(getActivity()));*/





        return root;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

    private void setRooms(List<Room> rooms) {
        if(rooms.size() == 0) {
            emptyImageView.setVisibility(View.VISIBLE);
            emptyTextView.setVisibility(View.VISIBLE);
        } else {
            for(int i = 0; i <= rooms.size() - 1; i++) {
                roomName.add(rooms.get(i).getName());
                roomDescription.add(rooms.get(i).getDescription());
                roomPrice.add(rooms.get(i).getPrice().toString());
            }

            emptyImageView.setVisibility(View.GONE);
            emptyTextView.setVisibility(View.GONE);
        }
    }
}