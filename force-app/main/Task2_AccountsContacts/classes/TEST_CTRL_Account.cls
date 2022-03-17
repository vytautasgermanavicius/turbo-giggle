@IsTest
public class TEST_CTRL_Account
{

	@IsTest
	static void test_getFilteredAccounts()
	{
		Account account = new Account(Name = 'Test');
		insert account;

		Test.startTest();

		List<Account> accounts = CTRL_Accounts.getFilteredAccounts();

		Test.stopTest();

		System.assertEquals(1, accounts.size());
	}

	@IsTest
	static void test_getAccountContacts()
	{
		Account account = new Account(Name = 'Test');
		insert account;

		Contact aContact = new Contact(
				AccountId = account.Id,
				LastName = 'Contact last name'
		);
		insert aContact;

		Test.startTest();

		List<Contact> contacts = CTRL_Accounts.getAccountContacts(account.Id);

		Test.stopTest();

		System.assertEquals(1, contacts.size());
	}
}