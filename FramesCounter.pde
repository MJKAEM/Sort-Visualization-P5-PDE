/**
* FramesCounter.pde
*
* Displays the current frames and updates every second.
*/
public class FramesCounter
{
	public static final int F3_VALUE = 114;
	public static final int TILDE_VALUE = 192;

	private int currentFrames, fpsTimer;
	private boolean enabled;

	public FramesCounter()
	{
	}

	public FramesCounter(boolean enabled)
	{
		this.enabled = enabled;
	}

	public void update()
	{
		if (keyCode == TILDE_VALUE)
		{
			setEnabled(!isEnabled());
			setFpsTimer(0);
		}
	}

	public void show()
	{
		if (isEnabled())
		{
			if (getFpsTimer() >= 5)
			{
				setCurrentFrames((int)frameRate);
				setFpsTimer(0);
			}

			fill(255);
			textSize(12);

			// text(fpsTimer, 100, 100); //debug
			text(getCurrentFrames(), width - 20, height - 5);

			setFpsTimer(getFpsTimer() + 1);
		}
	}

	//
	// Getters / Setters
	//

	public int getCurrentFrames()
	{
		return this.currentFrames;
	}

	protected void setCurrentFrames(int currentFrames)
	{
		this.currentFrames = currentFrames;
	}

	public boolean isEnabled()
	{
		return this.enabled;
	}

	protected void setEnabled(boolean isEnabled)
	{
		this.enabled = isEnabled;
	}

	public int getFpsTimer()
	{
		return this.fpsTimer;
	}

	protected void setFpsTimer(int fpsTimer)
	{
		this.fpsTimer = fpsTimer;
	}
}
