public class CTRL_Accounts
{
	@AuraEnabled(Cacheable=true)
	public static List<Account> getFilteredAccounts()
	{
		//TODO Add logic, how accounts are selected/filters. Selecting all contacts is against saleforce best practices.
		// It may end with hitting of DML limits.
		return
		[
				SELECT
						Id,
						Name
				FROM Account
				LIMIT 50000
		];
	}

	@AuraEnabled(Cacheable=true)
	public static List<Contact> getContactsByAccountId(Id accountId)
	{
		return
		[
				SELECT
						Id,
						Name,
						Account.Name
				FROM Contact
				WHERE
						AccountId = :accountId
				LIMIT 50000
		];
	}
}