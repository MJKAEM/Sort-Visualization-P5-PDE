/**
* Sort_Everything_Compat.pde
*
*/

public static final int SCREEN_WIDTH = 480;
public static final int SCREEN_HEIGHT = 360;
public static final int MAX_NUMBER = SCREEN_HEIGHT - 60;
public static final int LIST_SIZE_BAR = (SCREEN_WIDTH - 30) / SortBar.BLOCK_WIDTH;
public static final int LIST_SIZE_LINE = SCREEN_WIDTH - 30;

private FramesCounter framesCounter;

private SortMethod<SortBar> sortTypeBar;
private SortMethod<SortLine> sortTypeLine;

private ArrayList<SortBar> unsortedBarList;
private ArrayList<SortLine> unsortedLineList;

public static boolean lineMode = false;

public void setup()
{
	size(480, 360);
	frameRate(60);

	textSize(12);

	framesCounter = new FramesCounter();

	unsortedBarList = new ArrayList<SortBar>(LIST_SIZE_BAR);
	unsortedLineList = new ArrayList<SortLine>(LIST_SIZE_LINE);

	// Initiate all lists.
	for (int i = 0; i < LIST_SIZE_LINE; ++i)
	{
		unsortedLineList.add(new SortLine((int)(random(MAX_NUMBER) + 1)));
	}

	for (int i = 0; i < LIST_SIZE_BAR; ++i)
	{
		unsortedBarList.add(new SortBar((int)(random(MAX_NUMBER) + 1)));
	}

	sortTypeBar = new BubbleSort<SortBar>(unsortedBarList);
	sortTypeLine = new BubbleSort<SortLine>(unsortedLineList);
}

public void draw()
{
	background(0, 0, 64);

	framesCounter.show();

	fill(255);

	if (lineMode)
	{
		text("Size of list: " + LIST_SIZE_LINE, 5, height - 5);
		sortTypeLine.oneSort();
		sortTypeLine.show();
	}
	else
	{
		text("Size of list: " + LIST_SIZE_BAR, 5, height - 5);
		sortTypeBar.oneSort();
		sortTypeBar.show();
	}
}

public void keyReleased()
{
	switch (key)
	{
	case 'q':
		lineMode = !lineMode;

		if (lineMode)
		{
			sortTypeLine.reset();
		}
		else
		{
			sortTypeBar.reset();
		}

		reinitiateList();
		break;

	case '1':
		reinitiateList();
		sortTypeBar = new BubbleSort<SortBar>(unsortedBarList);
		sortTypeLine = new BubbleSort<SortLine>(unsortedLineList);
		break;

	case '2':
		reinitiateList();
		sortTypeBar = new SelectionSort<SortBar>(unsortedBarList);
		sortTypeLine = new SelectionSort<SortLine>(unsortedLineList);
		break;

	case '3':
		reinitiateList();
		//sortTypeBar = new MergeSort<SortBar>(unsortedBarList);
		//sortTypeLine = new MergeSort<SortLine>(unsortedLineList);
		break;

	default:
		break;
	}

	framesCounter.update();
}

public void initiateSort()
{
	if (lineMode)
	{
		sortTypeLine.reset();
	}
	else
	{
		sortTypeBar.reset();
	}
}

public void reinitiateList()
{
	if (lineMode)
	{
		for (int i = 0; i < LIST_SIZE_LINE; ++i)
		{
			unsortedLineList.set(i,	new SortLine((int)(random(MAX_NUMBER) + 1)));
		}
	}
	else
	{
		for (int i = 0; i < LIST_SIZE_BAR; ++i)
		{
			unsortedBarList.set(i, new SortBar((int)(random(MAX_NUMBER) + 1)));
		}
	}
}