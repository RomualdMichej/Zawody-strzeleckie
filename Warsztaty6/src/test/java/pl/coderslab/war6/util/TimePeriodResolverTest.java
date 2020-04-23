package pl.coderslab.war6.util;

import org.junit.jupiter.api.Test;

import static org.junit.Assert.*;

public class TimePeriodResolverTest {

    TimePeriodResolver timePeriodResolver = new TimePeriodResolver();

    @Test
    public void counter() {
        //given
        String hour1 = "10:12";
        String hour2 = "15:45";
        int period = 15;
        //when
        int result = TimePeriodResolver.counter(hour1, hour2, period);
        //then
        assertEquals(22, result);
    }
}

