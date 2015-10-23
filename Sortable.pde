/**
* Sortable.pde
*
* A blueprint for classes which can be sorted.
*/
public abstract class Sortable<E extends Sortable<E>> implements Comparable<E>
{
	public static final int BOTTOM_HEIGHT = 480 - 30;

	private int numberValue;

	protected Sortable(int numberValue)
	{
		this.numberValue = numberValue;
	}

	public abstract void show(int positionX);

	public int compareTo(E o)
	{
		return this.getNumberValue() - o.getNumberValue();
	}

	//
	// Getters / Setters
	//

	public int getNumberValue()
	{
		return this.numberValue;
	}

	protected void setNumberValue(int numberValue)
	{
		this.numberValue = numberValue;
	}
}