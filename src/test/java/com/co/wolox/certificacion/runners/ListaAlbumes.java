package com.co.wolox.certificacion.runners;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@KarateOptions(
        features = {"src/test/resources/features/ListaAlbumes.feature"}
)
public class ListaAlbumes {
}
