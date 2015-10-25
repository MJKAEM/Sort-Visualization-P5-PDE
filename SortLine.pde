/**
* SortLine.pde
*
* A renderable line that can be sorted.
*/
public class SortLine extends Sortable<SortLine>
{
	private SortLine() { }

	public SortLine(int numberValue)
	{
		super(numberValue);
	}

	public void show(float positionX)
	{
		line(positionX, Sortable.BOTTOM_HEIGHT, positionX, Sortable.BOTTOM_HEIGHT - getNumberValue());
	}
}