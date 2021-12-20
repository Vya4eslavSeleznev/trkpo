package com.example.room.ui.roomsInstrument;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class RoomsInstrumentViewModel extends ViewModel {
    private MutableLiveData<String> mText;

    public RoomsInstrumentViewModel() {
        mText = new MutableLiveData<>();
        //mText.setValue("This is dashboard fragment");
    }

    public LiveData<String> getText() {
        return mText;
    }
}