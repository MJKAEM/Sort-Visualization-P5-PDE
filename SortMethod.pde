public abstract class SortMethod<E extends Sortable<E>>
{
	private ArrayList<E> currentList;
	private int checkProgress;
	private boolean completed, failedSort;
	private int endTime, startTime;

	protected SortMethod(ArrayList<E> unsortedList)
	{
		this.currentList = unsortedList;
		reset();
	}

	protected void showCheckSort()
	{
		int timeTaken = getEndTime() - getStartTime();

		text("Time taken to sort (ms): " + timeTaken, 20, 20);
		text("Time taken to sort (sec): " + (int)(timeTaken / 1000), 20, 35);

		if (isFailedSort())
		{
			if (lineMode)
			{
				for (int i = getCurrentList().size() - 1; i >= 0; --i)
				{
					stroke(255, 0, 0);
					getCurrentList().get(i).show(15 + i);
				}
			}
			else
			{
				for (int i = getCurrentList().size() - 1; i >= 0; --i)
				{
					fill(255, 0, 0);
					getCurrentList().get(i).show(15 + (i * SortBar.BLOCK_WIDTH));
				}
			}
		}
		else
		{
			if (lineMode)
			{
				if (checkProgress <= getCurrentList().size())
				{
					// Current scanning
					//
					for (int i = 0; i < checkProgress; ++i)
					{
						stroke(0, 255, 0);
						getCurrentList().get(i).show(15 + i);
					}
					for (int i = checkProgress, max = getCurrentList().size(); i < max; ++i)
					{
						stroke(255);
						getCurrentList().get(i).show(15 + i);
					}
				}
				else
				{
					// Done scanning
					//
					for (int i = getCurrentList().size() - 1; i >= 0; --i)
					{
						stroke(255);
						getCurrentList().get(i).show(15 + i);
					}
				}
			}
			else
			{
				if (checkProgress <= getCurrentList().size())
				{
					// Currently scanning
					//
					for (int i = 0; i < checkProgress; ++i)
					{
						fill(0, 255, 0);
						getCurrentList().get(i).show(15 + (i * SortBar.BLOCK_WIDTH));
					}
					for (int i = checkProgress, max = getCurrentList().size(); i < max; ++i)
					{
						fill(255);
						getCurrentList().get(i).show(15 + (i * SortBar.BLOCK_WIDTH));
					}
				}
				else
				{
					// Done scanning
					//
					for (int i = getCurrentList().size() - 1; i >= 0; --i)
					{
						fill(255);
						getCurrentList().get(i).show(15 + (i * SortBar.BLOCK_WIDTH));
					}
				}
			}
		}
	}

	/**
	* Resets the time in the sort method.
	*/
	public void resetTime()
	{
		setStartTime(millis());
	}

	/**
	 * Checks if the sorting method failed. If it did, then it will make note of
	 * that.
	 */
	protected void checkSort()
	{
		// Only work if the sort has not failed yet
		//
		if (!isFailedSort())
		{
			// Work if the scanning is done
			//
			if (checkProgress < getCurrentList().size())
			{
				// If the scanner is at its end, then add one more and finish
				// it
				//
				if (checkProgress + 1 == getCurrentList().size())
				{
					++checkProgress;
					return;
				}

				// Compare two items next to each other and report results
				//
				E currentItem = getCurrentList().get(checkProgress);
				E nextItem = getCurrentList().get(checkProgress + 1);

				if (currentItem.compareTo(nextItem) <= 0)
				{
					++checkProgress;
				}
				else
				{
					failedSort = true;
				}
			}
			else if (checkProgress == getCurrentList().size())
			{
				++checkProgress;
			}
		}
	}

	protected void takeTime()
	{
		setEndTime(millis());
	}

	/**
	* Renders the current sort to the screen.
	*/
	public void show()
	{
		text(getSortName(), (width / 2) - ((getSortName().length() * 6) / 2), height - 5);
	}

	public abstract void oneSort();

	/**
	* Resets the entire sort.
	*/
	public void reset()
	{
		resetTime();
	}

	public abstract String getSortName();

	//
	// Getters and Setters
	//

	public boolean isCompleted()
	{
		return this.completed;
	}

	protected void setCompleted(boolean completed)
	{
		this.completed = completed;
	}

	public int getEndTime()
	{
		return this.endTime;
	}

	protected void setEndTime(int endTime)
	{
		this.endTime = endTime;
	}

	public boolean isFailedSort()
	{
		return this.failedSort;
	}

	protected void setFailedSort(boolean failedSort)
	{
		this.failedSort = failedSort;
	}

	public ArrayList<E> getCurrentList()
	{
		return this.currentList;
	}

	protected void setCurrentList(ArrayList<E> newlist)
	{
		this.currentList = newlist;
	}

	public int getStartTime()
	{
		return this.startTime;
	}

	public void setStartTime(int startTime)
	{
		this.startTime = startTime;
	}
}