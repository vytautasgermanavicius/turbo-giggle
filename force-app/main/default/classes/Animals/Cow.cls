global inherited sharing class Cow extends WalkingAnimal
{
	public void makeNoise()
	{
		moo();
	}

	public Boolean canSwim()
	{
		return false;
	}

	private void moo()
	{
		// meowing behavior here
	}
}