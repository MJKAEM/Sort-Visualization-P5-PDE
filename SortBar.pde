/**
* SortBar.pde
*
* A renderable bar (rectangle in disguise) that can be sorted.
*/
public class SortBar extends Sortable<SortBar>
{
	public static final int BLOCK_WIDTH = 10;

	public SortBar(int numberValue)
	{
		super(numberValue);
	}

	public void show(int positionX)
	{
		rect(positionX - (BLOCK_WIDTH / 2), BOTTOM_HEIGHT, BLOCK_WIDTH, -getNumberValue());
	}
}