/**
* SelectionSort.pde
*
* Performs a visual representation of how Selection Sort works.
*/
public class SelectionSort<E extends Sortable<E>> extends SortMethod<E>
{
	private int progress, flag, scan;

	public SelectionSort(ArrayList<E> unsortedList)
	{
		super(unsortedList);
	}

	/**
	 * Sorts the list using Selection sort, modified for visualization purposes.
	 */
	public void oneSort()
	{
		// Only works if there is anything left to sort.
		//
		if (progress < getCurrentList().size())
		{
			if (scan >= getCurrentList().size())
			{
				// Reached end of current search, so swap places
				//
				E temp = getCurrentList().get(progress);
				getCurrentList().set(progress, getCurrentList().get(flag));
				getCurrentList().set(flag, temp);

				// Reset positions
				//
				scan = ++progress;
				flag = scan;
			}
			else
			{
				// Set the flag, if needed
				//
				if (getCurrentList().get(flag).compareTo(getCurrentList().get(scan)) > 0)
				{
					flag = scan;
				}

				++scan;
			}
		}
		else
		{
			if (!isCompleted())
			{
				takeTime();
				setCompleted(true);
			}
			checkSort();
		}
	}

	public void show()
	{
		super.show();

		if (progress < getCurrentList().size())
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

	public void reset()
	{
		super.reset();

		progress = flag = scan = 0;
	}

	private void showAllLines()
	{
		noFill();

		// Show lines on the sorted side
		//
		stroke(0, 255, 0);

		for (int i = progress - 1; i >= 0; --i)
		{
			getCurrentList().get(i).show(15 + i);
		}

		// Show regular lines
		//
		stroke(255);

		for (int i = getCurrentList().size() - 1; i >= progress; --i)
		{
			getCurrentList().get(i).show(15 + i);
		}

		// Show flag
		//
		stroke(255, 0, 0);
		getCurrentList().get(flag).show(15 + flag);

		// Show current scan
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

		// Show bars on the sorted side
		//
		fill(0, 255, 0);

		for (int i = progress - 1; i >= 0; --i)
		{
			getCurrentList().get(i).show(15 + (i * SortBar.BLOCK_WIDTH));
		}

		// Show regular bars
		//
		fill(255);

		for (int i = getCurrentList().size() - 1; i >= progress; --i)
		{
			getCurrentList().get(i).show(15 + (i * SortBar.BLOCK_WIDTH));
		}

		// Show flag
		//
		fill(255, 0, 0);
		getCurrentList().get(flag).show(15 + (flag * SortBar.BLOCK_WIDTH));

		// Show current scan
		//
		if (scan < getCurrentList().size())
		{
			fill(255, 255, 0);
			getCurrentList().get(scan).show(
			    15 + (scan * SortBar.BLOCK_WIDTH));
		}
	}

	public String getSortName()
	{
		return "Selection Sort";
	}
}


