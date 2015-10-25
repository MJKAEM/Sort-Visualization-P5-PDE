/**
* MergeSort.pde
*
* Performs a visual representation of how Merge Sort works.
*/
public class MergeSort<E extends Sortable<E>> extends SortMethod<E>
{
	protected MergeSortPiece<E> partA, partB;

	private ArrayList<E> sortedList;
	protected int scanA, scanB;

	public MergeSort(ArrayList<E> unsortedList)
	{
		super(unsortedList);

		final int SIZE = unsortedList.size();
		sortedList = new ArrayList<E>(SIZE);

		if (unsortedList.size() > 2)
		{
			final int HALF_SIZE = unsortedList.size() >> 1;

			final ArrayList<E> listA = new ArrayList<E>(HALF_SIZE);
			final ArrayList<E> listB = new ArrayList<E>(HALF_SIZE);

			for (int i = 0; i < HALF_SIZE; ++i)
			{
				listA.add(unsortedList.get(i));
			}

			for (int i = HALF_SIZE; i < SIZE; ++i)
			{
				listB.add(unsortedList.get(i));
			}

			partA = new MergeSortPiece<E>(listA);
			partB = new MergeSortPiece<E>(listB);
		}
	}

	public void show()
	{
		if (!(this instanceof MergeSortPiece))
		{
			super.show();
		}

		if (!isCompleted())
		{
			partA.show();

			translatePart();
			if (!partA.isCompleted())
			{
				if (lineMode)
				{
					stroke(255);
					noFill();

					for (int i = 0; i < partB.getCurrentList().size(); ++i)
					{
						partB.getCurrentList().get(i).show(15 + i);
					}
				}
				else
				{
					stroke(0);
					fill(255);

					for (int i = 0; i < partB.getCurrentList().size(); ++i)
					{
						partB.getCurrentList().get(i)
						.show(15 + (i * SortBar.BLOCK_WIDTH));
					}
				}
			}
			else
			{

				partB.show();

			}
			untranslatePart();

			// This section displays the searching colors after combining the
			// sorted parts, hence why it requires both parts be completed
			//
			if (partA.isCompleted() && partB.isCompleted())
			{
				if (lineMode)
				{
					noFill();

					if (scanA < partA.getCurrentList().size())
					{
						stroke(255, 255, 0);
						partA.getCurrentList().get(scanA).show(15 + scanA);
					}

					translatePart();
					if (scanB < partB.getCurrentList().size())
					{
						stroke(255, 255, 0);
						partB.getCurrentList().get(scanB).show(15 + scanB);
					}
					untranslatePart();
				}
				else
				{
					stroke(0);

					if (scanA < partA.getCurrentList().size())
					{
						fill(255, 255, 0);

						partA.getCurrentList().get(scanA).show(
						    15 + (scanA * SortBar.BLOCK_WIDTH));
					}

					translatePart();
					if (scanB < partB.getCurrentList().size())
					{
						fill(255, 255, 0);

						partB.getCurrentList().get(scanB).show(
						    15 + (scanB * SortBar.BLOCK_WIDTH));
					}
					untranslatePart();
				}
			}
		}
		// If the work is completed, show the checking process
		//
		else
		{
			showCheckSort();
		}
	}

	/**
	 * Sorts the list using Merge sort, modified for visualization purposes.
	 */
	public void oneSort()
	{
		if (!isCompleted())
		{
			// Ensure the smaller parts are finished first before merging
			//
			if (!partA.isCompleted())
			{
				partA.oneSort();
			}
			else if (!partB.isCompleted())
			{
				partB.oneSort();
			}
			else
			{
				// Booleans for readability and optimization
				//
				boolean incompleteA = scanA < partA.getSortedList().size();
				boolean incompleteB = scanB < partB.getSortedList().size();

				E itemA = null;
				E itemB = null;

				// If both scanA and scanB are not done, then merge the
				// elements into a sorted list
				//
				if (incompleteA && incompleteB)
				{
					itemA = partA.getCurrentList().get(scanA);
					itemB = partB.getCurrentList().get(scanB);

					if (itemA.compareTo(itemB) < 0)
					{
						sortedList.add(itemA);
						++scanA;
					}
					else
					{
						sortedList.add(itemB);
						++scanB;
					}
				}
				// If part A is complete, fill in the rest with B
				//
				else if (!incompleteA && incompleteB)
				{
					itemB = partB.getCurrentList().get(scanB);
					sortedList.add(itemB);
					++scanB;
				}
				// If part B is complete, fill in the rest with A
				//
				else if (incompleteA && !incompleteB)
				{
					itemA = partA.getCurrentList().get(scanA);
					sortedList.add(itemA);
					++scanA;
				}
				// If both parts are complete, then do checks and change its
				// status to complete
				//
				else if (!incompleteA && !incompleteB)
				{
					setCurrentList(getSortedList());
					takeTime();
					setCompleted(true);
				}
			}
		}
		else
		{
			checkSort();
		}
	}

	public void reset()
	{
		super.reset();

		scanA = scanB = 0;
	}

	public String getSortName()
	{
		return "Merge Sort";
	}

	protected void translatePart()
	{
		if (lineMode)
		{
			translate(partA.getCurrentList().size(), 0);
		}
		else
		{
			translate(
			    partA.getCurrentList().size() * SortBar.BLOCK_WIDTH,
			    0);
		}
	}

	protected void untranslatePart()
	{
		if (lineMode)
		{
			translate(-partA.getCurrentList().size(), 0);
		}
		else
		{
			translate(
			    -(partA.getCurrentList().size() * SortBar.BLOCK_WIDTH),
			    0);
		}
	}

	//
	// Getters and Setters
	//
	public ArrayList<E> getSortedList()
	{
		return this.sortedList;
	}
}


