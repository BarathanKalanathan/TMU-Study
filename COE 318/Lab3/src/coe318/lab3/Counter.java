/**
 *
 * @author Barathan Kalanathan 501121734
 */
package coe318.lab3;
public class Counter {
    //Instance variables here
    private int mod;
    private Counter leftneighbour;
    public int digits;
    
    
    public Counter(int modulus, Counter left) {
        mod = modulus;
        leftneighbour = left;
                
    }


    /**
     * @return the modulus
     */
    public int getModulus() {
        return mod;
    }

    /**
     * Returns the Counter to the left attached to this
     * Counter.  Returns null if there is no Counter
     * to the left.
     * @return the left
     */
    public Counter getLeft() {
        return leftneighbour;
    }

    /**
     * @return the digit
     */
    public int getDigit() {
        return digits;
    }

    /**
     * @param digit the digit to set
     */
    public void setDigit(int digit) {
        digits=digit;
    }

    /**
     * Increment this counter.  If it rolls over,
     * its left Counter is also incremented if it
     * exists.
     */
    public void increment() {
     digits++;
        if (digits==mod)
        {
            digits=0;
            if(leftneighbour!=null)
            {
                leftneighbour.increment();
            }
        }
    }

    /** Return the count of this Counter combined
     * with any Counter to its left.
     *
     * @return the count
     */
    public int getCount() {
        if (leftneighbour!=null)
        {
            return digits+mod*leftneighbour.getCount();
        }
         else
        {
            return digits;
        }
    }

    /** Returns a String representation of the Counter's
     * total count (including its left neighbour).
     * @return the String representation
     */
    @Override
    public String toString() {
        //DO NOT MODIFY THIS CODE
        return "" + getCount();
    }

}
