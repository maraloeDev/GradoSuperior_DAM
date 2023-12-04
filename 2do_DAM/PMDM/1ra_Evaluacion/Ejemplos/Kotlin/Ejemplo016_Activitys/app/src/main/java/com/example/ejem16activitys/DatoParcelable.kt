package com.example.ejem16activitys

import android.os.Parcel
import android.os.Parcelable
//Genera un objeto que es optimizado la para generacion de la escritura/lectura de bytes
data class DatoParcelable(var dato: String?) : Parcelable {
    constructor(parcel: Parcel) : this(parcel.readString()) {
    }

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeString(dato)
    }

    override fun describeContents(): Int {
        return 0
    }

    companion object CREATOR : Parcelable.Creator<DatoParcelable> {
        override fun createFromParcel(parcel: Parcel): DatoParcelable {
            return DatoParcelable(parcel)
        }

        override fun newArray(size: Int): Array<DatoParcelable?> {
            return arrayOfNulls(size)
        }
    }
}
