global inherited sharing class Horse implements IAnimal
{
	public void makeNoise()
	{
		neigh();
	}

	public void move()
	{
		slide();
	}

	public Boolean canSwim()
	{
		return false;
	}

	private void neigh()
	{
		// neighing behavior here
	}

	private void slide()
	{
		// sliding behavior here
	}
}