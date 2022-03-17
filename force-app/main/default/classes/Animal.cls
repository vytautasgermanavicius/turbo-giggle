global inherited sharing class Animal
{

	private IAnimal innerAnimal;
	/**
	 * animalType is global, this may mean that it is shapeshifting animal. To maintain this behaviour, we have to have
	 *  setter which will update.
	 */
	global String animalType
	{
		set
		{
			if (animalType != value)
			{
				innerAnimal = doShapeShift(value);
			}
			animalType = value;
		}
		get;
	}

	public Animal(String animalType)
	{
		this.animalType = animalType;
	}

	/**
	 * @param newAnimalType String
	 *
	 * @return IAnimal
	 */
	private static IAnimal doShapeShift(String newAnimalType)
	{
		if (newAnimalType == 'Lion')
		{
			return new Lion();
		}
		if (newAnimalType == 'Cat')
		{
			return new Cat();
		}
		if (newAnimalType == 'Horse')
		{
			return new Horse();
		}
		if (newAnimalType == 'Alligator')
		{
			return new Alligator();
		}
		if (newAnimalType == 'Bear')
		{
			return new Bear();
		}
		if (newAnimalType == 'Cow')
		{
			return new Cow();
		}
		if (newAnimalType == 'Dog')
		{
			return new Dog();
		}

		// this is to maintain previous behavior: if animal is unknown, it does not fail but does nothing,
		return new DeadAnimal();
	}

	public void makeNoise()
	{
		innerAnimal.makeNoise();
	}

	public void move()
	{
		innerAnimal.move();
	}

	public void swim()
	{
		if (innerAnimal.canSwim())
		{
			doSwim();
		}
	}

	public void doSwim()
	{
		// swimming behavior here
	}

	/**
	 * this is to maintain previous behavior: if animal is unknown, it does not fail but does nothing.
	 */
	class DeadAnimal implements IAnimal
	{
		public void makeNoise()
		{
			// does nothing
		}

		public void move()
		{
			// does nothing
		}

		public Boolean canSwim()
		{
			return false;
		}
	}
}

