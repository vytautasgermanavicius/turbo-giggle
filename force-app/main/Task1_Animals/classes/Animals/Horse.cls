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

	public void neigh()
	{
		// neighing behavior here
	}

	public void slide()
	{
		// sliding behavior here
	}
}