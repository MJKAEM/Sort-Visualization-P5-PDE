/**
* MergeSortPiece.pde
*
* A part of the MergeSort class. Performs a visual representation of how Merge Sort works.
*/
public class MergeSortPiece<E extends Sortable<E>> extends MergeSort<E>
{
	public MergeSortPiece(final ArrayList<E> unsortedList)
	{
		super(unsortedList);
	}

	public void show()
	{
		// If the size of the list is smaller than 2, then show the list.
		//
		if (getCurrentList().size() <= 2)
		{
			// If work is not completed
			//
			if (!isCompleted())
			{
				if (lineMode)
				{
					noFill();
					stroke(255);

					for (int i = getCurrentList().size() - 1; i >= 0; --i)
					{
						getCurrentList().get(i).show(15 + i);
					}

					if (scanA < getCurrentList().size())
					{
						stroke(255, 255, 0);

						getCurrentList().get(scanA).show(15 + scanA);
					}
				}
				else
				{
					fill(255);
					stroke(0);

					for (int i = getCurrentList().size() - 1; i >= 0; --i)
					{
						getCurrentList().get(i).show(
								15 + (i * SortBar.BLOCK_WIDTH));
					}

					if (scanA < getCurrentList().size())
					{
						fill(255, 255, 0);

						getCurrentList().get(scanA).show(
								15 + (scanA * SortBar.BLOCK_WIDTH));
					}
				}
			}
			// If the work is completed
			//
			else
			{
				if (lineMode)
				{
					noFill();
					stroke(255);

					for (int i = getCurrentList().size() - 1; i >= 0; --i)
					{
						getCurrentList().get(i).show(15 + i);
					}
				}
				else
				{
					stroke(0);
					fill(255);

					for (int i = getCurrentList().size() - 1; i >= 0; --i)
					{
						getCurrentList().get(i).show(
								15 + (i * SortBar.BLOCK_WIDTH));
					}
				}
			}
		}
		// If the size is the list is more than two, then show all other parts
		//
		else
		{
			super.show();
		}
	}

	/**
	 * Sorts the list using Merge sort, modified for visualization purposes.
	 */
	public void oneSort()
	{
		if (!isCompleted())
		{
			switch (getCurrentList().size())
			{
				case 1:
					//
					// If list has one item, then make it the list and make
					// everything complete
					//

					getSortedList().add(getCurrentList().get(0));
					setCurrentList(getSortedList());
					setCompleted(true);
					break;

				case 2:
					//
					// If list has two items, then sort the two
					//

					if (scanA < getCurrentList().size() - 1)
					{
						// Check for the lower number and add the lower before
						// the higher value item
						//
						E itemA = getCurrentList().get(scanA);
						E itemB = getCurrentList().get(scanA + 1);

						if (itemA.compareTo(itemB) < 0)
						{
							getSortedList().add(itemA);
							getSortedList().add(itemB);
						}
						else
						{
							getSortedList().add(itemB);
							getSortedList().add(itemA);
						}

						++scanA;
					}
					else
					{
						setCurrentList(getSortedList());
						setCompleted(true);
					}
					break;

				default:
					super.oneSort();
					break;
			}
		}
	}

	/**
	 * Modified method to make it show only necessary items and save memory.
	 */
	public void showCheckSort()
	{
		if (lineMode)
		{
			noFill();
			stroke(255);

			for (int i = getCurrentList().size() - 1; i >= 0; --i)
			{
				getCurrentList().get(i).show(15 + i);
			}
		}
		else
		{
			fill(255);
			stroke(0);

			for (int i = getCurrentList().size() - 1; i >= 0; --i)
			{
				getCurrentList().get(i).show(15 + (i * SortBar.BLOCK_WIDTH));
			}
		}
	}

	/**
	 * Does nothing, to save memory
	 */
	public void checkSort()
	{
		// Does nothing, to save memory
	}

	public String getSortName()
	{
		return "Merge Sort Piece";
	}
}


