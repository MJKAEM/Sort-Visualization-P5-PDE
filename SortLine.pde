/**
* SortLine.pde
*
* A renderable line that can be sorted.
*/
public class SortLine extends Sortable<SortLine>
{
	public SortLine(int numberValue)
	{
		super(numberValue);
	}

	public void show(int positionX)
	{
		line(positionX, BOTTOM_HEIGHT, positionX, BOTTOM_HEIGHT - getNumberValue());
	}
}