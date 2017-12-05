package org.code.jarvis.hql;

/**
 * Created by ki.kao on 11/17/2017.
 */
public class StringFilterMode extends FilterMode {

    public static final FilterMode CONTAINS = new FilterMode(50);
    public static final FilterMode DOES_NOT_CONTAIN = new FilterMode(51);
    public static final FilterMode START_WITH = new FilterMode(52);
    public static final FilterMode END_WITH = new FilterMode(53);

    public StringFilterMode() {
        super(EQUALS.getValue());
    }

    @Override
    public FilterMode getDefaultFilterMode() {
        return EQUALS;
    }
}
