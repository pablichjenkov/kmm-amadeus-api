package com.pablichj.incubator.amadeus.common.model

import kotlinx.serialization.Serializable

@Serializable
data class GeoCode(
    val latitude: Double,
    val longitude: Double
)