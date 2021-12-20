package com.example.room.ui.home;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProvider;

import com.example.room.R;
import com.example.room.databinding.FragmentHomeBinding;
import com.example.room.db.Schema;

public class HomeFragment extends Fragment {

    private HomeViewModel homeViewModel;
    private FragmentHomeBinding binding;
    private Context context;

    private Button btn;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        context = getActivity();

        homeViewModel =
                new ViewModelProvider(this).get(HomeViewModel.class);

        binding = FragmentHomeBinding.inflate(inflater, container, false);
        View root = binding.getRoot();

        final TextView textView = binding.textHome;
        homeViewModel.getText().observe(getViewLifecycleOwner(), new Observer<String>() {
            @Override
            public void onChanged(@Nullable String s) {
                textView.setText(s);
            }
        });

        btn = root.findViewById(R.id.test_button);

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.out.println("TEST");
                //Instrument instrument = new Instrument(context);
                //instrument.addInstrument("qwe", "ewq");

                //Room room = new Room(context);
                //room.addRoom("TestSchema", "TestSchema", 123);

                /*Schema1 schema = new Schema1(context);*/
                Schema schema = new Schema(context);

                schema.addInstrument("Instrument1", "Good, nice, bad, black, big, small");
                schema.addRoom("Room1", "Good, nice, bad, black, big, small", 1237676767);
                schema.addRoomsInstrument(1, 1);
                schema.addUser("Test", "1", 1);
                schema.addCustomer("Vya4eslav", "1233", 1);
                schema.addReservation("2021-02-12", 1, 1);
            }
        });




        return root;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }
}
