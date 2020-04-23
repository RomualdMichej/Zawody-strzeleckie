package pl.coderslab.war6.util;

public class TimePeriodResolver {

    public static int counter(String begin, String end, int period) {

        String[] parts1 = begin.split(":");
        String[] parts2 = end.split(":");

        int hourBegin = Integer.parseInt(parts1[0]);
        double minutBegin = (Integer.parseInt(parts1[1]))/60.0;
        double timeBegin = hourBegin + minutBegin;
        int hourEnd = Integer.parseInt(parts2[0]);
        double minutEnd = (Integer.parseInt(parts2[1]))/60.0;
        double timeEnd = hourEnd + minutEnd;

        return (int)(60/(period) * (timeEnd - timeBegin));

    }
}
