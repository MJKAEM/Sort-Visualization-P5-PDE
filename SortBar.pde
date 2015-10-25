/**
* SortBar.pde
*
* A renderable bar (rectangle in disguise) that can be sorted.
*/
public class SortBar extends Sortable<SortBar>
{
	public static final int BLOCK_WIDTH = 10;

	private SortBar() { }

	public SortBar(int numberValue)
	{
		super(numberValue);
	}

	public void show(float positionX)
	{
		rect(positionX - (BLOCK_WIDTH / 2), Sortable.BOTTOM_HEIGHT, BLOCK_WIDTH, -getNumberValue());
		/*text("PositionX: " + (positionX - (BLOCK_WIDTH / 2)), 20, 20);
		text("Block width / 2: " + BLOCK_WIDTH / 2, 20, 40);
		text("NumValue: " + -getNumberValue(), 20, 60);
		text("BOTTOM_HEIGHT: " + Sortable.BOTTOM_HEIGHT, 20, 80);*/
	}
}


