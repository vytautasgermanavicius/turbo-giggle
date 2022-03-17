/**
 * This class can be used as service class in triggers or any trigger framework
 */
global inherited sharing class TH_Opportunity_TotalSales
{
	public static final String WOOD_TYPE_STANDARD = 'Standard';
	public static final String WOOD_TYPE_RECYCLED = 'Recycled';

	/**
	 * Method to be called after onUpdate of Opportunity
	 *
	 * @param opportunities List<Opportunity>
	 * @param oldOpportunities Map<Id, Opportunity>
	 */
	public void updateAccountTotalSales(List<Opportunity> opportunities, Map<Id, Opportunity> oldOpportunities)
	{
		List<Opportunity> opportunitiesWithChanges = new List<Opportunity>();
		Set<Id> accountIds = getAccountIds(opportunities, oldOpportunities, opportunitiesWithChanges);
		List<Account> accounts = getAccounts(accountIds);
		Map<Id, Account> accountByIds = new Map<Id, Account> (accounts);

		for (Opportunity anOpportunity : opportunitiesWithChanges)
		{
			Opportunity oldOpportunity = (Opportunity) oldOpportunities.get(anOpportunity.Id);
			Account anAccount = accountByIds.get(anOpportunity.AccountId);
			if (anAccount != null) // just in case
			{
				// remove old amount value
				if (oldOpportunity.Wood_type__c == WOOD_TYPE_STANDARD)
				{
					anAccount.Total_Sales_Standard_Wood__c -= oldOpportunity.Amount;
				}
				else if (oldOpportunity.Wood_type__c == WOOD_TYPE_RECYCLED)
				{
					anAccount.Total_Sales_Recycled_Wood__c -= oldOpportunity.Amount;
				}

				// add new amount value
				if (anOpportunity.Wood_type__c == WOOD_TYPE_STANDARD)
				{
					anAccount.Total_Sales_Standard_Wood__c += anOpportunity.Amount;
				}
				else if (anOpportunity.Wood_type__c == WOOD_TYPE_RECYCLED)
				{
					anAccount.Total_Sales_Recycled_Wood__c += anOpportunity.Amount;
				}
			}
		}

		update accountByIds.values();
	}

	/**
	 * Method to be called after onInsert/onUndelete of Opportunity
	 *
	 * @param opportunities List<Opportunity>
	 */
	public void increaseAccountTotalSales(List<Opportunity> opportunities)
	{
		Set<Id> accountIds = getAccountIds(opportunities);
		List<Account> accounts = getAccounts(accountIds);
		Map<Id, Account> accountByIds = new Map<Id, Account> (accounts);

		for (Opportunity anOpportunity : opportunities)
		{
			Account anAccount = accountByIds.get(anOpportunity.AccountId);
			if (anAccount != null) // just in case
			{
				// add new amount value
				if (anOpportunity.Wood_type__c == WOOD_TYPE_STANDARD)
				{
					anAccount.Total_Sales_Standard_Wood__c += anOpportunity.Amount;
				}
				else if (anOpportunity.Wood_type__c == WOOD_TYPE_RECYCLED)
				{
					anAccount.Total_Sales_Recycled_Wood__c += anOpportunity.Amount;
				}
			}
		}

		update accountByIds.values();
	}

	/**
	 * Method to be called after onDelete of Opportunity
	 *
	 * @param opportunities List<Opportunity>
	 * @param oldOpportunities Map<Id, Opportunity>
	 */
	public void updateAccountTotalSales(List<Opportunity> opportunities)
	{
		Set<Id> accountIds = getAccountIds(opportunities);
		List<Account> accounts = getAccounts(accountIds);
		Map<Id, Account> accountByIds = new Map<Id, Account> (accounts);

		for (Opportunity anOpportunity : opportunities)
		{
			Account anAccount = accountByIds.get(anOpportunity.AccountId);
			if (anAccount != null) // just in case
			{
				// remove old amount value
				if (anOpportunity.Wood_type__c == WOOD_TYPE_STANDARD)
				{
					anAccount.Total_Sales_Standard_Wood__c -= anOpportunity.Amount;
				}
				else if (anOpportunity.Wood_type__c == WOOD_TYPE_RECYCLED)
				{
					anAccount.Total_Sales_Recycled_Wood__c -= anOpportunity.Amount;
				}
			}
		}

		update accountByIds.values();
	}

	private Set<Id> getAccountIds(List<Opportunity> opportunities)
	{
		Set<Id> accountIds = new Set<Id>();
		for (Opportunity opportunity : opportunities)
		{
			accountIds.add(opportunity.AccountId);
		}
		return accountIds;
	}

	private Set<Id> getAccountIds(
			List<Opportunity> opportunities,
			Map<Id, Opportunity> oldOpportunities,
			List<Opportunity> opportunitiesWithChanges
	)
	{
		Set<Id> accountIds = new Set<Id>();
		for (Opportunity anOpportunity : opportunities)
		{
			Opportunity oldOpportunity = (Opportunity) oldOpportunities.get(anOpportunity.Id);
			if (
					oldOpportunity.Amount != anOpportunity.Amount
							|| oldOpp.Wood_Type__c != anOpportunity.Wood_Type__c
			)
			{
				accountIds.add(opportunity.AccountId);
				opportunitiesWithChanges.add(opportunity);
			}
		}
		return accountIds;
	}


	//TODO move to DAL class
	public static List<Account> getAccounts(Set<Id> accountIds)
	{
		return [
				SELECT
						Id,
						Total_Sales_Recycled_Wood__c,
						Total_Sales_Standard_Wood__c
				FROM Account
				WHERE
						Id IN: accountIds
		];
	}
}

