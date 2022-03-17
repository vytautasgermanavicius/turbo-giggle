global inherited sharing abstract class RunningAnimal implements IAnimal
{
	public void move()
	{
		run();
	}

	private void run()
	{
		// walking behavior here
	}
}