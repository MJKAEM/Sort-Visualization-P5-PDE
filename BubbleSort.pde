public class BubbleSort<E extends Sortable<E>> extends SortMethod<E>
{
	private int scan, progress;
	private E sortable;

	public BubbleSort(ArrayList<E> unsortedList)
	{
		super(unsortedList);
	}

	public void show()
	{
		super.show();
		
		if (progress > -1)
		{
			if (lineMode)
			{
				showAllLines();
			}
			else
			{
				showAllBars();
			}
		}
		else
		{
			showCheckSort();
		}
	}

	public void oneSort()
	{
		if (progress > -1)
		{
			if (scan < progress)
			{
				if (sortable.compareTo(getCurrentList().get(scan)) < 0)
				{
					sortable = getCurrentList().get(scan);
				}
				else
				{
					E temp = getCurrentList().get(scan);
					getCurrentList().set(scan, sortable);
					getCurrentList().set(scan - 1, temp);
				}

				++scan;
			}
			else
			{
				scan = 1;
				sortable = getCurrentList().get(0);
				--progress;
			}
		}
		else
		{
			if (!isCompleted())
			{
				setCompleted(true);
				takeTime();
			}
			checkSort();
		}
	}

	public void reset()
	{
		resetTime();

		progress = getCurrentList().size();

		if (progress > 0)
		{
			sortable = getCurrentList().get(0);
			scan = 1;
		}
	}

	private void showAllLines()
	{
		noFill();

		// Show regular lines
		//
		stroke(255);

		for (int i = progress - 1; i >= 0; --i)
		{
			getCurrentList().get(i).show(15 + i);
		}

		// Show lines on the sorted side
		//
		stroke(0, 255, 0);

		for (int i = getCurrentList().size() - 1; i >= progress; --i)
		{
			getCurrentList().get(i).show(15 + i);
		}

		// Show flag
		//
		stroke(255, 0, 0);
		getCurrentList().get(scan - 1).show(15 + (scan - 1));

		// Show current Search
		//
		if (scan < getCurrentList().size())
		{
			stroke(255, 255, 0);
			getCurrentList().get(scan).show(15 + scan);
		}
	}

	private void showAllBars()
	{
		stroke(0);

		// Show regular bars
		//
		fill(255);

		for (int i = 0; i < progress; i++)
		{
			getCurrentList().get(i).show(15 + (i * SortBar.BLOCK_WIDTH));
		}

		// Show bars on the sorted side
		//
		fill(0, 255, 0);

		for (int i = getCurrentList().size() - 1; i >= progress; --i)
		{
			getCurrentList().get(i).show(15 + (i * SortBar.BLOCK_WIDTH));
		}

		// Show flag
		//
		fill(255, 0, 0);
		getCurrentList().get(scan - 1).show(
				15 + ((scan - 1) * SortBar.BLOCK_WIDTH));

		// Show current search
		//
		if (scan < getCurrentList().size())
		{
			fill(255, 0, 0);
			getCurrentList().get(scan).show(
					15 + (scan * SortBar.BLOCK_WIDTH));
		}
	}

	public String getSortName()
	{
		return "Bubble Sort";
	}

	//
	// Getters / Setters
	//

	public int getScan()
	{
		return this.scan;
	}
}
